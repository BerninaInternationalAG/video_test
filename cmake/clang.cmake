# toolchain file to compile with clang from a linux host
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# skip compiler check
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

set(triple arm-cortexa9_neon-linux-gnueabihf)

set(CMAKE_C_COMPILER clang)
set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_CXX_COMPILER_TARGET ${triple})

# try to use sysroot located on the linux filesystem as this is much faster
if(EXISTS /opt/arm-cortexa9_neon-linux-gnueabihf/arm-cortexa9_neon-linux-gnueabihf/sysroot)
  set(CMAKE_SYSROOT /opt/arm-cortexa9_neon-linux-gnueabihf/arm-cortexa9_neon-linux-gnueabihf/sysroot)
else()
  set(CMAKE_SYSROOT /mnt/c/arm-cortexa9_neon-linux-gnueabihf/arm-cortexa9_neon-linux-gnueabihf/sysroot)
endif()
message("using sysroot: ${CMAKE_SYSROOT}")
set(Qt5_DIR ${CMAKE_SYSROOT}/lib/arm-linux-gnueabihf/cmake/Qt5)

# add include_directories from sysroot which are not found by clang
include_directories(
  SYSTEM 
  "${CMAKE_SYSROOT}/usr/include"
  "${CMAKE_SYSROOT}/usr/include/c++/10"
  "${CMAKE_SYSROOT}/usr/include/arm-linux-gnueabihf/c++/10"
  "${CMAKE_SYSROOT}/usr/include/opencv4"
  )

# add include_directories which are not found by clang
link_directories(SYSTEM "${CMAKE_SYSROOT}/usr/lib/gcc/arm-linux-gnueabihf/10")

# add include_directories located in host sysroot link_directories(SYSTEM
# "${CMAKE_SYSROOT}/../host/usr/lib/gcc-cross/arm-linux-gnueabihf/10" )

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

add_link_options("-fuse-ld=lld" "--gcc-toolchain=${CMAKE_SYSROOT}/../..")
