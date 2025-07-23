# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/Users/iandownie/Documents/esp/esp-idf/components/bootloader/subproject"
  "/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/bootloader"
  "/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/bootloader-prefix"
  "/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/bootloader-prefix/tmp"
  "/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/bootloader-prefix/src/bootloader-stamp"
  "/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/bootloader-prefix/src"
  "/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/Users/iandownie/Documents/esp/esp-idf/examples/Example_projects/Acc_GPSBIN_SD_SIM_TASKS_RBUF_PEDRO/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
