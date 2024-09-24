# CMake minimum version requirement
cmake_minimum_required(VERSION 3.14)

# Project name and version
project(MyProject VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_AUTORCC_EXECUTABLE /usr/bin/rcc)

find_package(Qt5 REQUIRED COMPONENTS Core Gui Qml Quick)

# Add the executable
add_executable(play_video main.cpp qml.qrc)

set_target_properties(play_video PROPERTIES AUTORCC TRUE)

target_include_directories(play_video SYSTEM PRIVATE
    ${CMAKE_SYSROOT}/usr/include/arm-linux-gnueabihf/qt5/QtGui
    ${CMAKE_SYSROOT}/usr/include/arm-linux-gnueabihf/qt5
    ${CMAKE_SYSROOT}/usr/include/arm-linux-gnueabihf/qt5/QtQml
)

# Find the Qt5 package
# find_package(Qt5 COMPONENTS Core Gui Widgets REQUIRED)
# Link the required Qt libraries
target_link_libraries(play_video PRIVATE Qt5Core Qt5Gui Qt5Qml Qt5Quick)
# /opt/arm-cortexa9_neon-linux-gnueabihf/arm-cortexa9_neon-linux-gnueabihf/sysroot/usr/lib/arm-linux-gnueabihf/libQt5Core.so
