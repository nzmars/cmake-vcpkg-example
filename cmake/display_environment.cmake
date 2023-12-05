# for general info
message(STATUS "CMAKE_VERSION               ${CMAKE_VERSION}")
message(STATUS "CMAKE_BUILD_TYPE            ${CMAKE_BUILD_TYPE}")
#message(STATUS "CMAKE_CONFIGURATION_TYPES   ${CMAKE_CONFIGURATION_TYPES}")
message(STATUS "CMAKE_PROJECT_VERSION       ${CMAKE_PROJECT_VERSION}")

#message(STATUS "CMAKE_PREFIX_PATH           ${CMAKE_PREFIX_PATH}")
#message(STATUS "CMAKE_TOOLCHAIN_FILE        ${CMAKE_TOOLCHAIN_FILE}")
message(STATUS "CMAKE_BINARY_DIR            ${CMAKE_BINARY_DIR}")
message(STATUS "CMAKE_SOURCE_DIR            ${CMAKE_SOURCE_DIR}")
message(STATUS "RUNTIME/ARCHIVE/LIBRARY_OUTPUT_DIRECTORY   ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")

if (MSVC)
    message(STATUS "CMAKE_VS_PLATFORM_NAME      ${CMAKE_VS_PLATFORM_NAME}")
    message(STATUS "CMAKE_VS_PLATFORM_TOOLSET   ${CMAKE_VS_PLATFORM_TOOLSET}")
endif ()
splitter()
# for compiler
if (NOT "${CMAKE_C_COMPILER_ID}" STREQUAL "")
    message(STATUS "CMAKE_C_COMPILER            ${CMAKE_C_COMPILER}")
    message(STATUS "CMAKE_C_COMPILER_ID         ${CMAKE_C_COMPILER_ID}")
    message(STATUS "CMAKE_C_COMPILER_VERSION    ${CMAKE_C_COMPILER_VERSION}")
endif ()
if (NOT "${CMAKE_CXX_COMPILER_ID}" STREQUAL "")
    message(STATUS "CMAKE_CXX_COMPILER          ${CMAKE_CXX_COMPILER}")
    message(STATUS "CMAKE_CXX_COMPILER_ID       ${CMAKE_CXX_COMPILER_ID}")
    message(STATUS "CMAKE_CXX_COMPILER_VERSION  ${CMAKE_CXX_COMPILER_VERSION}")
endif ()

if (MSVC)
    message(STATUS "MSVC_VERSION                ${MSVC_VERSION}")
    message(STATUS "CMAKE_CL_64                 ${CMAKE_CL_64}")
endif ()
message(STATUS "CMAKE_GENERATOR_PLATFORM    ${CMAKE_GENERATOR_PLATFORM}")

# message(STATUS "VCPKG_TARGET_TRIPLET        ${VCPKG_TARGET_TRIPLET}")
# message(STATUS "VCPKG_INSTALLED_DIR         ${VCPKG_INSTALLED_DIR}")

message(STATUS ">  Definitions")
get_directory_property(DirDefs DIRECTORY ${CMAKE_SOURCE_DIR} COMPILE_DEFINITIONS)
foreach (d ${DirDefs})
    message(STATUS "   -D ${d}")
endforeach ()

message(STATUS "> Compiler Flags")
message(STATUS "  - CXX : ${CMAKE_CXX_FLAGS}")
message(STATUS "  - C   : ${CMAKE_C_FLAGS}")

message(STATUS "> Options: MSVC_CRTDBG=${USE_MSVC_CRTDBG}, MUREX_JSON_LOG=${DUMP_MUREX_JSON_LOG}, USE_NATIVE=${USE_NATIVE} USE_ICX_WIN32=${USE_ICX_WIN32}")
message(STATUS "> Build Options: [Equity: ${BUILD_EQ}] [QMR : ${BUILD_QMR}] [FICC : ${BUILD_FICC}]")