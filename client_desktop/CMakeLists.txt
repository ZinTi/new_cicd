cmake_minimum_required(VERSION 3.12)
project(hello LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# target_include_directories must be called after add_executable

# 查找所有源文件和头文件
file(GLOB_RECURSE HELLO_SRC CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cxx"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cc"
    src/*.ui
    src/*.qrc
)

file(GLOB_RECURSE HELLO_HEADERS CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/include/*.h"
    "${CMAKE_CURRENT_SOURCE_DIR}/include/*.hpp"
)

add_executable(${PROJECT_NAME}
    ${HELLO_SRC}
    ${HELLO_HEADERS}
)

# 查找依赖
find_package(OpenSSL REQUIRED)
find_package(grpc REQUIRED)
find_package(Qt5 REQUIRED COMPONENTS Core Gui Widgets Network)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    OpenSSL::SSL
    OpenSSL::Crypto
    grpc::grpc++
    grpc::grpc
    Qt5::Core
    Qt5::Gui
    Qt5::Widgets
    Qt5::Network
)

# Qt 自动处理 MOC、UIC 和 RCC
qt5_wrap_cpp(MOC_SRCS ${MOC_HEADERS})
qt5_wrap_ui(UIC_SRCS ${UI_FILES})
qt5_add_resources(RCC_SRCS ${RESOURCES})
