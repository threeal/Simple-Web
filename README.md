# Simple Web

A very simple, fast, multithreaded, platform independent HTTP, HTTPS, WebSocket (WS) and WebSocket Secure (WSS) server and client library implemented using C++11 and Asio (both Boost.Asio and standalone Asio can be used). Created to be an easy way to make REST resources and WebSocket endpoints available from C++ applications.

This project was created from the merge of [Simple Web Server](https://gitlab.com/eidheim/Simple-Web-Server) (version 3.0.2) and [Simple Websocket Server](https://gitlab.com/eidheim/Simple-WebSocket-Server) (version 2.0.0) as a single library to simplify the deploying of it on the Debian operating system.

## Features

* Asynchronous request and message handling
* Thread pool if needed
* Platform independent
* HTTP/1.1 supported, including persistent connections
* HTTPS supported
* WebSocket Secure support
* Chunked transfer encoding and server-sent events
* Can set timeouts for request/response and content
* Can set max request/response size
* Sending outgoing messages is thread safe
* Client creates necessary connections and perform reconnects when needed
* RFC 6455 mostly supported: text/binary frames, fragmented messages, ping-pong, connection close with status and reason.
* Timeouts, if any of SocketServer::timeout_request and SocketServer::timeout_idle are >0 (default: SocketServer::timeout_request=5 seconds, and SocketServer::timeout_idle=0 seconds; no timeout on idle connections)
* Simple way to add WebSocket endpoints using regex for path, and anonymous functions
* An easy to use WebSocket and WebSocket Secure client library
* C++ bindings to the following OpenSSL methods: Base64, MD5, SHA1, SHA256 and SHA512 (found in crypto.hpp)

## Dependencies

* Boost.Asio or standalone Asio
* OpenSSL libraries

## Updating the Library

- Clone and checkout both `Simple Web Server` and `Simple Websocket Server` to the latest release.
- Merge both header files (`*.hpp`) of the library and put it under `include/simpleweb` directory.
  > Note: both library could contains the same header files.
  > Make sure to checkout the repository on version that make both library contains the same header version, else you need to fix the conflict manually.
- Put example files including the html examples of both library under `examples` directory.
- For every source files and header files in this project, make the following changes:
  - Rename some of macro definition, `USE_STANDALONE_ASIO` to `SIMPLEWEB_USE_STANDALONE_ASIO`, `HAVE_OPENSSL` to `SIMPLEWEB_USE_STANDALONE_ASIO`, and `HAVE_OPENSSL` to `SIMPLEWEB_USE_OPENSSL`.
  - Add `simpleweb` prefix for each include of the header files, and change it format to a bracket (`<>`). _(example: rename `#include "utility.hpp"` to `#include <simpleweb/utility.hpp>`)_

## Building the Debian Package

- Create a `build` directory and move to it.
  ```bash
  $ mkdir build
  $ cd build
  ```
- Configure the Makefile rules  with `/usr` as the install prefix.
  ```bash
  $ cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  ```
- Build the library.
  ```bash
  $ make
  ```
  > Note: you could speed up the build process with specifying the job count parameter using `-jn` where `n` is number of the jobs. _(example: `$ make -j4`)_
- Create debian package using cpack.
  ```bash
  $ cpack
  ```