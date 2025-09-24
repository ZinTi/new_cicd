cmake_minimum_required(VERSION 3.12)
project(hellod LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# 设置源文件
file(GLOB_RECURSE SOURCES 
    src/*.cpp
)

# 设置头文件
file(GLOB_RECURSE HEADERS 
    include/*.h
    include/*.hpp
)

add_executable(${PROJECT_NAME} 
    ${SOURCES}
    ${HEADERS}
)

# 查找依赖
find_package(OpenSSL REQUIRED)
find_package(grpc REQUIRED)
find_package(SQLite3 REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem system thread)

# 添加 include 目录
target_include_directories(${PROJECT_NAME} PRIVATE
    include
)

# 链接依赖
target_link_libraries(${PROJECT_NAME} PRIVATE
    OpenSSL::SSL
    OpenSSL::Crypto
    grpc::grpc++
    grpc::grpc
    SQLite::SQLite3
    Boost::filesystem
    Boost::system
    Boost::thread
)
