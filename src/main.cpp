#include <asio.hpp>
#include <iostream>

#include "greeting.h"

int main() {
    asio::io_context io;
    asio::ip::tcp::endpoint ep(asio::ip::make_address("127.0.0.1"), 0);
    std::cout << greeting() << " (asio " << ASIO_VERSION << ", " << ep << ")\n";
    return 0;
}
