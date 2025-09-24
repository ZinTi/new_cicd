#include "hellod.h"

int main(int argc, char *argv[]){
    /*
    HelloD daemon;
    return daemon.run(argc, argv);*/
    std::cout << "Hello Daemon!" << std::endl;
#ifdef _WIN32
    std::cout << "Windows OS" << std::endl;
#elif __linux__
    std::cout << "Linux OS" << std::endl;
#else
    std::cout << "Other OS" << std::endl;
#endif
    return 0;
}