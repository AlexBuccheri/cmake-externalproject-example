# README

This repository demos how to build an external library with CMake's `ExternalProject_add`.
As a specific example, it clones, builds and installs [LibXC](https://tddft.org/programs/libxc/).

Note, cloning LIBXC is quite slow.

`ExternalProject_ad`d runs at build time (make), not configure time. For configure time, see [FetchContent](https://cmake.org/cmake/help/latest/module/FetchContent.html)

## Instructions

In this project's root directory:

```bash
mkdir build && cd build
# Configure build
cmake ../
# Only build the target
cmake --build . --target INTERNAL_LIBXC5
# Note, one can run this from the project root with:
# cmake --build build/ --target INTERNAL_LIBXC5
```

LIBXC is cloned into `external/`, built in  CMake's binary directort (set to `build/` in this example), but installed
in a folder that CMake adds to `external/`. This might not be best-practice, but is appropriate for the context
