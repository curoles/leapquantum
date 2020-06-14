add_executable(quantum_rng lq/demo/quantum_rng.cpp)


# After enablig testing we can do `make test`
enable_testing()

add_test(NAME test_quantum_rng
    COMMAND quantum_rng
)
