cmake_minimum_required(VERSION 3.15)
project(new_cicd VERSION 0.0.2)

# 包含平台配置
include(cmake/PlatformConfig.cmake)

# 添加子目录
add_subdirectory(service)
add_subdirectory(control)
add_subdirectory(client_desktop)

# 设置全局静态链接选项
if(WIN32)
    if(MSVC)
        set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Release>:Release>")
    elseif(MINGW)
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")
    endif()
else()
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static-libgcc -static-libstdc++")
endif()

# 设置安装规则
install(DIRECTORY ${CMAKE_BINARY_DIR}/bin/ DESTINATION bin)