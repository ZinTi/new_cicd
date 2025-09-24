cmake_minimum_required(VERSION 3.12)

project(helloctl LANGUAGES CXX)

# 设置C++17标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 搜索当前目录下的所有源文件和头文件
file(GLOB CLI_TOOLS_SOURCES
    src/*.cpp
)

file(GLOB CLI_TOOLS_HEADERS
    include/*.h
    include/*.hpp
)

# 创建可执行文件
add_executable(${PROJECT_NAME} 
    ${CLI_TOOLS_SOURCES}
    ${CLI_TOOLS_HEADERS}
)

# 查找依赖
find_package(OpenSSL REQUIRED)
find_package(grpc REQUIRED)

# 包含当前目录用于头文件查找
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)

# 链接依赖
target_link_libraries(control PRIVATE
    OpenSSL::SSL
    OpenSSL::Crypto
    grpc::grpc++
    grpc::grpc
)
