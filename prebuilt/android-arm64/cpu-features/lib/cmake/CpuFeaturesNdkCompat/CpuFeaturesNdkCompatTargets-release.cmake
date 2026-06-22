#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "CpuFeatures::ndk_compat" for configuration "Release"
set_property(TARGET CpuFeatures::ndk_compat APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(CpuFeatures::ndk_compat PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libndk_compat.a"
  )

list(APPEND _cmake_import_check_targets CpuFeatures::ndk_compat )
list(APPEND _cmake_import_check_files_for_CpuFeatures::ndk_compat "${_IMPORT_PREFIX}/lib/libndk_compat.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
