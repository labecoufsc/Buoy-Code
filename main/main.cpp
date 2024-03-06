#include <stdio.h>
#include "esp_log.h"
#include "mpu6050.h"
#include "SDcard.h"
#include "cppi2c.h"
#include <cstring>
#include "ublox7/ublox7.h"
#include "cppuart.h"
#include "SMS.h"
#include "ring_buffer.h"
#include <string.h>
#include "driver/gpio.h"



static const char *TAG1 = "MPU6050";
#define BLINK_GPIO GPIO_NUM_2

TaskHandle_t ACCELHandle;
TaskHandle_t GPSHandle;
TaskHandle_t GSMHandle;
TaskHandle_t SDGPSHandle;
TaskHandle_t SDAccelHandle;
TaskHandle_t OnceHandle;

CPPUART::Uart uart {UART_NUM_1};
CPPI2C::I2c i2c {I2C_NUM_0};
//MPU6050 device(0x68);
UBLOX7 gps(UART_NUM_1);
SDcard sdcard;
Ringbuffer RingbufGPS(4096);
Ringbuffer RingbufAccel(100000);
SMS sms;
NAV_PVT nav_pvt;

using namespace std;
char buffer[EXAMPLE_MAX_CHAR_SIZE];
char GPSword[51];
int16_t ax =0, ay =0, az =0;

// allow the SD drive to pick up from where it left off when restarted
int ACC_count_init = 0;
int GPS_count_init = 0;

// Set GPS and ACC periods as global variables so they can be accessed for metadata file
int GPS_period = 100; // read every second (measured in hundredths of a second)
float ACC_period = 4; // read every 4-hundreths of a second

static void Initialise_Task(void *arg)
{
	ESP_ERROR_CHECK(i2c.InitMaster(I2C_MASTER_SDA_IO, I2C_MASTER_SCL_IO, I2C_MASTER_FREQ_HZ, 1, 1, 0));
	ESP_LOGI(TAG1, "I2C initialized successfully");
	ESP_ERROR_CHECK(uart.uart_init(UB7_BAUD_9600, UB7_TXD, UB7_RXD, UB7_EN)); 
    ESP_ERROR_CHECK(gps.ub7_set_nav_mode(UB7_MODE_PEDESTRIAN));
    ESP_ERROR_CHECK(gps.ub7_set_message(UB7_MSG_RMC, false));
    ESP_ERROR_CHECK(gps.ub7_set_message(UB7_MSG_VTG, false));
    ESP_ERROR_CHECK(gps.ub7_set_message(UB7_MSG_GSA, false));
    ESP_ERROR_CHECK(gps.ub7_set_message(UB7_MSG_GLL, false));
    ESP_ERROR_CHECK(gps.ub7_set_message(UB7_MSG_GSV, false));
	ESP_ERROR_CHECK(gps.ub7_set_message(UB7_MSG_GGA, false));
    ESP_ERROR_CHECK(gps.ub7_set_output_rate(UB7_OUTPUT_1HZ));
	gpio_pulldown_dis(GPIO_NUM_5);
    gpio_pullup_en(GPIO_NUM_5);
	ESP_ERROR_CHECK(sdcard.SDcard_init());
	gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);
	
	sms.GSM_init();

	/*int search_counter = 0;
	char search_name[30];
	
	sprintf(search_name, MOUNT_POINT"/ACC%d.txt", search_counter);
	printf("Access is: %d\n", access(search_name, F_OK) ); // this gives -1
	while (access(search_name, F_OK) == 0) {
		search_counter++;
		sprintf(search_name, MOUNT_POINT"/ACC%d.txt", search_counter);
	}

	ACC_count_init = search_counter;
	printf("search_counter: %d\n", search_counter);

	search_counter = 0;

	sprintf(search_name, MOUNT_POINT"/GPS%d.txt", search_counter);
	printf("Access is: %d\n", access(search_name, F_OK) ); // this gives -1
	while (access(search_name, F_OK) == 0) {
		search_counter++;
		sprintf(search_name, MOUNT_POINT"/GPS%d.txt", search_counter);
	}

	GPS_count_init = search_counter;
	printf("search_counter: %d\n", search_counter);
	*/

	sdcard.s_example_init_file_counter(ACC_count_init, GPS_count_init);
	printf("ACC_counter: %d\n", ACC_count_init);
	printf("GPS_counter: %d\n", GPS_count_init);
	
	vTaskDelay(5000/portTICK_PERIOD_MS); // wait for GPS initialisation to complete
	vTaskDelete(NULL);
}

// Create the task
void Once_Task(void *arg)
{
	TaskHandle_t InitialiseHandle;
	xTaskCreate(Initialise_Task, "Initialise_Task", 4096, NULL, 10, &InitialiseHandle);
	vTaskDelay(500/portTICK_PERIOD_MS);
	vTaskDelete(NULL);
}

void ACCEL_Task(void *arg)
{	
	MPU6050 device(0x68);
	static int time_counter = 0;
	//float ax, ay, az; //Variables to store the accel values
	//float gx, gy, gz; //Variables to store the gyro values
 	TickType_t xLastWakeTime;
 	const TickType_t xFrequency = ACC_period; 
    // Initialise the xLastWakeTime variable with the current time.
    xLastWakeTime = xTaskGetTickCount();
    for( ;; )
    {
        // Wait for the next cycle.
        vTaskDelayUntil(&xLastWakeTime, xFrequency);
		if(time_counter == 0){
			snprintf(buffer, EXAMPLE_MAX_CHAR_SIZE, "%u,%u,%u,%u,%u,%d\n", nav_pvt.hour, nav_pvt.minute, nav_pvt.second, nav_pvt.day, nav_pvt.month, nav_pvt.year);
			RingbufAccel.send(buffer, sizeof(buffer));
		}
		device.getAccelRaw(&ax, &ay, &az);
		//device.getGyroRaw(&gx, &gy, &gz);
		cout << "Accelerometer Readings: X: " << ax << ", Y: " << ay << ", Z: " << az << "\n";
		//cout << "Gyroscope Readings: X: " << gx << ", Y: " << gy << ", Z: " << gz << "\n";
        snprintf(buffer, 100, "%d, %d, %d\n", ax, ay, az);
		RingbufAccel.send(buffer, sizeof(buffer));
		if(time_counter == 749){ // it was 299 for 300 in 30 s now it's 749  for 750 in 30 s (25*30)
			time_counter = 0;
			snprintf(buffer, EXAMPLE_MAX_CHAR_SIZE, "%u,%u,%u,%u,%u,%d\n", nav_pvt.hour, nav_pvt.minute, nav_pvt.second, nav_pvt.day, nav_pvt.month, nav_pvt.year);
			RingbufAccel.send(buffer, sizeof(buffer));
		}
		else
			time_counter++;
	}
}

void GPS_Task(void *arg)
{
	int length = 0;
	
	TickType_t xLastWakeTime;
 	const TickType_t xFrequency = GPS_period; // read GPS every second
    // Initialise the xLastWakeTime variable with the current time.
    xLastWakeTime = xTaskGetTickCount();
    for( ;; )
    {
        // Wait for the next cycle.
        vTaskDelayUntil( &xLastWakeTime, xFrequency);
		uint8_t msg_vec[8] = {0xB5, 0x62, 0x01, 0x07, 0x00, 0x00, 0x08, 0x19};
		uart_write_bytes(UART_NUM_1, (char*)msg_vec, sizeof(msg_vec));
		uart_get_buffered_data_len(UART_NUM_1, (size_t*)&length);
		//printf("Length: %d\n", length);
		u_int8_t GPSdata[length];
		uart_read_bytes(UART_NUM_1, &GPSdata, length, 100);
		gps.parseNAV_PVT(GPSdata, nav_pvt);
		/*
		uart_get_buffered_data_len(UART_NUM_1, (size_t*)&length);
		char GPSdata[length];
		uart_read_bytes(UART_NUM_1, &GPSdata, length, 100);
    	cout << "Data: " << GPSdata << "\n";
		char str[] = "$GPRMC,105954.000,A,3150.6731,N,11711.9399,E,0.00,96.10,250313,,,A*53";
		gps.parseGPRMC(GPSdata, gprmc);
		*/
		snprintf(GPSword, length, "%u,%u,%u,%u,%u,%d,%ld,%ld,%ld,%ld\n", nav_pvt.hour, nav_pvt.minute, nav_pvt.second, nav_pvt.day, nav_pvt.month, nav_pvt.year, nav_pvt.latitude, nav_pvt.longitude, nav_pvt.north_velocity, nav_pvt.east_velocity);
		printf("SMS is: %s\n", GPSword);
		RingbufGPS.send(GPSword, length);
	}
}

void GSM_Task(void *arg) // number can be changed in sim800l/include/sim800l_cmds
{
	int length = 0;
	uint8_t CTRL_Z[]={0x1a}; 
	TickType_t xLastWakeTime;
 	const TickType_t xFrequency = 30000; // send message every 30 seconds
    // Initialise the xLastWakeTime variable with the current time.
    xLastWakeTime = xTaskGetTickCount();
    for( ;; )
    {
        // Wait for the next cycle.
        vTaskDelayUntil( &xLastWakeTime, xFrequency);
		//uart_get_buffered_data_len(UART_NUM_1, (size_t*)&length);
		//uint8_t GPSdata[length];
		//uart_read_bytes(UART_NUM_1, &GPSdata, length, 100);
		runSingleGSMCommand(&confTEXT);
		runSingleGSMCommand(&confSETUP);
		runSingleGSMCommand(&confPHONENUMBER);
		
		printf("SMS Sent is: %s\n", GPSword);
		uart_write_bytes(UART_NUM_2, &GPSword, size(GPSword));
		uart_write_bytes(UART_NUM_2, CTRL_Z, sizeof(CTRL_Z)); // return to send message
		uart_wait_tx_done(UART_NUM_2, 200 / portTICK_PERIOD_MS);
	}
}

void SD_TaskGPS(void *arg)
{	
	static int counter = GPS_count_init;
	char filename[50];
	esp_err_t ret;
	TickType_t xLastWakeTime;
	const TickType_t xFrequency = 3000; // write every 30 seconds
	size_t item_size;
    // Initialise the xLastWakeTime variable with the current time.
    xLastWakeTime = xTaskGetTickCount();
    for( ;; )
    {
        // Wait for the next cycle.
        vTaskDelayUntil(&xLastWakeTime, xFrequency);
		sprintf(filename, MOUNT_POINT"/GPS%d.txt", counter);
		const char *file_hello = filename;
		counter++;
		for(int i = 0; i < 30; i++){
		gpio_set_level(BLINK_GPIO, 1);
		char *item = (char *)RingbufGPS.receive(&item_size);
		RingbufGPS.returnItem(item);
		ret = sdcard.s_example_write_file(file_hello, item);
        	if (ret != ESP_OK) {
             	return;
        	}
		}
		printf("Counter: %d\n", counter);
		gpio_set_level(BLINK_GPIO, 0);

		if(counter == GPS_count_init+1) // create metafile after 5 minutes
		{
			sprintf(filename, MOUNT_POINT"/dep%d.txt", counter);
			const char *file_hello = filename;
			ret = sdcard.s_example_write_file(file_hello, GPSword);

			char item1[20];
			sprintf(item1, "GPS period: %d ms\n", GPS_period*10);
			ret = sdcard.s_example_write_file(file_hello, item1);
			sprintf(item1, "ACC period: %d ms\n", (int)ACC_period*10);
			ret = sdcard.s_example_write_file(file_hello, item1);
			char item2[20];	
			sprintf(item2, "Phone number: %s\n", confPHONENUMBER.cmd);
			ret = sdcard.s_example_write_file(file_hello, item2);
		}
	}
}

void SD_TaskAccel(void *arg)
{	
	static int counter = ACC_count_init;
	char filename[50];
	esp_err_t ret;
	TickType_t xLastWakeTime;
	const TickType_t xFrequency = 3000; // write every 30 seconds
	size_t item_size;
    // Initialise the xLastWakeTime variable with the current time.
    xLastWakeTime = xTaskGetTickCount();
	
    for( ;; )
    {
        // Wait for the next cycle.
        vTaskDelayUntil(&xLastWakeTime, xFrequency);
		sprintf(filename, MOUNT_POINT"/ACC%d.txt", counter);
		const char *file_hello = filename;
		counter++;
		for(int i = 0; i < 752; i++){
		gpio_set_level(BLINK_GPIO, 1);
		char *item = (char *)RingbufAccel.receive(&item_size);
		RingbufAccel.returnItem(item);
		ret = sdcard.s_example_write_file(file_hello, item);
        	if (ret != ESP_OK) {
             	return;
        	}
		}
		gpio_set_level(BLINK_GPIO, 0);
	}
	
}


extern "C" void app_main(void)
{	
	TaskHandle_t OnceHandle1 = NULL;
	xTaskCreate(Once_Task, "Once_Task", 4096, NULL, 28, &OnceHandle1);
	vTaskDelay(20000/portTICK_PERIOD_MS); // wait for initialisation to complete
		
	xTaskCreatePinnedToCore(ACCEL_Task, "ACCEL_Task", 4096, NULL, 10, &ACCELHandle, 0);
	xTaskCreatePinnedToCore(GPS_Task, "GPS_Task", 4096, NULL, 10, &GPSHandle, 1);
	xTaskCreatePinnedToCore(GSM_Task, "Gsm_Task", 4096, NULL, 15, &GSMHandle, 1);
	xTaskCreatePinnedToCore(SD_TaskGPS, "SD_TaskGPS", 4096, NULL, 10, &SDGPSHandle, 1);
	xTaskCreatePinnedToCore(SD_TaskAccel, "SD_TaskAccel", 4096, NULL, 10, &SDAccelHandle, 1);
}