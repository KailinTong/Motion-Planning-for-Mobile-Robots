cmake_minimum_required(VERSION 3.15)
project(src)

set(CMAKE_CXX_STANDARD 14)

add_executable(src
    read_only/JPS_searcher.cpp
    read_only/JPS_utils.cpp
    Astar_searcher.cpp
    demo_node.cpp
    graph_searcher.cpp
    random_complex_generator.cpp)
