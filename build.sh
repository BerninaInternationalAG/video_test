#!/bin/bash

cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=on -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_COLOR_DIAGNOSTICS=ON --toolchain cmake/clang.cmake -GNinja -S . -B build
cmake --build build
