# 平台检测和通用配置脚本
# 1. 检测目标平台：操作系统和编译器
# 2. 设置编译器选项，如 静态链接
# 3. 包含工具链文件

# 平台检测和配置
if(WIN32)
    add_definitions(-DWIN32_LEAN_AND_MEAN)
    
    if(MSVC)
        set(PLATFORM_NAME "windows-msvc")
        include(${CMAKE_CURRENT_LIST_DIR}/Toolchain-MSVC.cmake)
    elseif(MINGW)
        set(PLATFORM_NAME "windows-mingw")
        include(${CMAKE_CURRENT_LIST_DIR}/Toolchain-MinGW.cmake)
    endif()
elseif(UNIX)
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        set(PLATFORM_NAME "linux-clang")
        include(${CMAKE_CURRENT_LIST_DIR}/Toolchain-Clang.cmake)
    else()
        set(PLATFORM_NAME "linux-gcc")
        include(${CMAKE_CURRENT_LIST_DIR}/Toolchain-GCC.cmake)
    endif()
endif()

# 设置输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# 设置静态链接选项
set(BUILD_SHARED_LIBS OFF)
