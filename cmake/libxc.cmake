find_package(Libxc 5.0.0 COMPONENTS Fortran)

If (NOT Libxc_FOUND)
  message("-- LibXC not found on the system. LibXC 5.2.3 will be downloaded, built and installed at compile time")

  # Define libXC root and install directories
  set(libXCRoot "${CMAKE_SOURCE_DIR}/external/libXC5")
  set(libXCBuild "${CMAKE_BINARY_DIR}/libxc_build_dir")
  set(libXCInstall "${libXCRoot}/install_dir")

  # Make build and installation directory and any parents
  file(MAKE_DIRECTORY ${libXCBuild})
  file(MAKE_DIRECTORY ${libXCInstall})

  # Clone libXC, build with CMake and install
  include(ExternalProject)
  ExternalProject_Add(INTERNAL_LIBXC5
    DOWNLOAD_EXTRACT_TIMESTAMP OLD
    GIT_REPOSITORY https://github.com/ElectronicStructureLibrary/libxc.git    # Repo https
    GIT_TAG 5.1.4                  # Specify version
    GIT_SHALLOW    TRUE            # git clone --depth 1 to avoid downloading the whole history
    GIT_PROGRESS   TRUE            # Report progress of git clone. More verbose CMake output
    SOURCE_DIR     ${libXCRoot}    # Location to download/clone to
    BUILD_ALWAYS   TRUE
    BINARY_DIR     ${libXCBuild}
    CMAKE_ARGS     -DCMAKE_INSTALL_PREFIX=${libXCInstall} -DENABLE_FORTRAN=ON  -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Release # Add more flags, as required
  )
endif()
