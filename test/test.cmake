add_executable (test_bits test/test_bits.cpp)


# After enablig testing we can do `make test`
enable_testing()

add_test(NAME test_bits
    COMMAND test_bits
)
