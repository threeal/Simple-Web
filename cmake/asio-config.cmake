set(USE_ASIO)

target_compile_definitions(simpleweb INTERFACE SIMPLEWEB_USE_STANDALONE_ASIO)
find_path(ASIO_PATH asio.hpp)
if(NOT ASIO_PATH)
    message(FATAL_ERROR "Standalone Asio not found")
else()
    target_include_directories(simpleweb INTERFACE ${ASIO_PATH})
endif()