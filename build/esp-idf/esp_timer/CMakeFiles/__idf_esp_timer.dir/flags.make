# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# compile C with /Users/iandownie/.espressif/tools/xtensa-esp32-elf/esp-12.2.0_20230208/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
C_DEFINES = -DESP_PLATFORM -DIDF_VER=\"v5.1-dev-4557-gf404fe96b1\" -DSOC_MMU_PAGE_SIZE=CONFIG_MMU_PAGE_SIZE -D_GNU_SOURCE -D_POSIX_READER_WRITER_LOCKS

C_INCLUDES = -I/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/config -I/Users/iandownie/Documents/esp/esp-idf/components/esp_timer/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_timer/private_include -I/Users/iandownie/Documents/esp/esp-idf/components/newlib/platform_include -I/Users/iandownie/Documents/esp/esp-idf/components/freertos/FreeRTOS-Kernel/include -I/Users/iandownie/Documents/esp/esp-idf/components/freertos/FreeRTOS-Kernel/portable/xtensa/include -I/Users/iandownie/Documents/esp/esp-idf/components/freertos/esp_additions/include/freertos -I/Users/iandownie/Documents/esp/esp-idf/components/freertos/esp_additions/include -I/Users/iandownie/Documents/esp/esp-idf/components/freertos/esp_additions/arch/xtensa/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_hw_support/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_hw_support/include/soc -I/Users/iandownie/Documents/esp/esp-idf/components/esp_hw_support/include/soc/esp32 -I/Users/iandownie/Documents/esp/esp-idf/components/esp_hw_support/port/esp32/. -I/Users/iandownie/Documents/esp/esp-idf/components/esp_hw_support/port/esp32/private_include -I/Users/iandownie/Documents/esp/esp-idf/components/heap/include -I/Users/iandownie/Documents/esp/esp-idf/components/log/include -I/Users/iandownie/Documents/esp/esp-idf/components/soc/include -I/Users/iandownie/Documents/esp/esp-idf/components/soc/esp32 -I/Users/iandownie/Documents/esp/esp-idf/components/soc/esp32/include -I/Users/iandownie/Documents/esp/esp-idf/components/hal/esp32/include -I/Users/iandownie/Documents/esp/esp-idf/components/hal/include -I/Users/iandownie/Documents/esp/esp-idf/components/hal/platform_port/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_rom/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_rom/include/esp32 -I/Users/iandownie/Documents/esp/esp-idf/components/esp_rom/esp32 -I/Users/iandownie/Documents/esp/esp-idf/components/esp_common/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_system/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_system/port/soc -I/Users/iandownie/Documents/esp/esp-idf/components/esp_system/port/include/private -I/Users/iandownie/Documents/esp/esp-idf/components/xtensa/include -I/Users/iandownie/Documents/esp/esp-idf/components/xtensa/esp32/include -I/Users/iandownie/Documents/esp/esp-idf/components/lwip/include -I/Users/iandownie/Documents/esp/esp-idf/components/lwip/include/apps -I/Users/iandownie/Documents/esp/esp-idf/components/lwip/include/apps/sntp -I/Users/iandownie/Documents/esp/esp-idf/components/lwip/lwip/src/include -I/Users/iandownie/Documents/esp/esp-idf/components/lwip/port/include -I/Users/iandownie/Documents/esp/esp-idf/components/lwip/port/freertos/include -I/Users/iandownie/Documents/esp/esp-idf/components/lwip/port/esp32xx/include -I/Users/iandownie/Documents/esp/esp-idf/components/lwip/port/esp32xx/include/arch -I/Users/iandownie/Documents/esp/esp-idf/components/driver/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/deprecated -I/Users/iandownie/Documents/esp/esp-idf/components/driver/analog_comparator/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/dac/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/gpio/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/gptimer/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/i2c/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/i2s/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/ledc/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/mcpwm/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/parlio/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/pcnt/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/rmt/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/sdio_slave/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/sdmmc/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/sigma_delta/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/spi/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/temperature_sensor/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/touch_sensor/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/twai/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/uart/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/usb_serial_jtag/include -I/Users/iandownie/Documents/esp/esp-idf/components/driver/touch_sensor/esp32/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_pm/include -I/Users/iandownie/Documents/esp/esp-idf/components/esp_ringbuf/include

C_FLAGS = -mlongcalls -Wno-frame-address  -g -fdiagnostics-color=always -ffunction-sections -fdata-sections -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-variable -Wno-error=unused-but-set-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -Wno-enum-conversion -gdwarf-4 -ggdb -Og -fmacro-prefix-map=/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO=. -fmacro-prefix-map=/Users/iandownie/Documents/esp/esp-idf=/IDF -fstrict-volatile-bitfields -fno-jump-tables -fno-tree-switch-conversion -DconfigENABLE_FREERTOS_DEBUG_OCDAWARE=1 -std=gnu17 -Wno-old-style-declaration
