# Buoy_Code
Code for buoy data collection and transmission on FreeRTOS in C++. The code reads accelerometer and GNSS module, temporarily stores the data in buffer before it is transferred to SD card. Longitude and latitude information is transmitted over G2 network. Peripheral communcation is conducted with UART, I2C and SPI.
