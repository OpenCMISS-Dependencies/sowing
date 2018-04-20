cmake_minimum_required(VERSION 3.1)
project(SOWING VERSION 1.1.16 LANGUAGES C)

set(PACKAGE_CONFIG_DIR "lib/cmake" CACHE STRING "Directory for package config files (relative to CMAKE_INSTALL_PREFIX)")
option(MEMORY_TRACING "Define if memory tracing is desired" NO)
option(MEMORY_TRACING_REQUIRED "Define if memory tracing is required" NO)
option(RESTRICT_KEYWORD "Specify C99 restrict keyword (if not directly supported)" __restrict)
SET(PACKAGE_NAME Sowing)
SET(PACKAGE_STRING ${PACKAGE_NAME}-${SOWING_VERSION})

# checks
include(CheckFunctionExists)
CHECK_FUNCTION_EXISTS(_doprnt HAVE_DOPRNT)
CHECK_FUNCTION_EXISTS(getcwd HAVE_GETCWD)
CHECK_FUNCTION_EXISTS(gethostname HAVE_GETHOSTNAME)
CHECK_FUNCTION_EXISTS(getwd HAVE_GETWD)
CHECK_FUNCTION_EXISTS(mkdir HAVE_MKDIR)
CHECK_FUNCTION_EXISTS(readlink HAVE_READLINK)
CHECK_FUNCTION_EXISTS(realpath HAVE_REALPATH)
CHECK_FUNCTION_EXISTS(sysinfo HAVE_SYSINFO)
CHECK_FUNCTION_EXISTS(vprintf HAVE_VPRINTF)

include(CheckIncludeFile)
SET(searchheaders fcntl inttypes memory netdb pwd stdint stdlib strings string
 sys/param sys/stat sys/systeminfo sys/time sys/types time unistd io)
foreach(HDR ${searchheaders})
    STRING(TOUPPER ${HDR} HDR_UPPER)
    STRING(REPLACE "/" "_" HDR_UPPER ${HDR_UPPER})
    SET(VARNAME "HAVE_${HDR_UPPER}_H")
    CHECK_INCLUDE_FILE("${HDR}.h" ${VARNAME}) 
endforeach()

include(CheckIncludeFiles)
CHECK_INCLUDE_FILES("sys/time.h;time.h" TIME_WITH_SYS_TIME)

#if (NOT WIN32)
#    include(CheckSymbolExists)
#    SET(checksymb gid_t uid_t size_t)
#    foreach(symb ${checksymb})
#        CHECK_SYMBOL_EXISTS(${symb} sys/types.h HAVE_${symb})
#        if(NOT HAVE_${symb})
#            SET(${symb} 1)
#        endif()
#    endforeach()
#endif()
# Appears unused in code
#CHECK_SYMBOL_EXISTS(tm sys/time.h TM_IN_SYS_TIME)

# Look for restrict support
include(CheckCSourceCompiles)
set(RESTRICT_CODE
    "int main(void)
     {
         int* RESTRICT a;
         return 0;
     }")
set(RESTRICT_KEYWORD )     
SET(restrict_keywords __restrict__ __restrict restrict)
foreach(restrict_keyword ${restrict_keywords})
    set(CMAKE_REQUIRED_DEFINITIONS "-DRESTRICT=${restrict_keyword}")
    check_c_source_compiles("${RESTRICT_CODE}" HAVE_${restrict_keyword})
    if (HAVE_${restrict_keyword})
        set(RESTRICT_KEYWORD ${restrict_keyword})
        break()
    endif()
endforeach()
if (NOT RESTRICT_KEYWORD)
    message(FATAL_ERROR "Could not find restrict keyword support.")
endif()

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/include/sowingconfig.h.in.cmake
    ${CMAKE_CURRENT_SOURCE_DIR}/include/sowingconfig.h)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/include/patchlevel.h.in
    ${CMAKE_CURRENT_SOURCE_DIR}/include/patchlevel.h)

# libsowing
file(GLOB sowing-src src/sys/*.c)
add_library(sowing ${sowing-src})
target_include_directories(sowing PRIVATE include)
if (MINGW)
    target_compile_definitions(sowing PRIVATE __MINGW__ __MSDOS__)
    #SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99")
endif()

file(GLOB bfort-src src/bfort/*.c)
add_executable(bfort ${bfort-src})
target_link_libraries(bfort PUBLIC sowing)
target_include_directories(bfort PRIVATE include)
target_compile_options(bfort PRIVATE "-std=c99")

# INSTALL
install(TARGETS sowing EXPORT sowing-config
    DESTINATION lib
    INCLUDES DESTINATION include)
install(TARGETS bfort EXPORT sowing-config
    DESTINATION bin)
install(EXPORT sowing-config DESTINATION ${PACKAGE_CONFIG_DIR})   
include(CMakePackageConfigHelpers)
WRITE_BASIC_PACKAGE_VERSION_FILE(${CMAKE_CURRENT_BINARY_DIR}/sowing-config-version.cmake
    COMPATIBILITY AnyNewerVersion)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/sowing-config-version.cmake DESTINATION ${PACKAGE_CONFIG_DIR})
install(FILES include/sowing.h DESTINATION include)
