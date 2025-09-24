#include "main.h"

int main() {
    std::cout << "Hello, CLI tools!" << std::endl;
#ifdef _WIN32
    std::cout << "Windows OS" << std::endl;
#elif __linux__
    std::cout << "Linux OS" << std::endl;
#else
    std::cout << "Other OS" << std::endl;
#endif
    return 0;
}
