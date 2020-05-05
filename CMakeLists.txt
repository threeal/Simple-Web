cmake_minimum_required(VERSION 3.10)

project(SimpleWeb VERSION 1.1)

add_compile_options(-std=c++11 -Wall -Wextra)
if (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(-Wthread-safety)
endif()

install(DIRECTORY "include" DESTINATION ".")

configure_file("cmake/simpleweb-config.cmake.in" "simpleweb-config.cmake" @ONLY)
install(
  FILES
    "${CMAKE_BINARY_DIR}/simpleweb-config.cmake"
    "cmake/asio-config.cmake"
    "cmake/openssl-config.cmake"
  DESTINATION "lib/cmake/simpleweb"
)

install(FILES "LICENSE" DESTINATION "share/doc/libsimpleweb-dev")
install(DIRECTORY "examples" DESTINATION "share/doc/libsimpleweb-dev")

set(CPACK_GENERATOR "DEB")
set(CPACK_DEBIAN_PACKAGE_NAME "libsimpleweb-dev")
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_VERSION "${PROJECT_VERSION}")
set(CPACK_DEBIAN_PACKAGE_RELEASE 1)
set(CPACK_DEBIAN_PACKAGE_DEPENDS
  "libssl-dev (>= 1.1), libboost-filesystem-dev (>= 1.65), libboost-thread-dev (>= 1.65)"
)
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Alfi Maulana <alfi.maulana.f@gmail.com>")
set(CPACK_DEBIAN_PACKAGE_DESCRIPTION
  "A simple HTTP, HTTPS, WS and WSS server and client library
 A very simple, fast, multithreaded, platform independent HTTP, HTTPS,
 WebSocket (WS) and WebSocket Secure (WSS) server and client library implemented
 using C++11 and Asio (both Boost.Asio and standalone Asio can be used).
 Created to be an easy way to make REST resources and WebSocket endpoints
 available from C++ applications."
)
set(CPACK_DEBIAN_PACKAGE_HOMEPAGE "https://github.com/threeal/Simple-Web")

include(CPack)