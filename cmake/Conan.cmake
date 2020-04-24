macro(run_conan)
# Download automatically, you can also just copy the conan.cmake file
#if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(
    STATUS
      "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/master/conan.cmake"
       "${CMAKE_BINARY_DIR}/conan.cmake")
#endif()
include(${CMAKE_BINARY_DIR}/conan.cmake)


conan_add_remote(NAME bincrafters URL
                 https://api.bintray.com/conan/bincrafters/public-conan)

conan_cmake_run(
  REQUIRES
  ${CONAN_EXTRA_REQUIRES}
  catch2/2.11.3
  OPTIONS
  ${CONAN_EXTRA_OPTIONS}
  IMPORTS
  ${CONAN_IMPORTS}
  SETTINGS
  ${CONAN_SETTINGS}
  GENERATORS
  qt
  BASIC_SETUP
  CMAKE_TARGETS
  BUILD
  missing)
endmacro()
