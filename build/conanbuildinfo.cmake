include(CMakeParseArguments)

macro(conan_find_apple_frameworks FRAMEWORKS_FOUND FRAMEWORKS SUFFIX BUILD_TYPE)
    if(APPLE)
        if(CMAKE_BUILD_TYPE)
            set(_BTYPE ${CMAKE_BUILD_TYPE})
        elseif(NOT BUILD_TYPE STREQUAL "")
            set(_BTYPE ${BUILD_TYPE})
        endif()
        if(_BTYPE)
            if(${_BTYPE} MATCHES "Debug|_DEBUG")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_DEBUG} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "Release|_RELEASE")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELEASE} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "RelWithDebInfo|_RELWITHDEBINFO")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_RELWITHDEBINFO} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            elseif(${_BTYPE} MATCHES "MinSizeRel|_MINSIZEREL")
                set(CONAN_FRAMEWORKS${SUFFIX} ${CONAN_FRAMEWORKS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORKS${SUFFIX}})
                set(CONAN_FRAMEWORK_DIRS${SUFFIX} ${CONAN_FRAMEWORK_DIRS${SUFFIX}_MINSIZEREL} ${CONAN_FRAMEWORK_DIRS${SUFFIX}})
            endif()
        endif()
        foreach(_FRAMEWORK ${FRAMEWORKS})
            # https://cmake.org/pipermail/cmake-developers/2017-August/030199.html
            find_library(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND NAME ${_FRAMEWORK} PATHS ${CONAN_FRAMEWORK_DIRS${SUFFIX}} CMAKE_FIND_ROOT_PATH_BOTH)
            if(CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND)
                list(APPEND ${FRAMEWORKS_FOUND} ${CONAN_FRAMEWORK_${_FRAMEWORK}_FOUND})
            else()
                message(FATAL_ERROR "Framework library ${_FRAMEWORK} not found in paths: ${CONAN_FRAMEWORK_DIRS${SUFFIX}}")
            endif()
        endforeach()
    endif()
endmacro()


#################
###  NCURSES
#################
set(CONAN_NCURSES_ROOT "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326")
set(CONAN_INCLUDE_DIRS_NCURSES "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/include"
			"/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/include/ncursesw")
set(CONAN_LIB_DIRS_NCURSES "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/lib")
set(CONAN_BIN_DIRS_NCURSES "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/bin")
set(CONAN_RES_DIRS_NCURSES )
set(CONAN_SRC_DIRS_NCURSES )
set(CONAN_BUILD_DIRS_NCURSES "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/")
set(CONAN_FRAMEWORK_DIRS_NCURSES )
set(CONAN_LIBS_NCURSES panelw menuw formw ncurses++w ticw ncursesw tinfow)
set(CONAN_PKG_LIBS_NCURSES panelw menuw formw ncurses++w ticw ncursesw tinfow)
set(CONAN_SYSTEM_LIBS_NCURSES )
set(CONAN_FRAMEWORKS_NCURSES )
set(CONAN_FRAMEWORKS_FOUND_NCURSES "")  # Will be filled later
set(CONAN_DEFINES_NCURSES "-DNCURSES_STATIC")
set(CONAN_BUILD_MODULES_PATHS_NCURSES )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_NCURSES "NCURSES_STATIC")

set(CONAN_C_FLAGS_NCURSES "")
set(CONAN_CXX_FLAGS_NCURSES "")
set(CONAN_SHARED_LINKER_FLAGS_NCURSES "")
set(CONAN_EXE_LINKER_FLAGS_NCURSES "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_NCURSES_LIST "")
set(CONAN_CXX_FLAGS_NCURSES_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_NCURSES_LIST "")
set(CONAN_EXE_LINKER_FLAGS_NCURSES_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_NCURSES "${CONAN_FRAMEWORKS_NCURSES}" "_NCURSES" "")
# Append to aggregated values variable
set(CONAN_LIBS_NCURSES ${CONAN_PKG_LIBS_NCURSES} ${CONAN_SYSTEM_LIBS_NCURSES} ${CONAN_FRAMEWORKS_FOUND_NCURSES})


#################
###  RESTINIO
#################
set(CONAN_RESTINIO_ROOT "/Users/i346208/.conan/data/restinio/0.6.7/stiffstream/stable/package/a008c60d1dd14a82e47e1ef98ad5a9e638827fa6")
set(CONAN_INCLUDE_DIRS_RESTINIO "/Users/i346208/.conan/data/restinio/0.6.7/stiffstream/stable/package/a008c60d1dd14a82e47e1ef98ad5a9e638827fa6/include")
set(CONAN_LIB_DIRS_RESTINIO "/Users/i346208/.conan/data/restinio/0.6.7/stiffstream/stable/package/a008c60d1dd14a82e47e1ef98ad5a9e638827fa6/lib")
set(CONAN_BIN_DIRS_RESTINIO )
set(CONAN_RES_DIRS_RESTINIO )
set(CONAN_SRC_DIRS_RESTINIO )
set(CONAN_BUILD_DIRS_RESTINIO "/Users/i346208/.conan/data/restinio/0.6.7/stiffstream/stable/package/a008c60d1dd14a82e47e1ef98ad5a9e638827fa6/")
set(CONAN_FRAMEWORK_DIRS_RESTINIO )
set(CONAN_LIBS_RESTINIO )
set(CONAN_PKG_LIBS_RESTINIO )
set(CONAN_SYSTEM_LIBS_RESTINIO )
set(CONAN_FRAMEWORKS_RESTINIO )
set(CONAN_FRAMEWORKS_FOUND_RESTINIO "")  # Will be filled later
set(CONAN_DEFINES_RESTINIO "-DRESTINIO_EXTERNAL_EXPECTED_LITE"
			"-DRESTINIO_EXTERNAL_OPTIONAL_LITE"
			"-DRESTINIO_EXTERNAL_STRING_VIEW_LITE"
			"-DRESTINIO_EXTERNAL_VARIANT_LITE")
set(CONAN_BUILD_MODULES_PATHS_RESTINIO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_RESTINIO "RESTINIO_EXTERNAL_EXPECTED_LITE"
			"RESTINIO_EXTERNAL_OPTIONAL_LITE"
			"RESTINIO_EXTERNAL_STRING_VIEW_LITE"
			"RESTINIO_EXTERNAL_VARIANT_LITE")

set(CONAN_C_FLAGS_RESTINIO "")
set(CONAN_CXX_FLAGS_RESTINIO "")
set(CONAN_SHARED_LINKER_FLAGS_RESTINIO "")
set(CONAN_EXE_LINKER_FLAGS_RESTINIO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_RESTINIO_LIST "")
set(CONAN_CXX_FLAGS_RESTINIO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_RESTINIO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_RESTINIO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_RESTINIO "${CONAN_FRAMEWORKS_RESTINIO}" "_RESTINIO" "")
# Append to aggregated values variable
set(CONAN_LIBS_RESTINIO ${CONAN_PKG_LIBS_RESTINIO} ${CONAN_SYSTEM_LIBS_RESTINIO} ${CONAN_FRAMEWORKS_FOUND_RESTINIO})


#################
###  CATCH2
#################
set(CONAN_CATCH2_ROOT "/Users/i346208/.conan/data/catch2/2.13.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_CATCH2 "/Users/i346208/.conan/data/catch2/2.13.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_CATCH2 "/Users/i346208/.conan/data/catch2/2.13.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib")
set(CONAN_BIN_DIRS_CATCH2 )
set(CONAN_RES_DIRS_CATCH2 )
set(CONAN_SRC_DIRS_CATCH2 )
set(CONAN_BUILD_DIRS_CATCH2 "/Users/i346208/.conan/data/catch2/2.13.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/cmake/Catch2")
set(CONAN_FRAMEWORK_DIRS_CATCH2 )
set(CONAN_LIBS_CATCH2 )
set(CONAN_PKG_LIBS_CATCH2 )
set(CONAN_SYSTEM_LIBS_CATCH2 )
set(CONAN_FRAMEWORKS_CATCH2 )
set(CONAN_FRAMEWORKS_FOUND_CATCH2 "")  # Will be filled later
set(CONAN_DEFINES_CATCH2 )
set(CONAN_BUILD_MODULES_PATHS_CATCH2 )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_CATCH2 )

set(CONAN_C_FLAGS_CATCH2 "")
set(CONAN_CXX_FLAGS_CATCH2 "")
set(CONAN_SHARED_LINKER_FLAGS_CATCH2 "")
set(CONAN_EXE_LINKER_FLAGS_CATCH2 "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_CATCH2_LIST "")
set(CONAN_CXX_FLAGS_CATCH2_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_CATCH2_LIST "")
set(CONAN_EXE_LINKER_FLAGS_CATCH2_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_CATCH2 "${CONAN_FRAMEWORKS_CATCH2}" "_CATCH2" "")
# Append to aggregated values variable
set(CONAN_LIBS_CATCH2 ${CONAN_PKG_LIBS_CATCH2} ${CONAN_SYSTEM_LIBS_CATCH2} ${CONAN_FRAMEWORKS_FOUND_CATCH2})


#################
###  DOCOPT.CPP
#################
set(CONAN_DOCOPT.CPP_ROOT "/Users/i346208/.conan/data/docopt.cpp/0.6.2/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6")
set(CONAN_INCLUDE_DIRS_DOCOPT.CPP "/Users/i346208/.conan/data/docopt.cpp/0.6.2/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/include")
set(CONAN_LIB_DIRS_DOCOPT.CPP "/Users/i346208/.conan/data/docopt.cpp/0.6.2/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/lib")
set(CONAN_BIN_DIRS_DOCOPT.CPP )
set(CONAN_RES_DIRS_DOCOPT.CPP )
set(CONAN_SRC_DIRS_DOCOPT.CPP )
set(CONAN_BUILD_DIRS_DOCOPT.CPP "/Users/i346208/.conan/data/docopt.cpp/0.6.2/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/")
set(CONAN_FRAMEWORK_DIRS_DOCOPT.CPP )
set(CONAN_LIBS_DOCOPT.CPP docopt)
set(CONAN_PKG_LIBS_DOCOPT.CPP docopt)
set(CONAN_SYSTEM_LIBS_DOCOPT.CPP )
set(CONAN_FRAMEWORKS_DOCOPT.CPP )
set(CONAN_FRAMEWORKS_FOUND_DOCOPT.CPP "")  # Will be filled later
set(CONAN_DEFINES_DOCOPT.CPP )
set(CONAN_BUILD_MODULES_PATHS_DOCOPT.CPP )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_DOCOPT.CPP )

set(CONAN_C_FLAGS_DOCOPT.CPP "")
set(CONAN_CXX_FLAGS_DOCOPT.CPP "")
set(CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP "")
set(CONAN_EXE_LINKER_FLAGS_DOCOPT.CPP "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_DOCOPT.CPP_LIST "")
set(CONAN_CXX_FLAGS_DOCOPT.CPP_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_LIST "")
set(CONAN_EXE_LINKER_FLAGS_DOCOPT.CPP_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_DOCOPT.CPP "${CONAN_FRAMEWORKS_DOCOPT.CPP}" "_DOCOPT.CPP" "")
# Append to aggregated values variable
set(CONAN_LIBS_DOCOPT.CPP ${CONAN_PKG_LIBS_DOCOPT.CPP} ${CONAN_SYSTEM_LIBS_DOCOPT.CPP} ${CONAN_FRAMEWORKS_FOUND_DOCOPT.CPP})


#################
###  SPDLOG
#################
set(CONAN_SPDLOG_ROOT "/Users/i346208/.conan/data/spdlog/1.5.0/_/_/package/1bc5e726aed56fe327dcaf9510b8289eb9034ad7")
set(CONAN_INCLUDE_DIRS_SPDLOG "/Users/i346208/.conan/data/spdlog/1.5.0/_/_/package/1bc5e726aed56fe327dcaf9510b8289eb9034ad7/include")
set(CONAN_LIB_DIRS_SPDLOG "/Users/i346208/.conan/data/spdlog/1.5.0/_/_/package/1bc5e726aed56fe327dcaf9510b8289eb9034ad7/lib")
set(CONAN_BIN_DIRS_SPDLOG )
set(CONAN_RES_DIRS_SPDLOG )
set(CONAN_SRC_DIRS_SPDLOG )
set(CONAN_BUILD_DIRS_SPDLOG "/Users/i346208/.conan/data/spdlog/1.5.0/_/_/package/1bc5e726aed56fe327dcaf9510b8289eb9034ad7/")
set(CONAN_FRAMEWORK_DIRS_SPDLOG )
set(CONAN_LIBS_SPDLOG spdlog)
set(CONAN_PKG_LIBS_SPDLOG spdlog)
set(CONAN_SYSTEM_LIBS_SPDLOG )
set(CONAN_FRAMEWORKS_SPDLOG )
set(CONAN_FRAMEWORKS_FOUND_SPDLOG "")  # Will be filled later
set(CONAN_DEFINES_SPDLOG "-DSPDLOG_COMPILED_LIB"
			"-DSPDLOG_FMT_EXTERNAL")
set(CONAN_BUILD_MODULES_PATHS_SPDLOG )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_SPDLOG "SPDLOG_COMPILED_LIB"
			"SPDLOG_FMT_EXTERNAL")

set(CONAN_C_FLAGS_SPDLOG "")
set(CONAN_CXX_FLAGS_SPDLOG "")
set(CONAN_SHARED_LINKER_FLAGS_SPDLOG "")
set(CONAN_EXE_LINKER_FLAGS_SPDLOG "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_SPDLOG_LIST "")
set(CONAN_CXX_FLAGS_SPDLOG_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_SPDLOG_LIST "")
set(CONAN_EXE_LINKER_FLAGS_SPDLOG_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_SPDLOG "${CONAN_FRAMEWORKS_SPDLOG}" "_SPDLOG" "")
# Append to aggregated values variable
set(CONAN_LIBS_SPDLOG ${CONAN_PKG_LIBS_SPDLOG} ${CONAN_SYSTEM_LIBS_SPDLOG} ${CONAN_FRAMEWORKS_FOUND_SPDLOG})


#################
###  HTTP_PARSER
#################
set(CONAN_HTTP_PARSER_ROOT "/Users/i346208/.conan/data/http_parser/2.9.2/_/_/package/6d51450c2a59514630eddfc457cb85671d554dc7")
set(CONAN_INCLUDE_DIRS_HTTP_PARSER "/Users/i346208/.conan/data/http_parser/2.9.2/_/_/package/6d51450c2a59514630eddfc457cb85671d554dc7/include")
set(CONAN_LIB_DIRS_HTTP_PARSER "/Users/i346208/.conan/data/http_parser/2.9.2/_/_/package/6d51450c2a59514630eddfc457cb85671d554dc7/lib")
set(CONAN_BIN_DIRS_HTTP_PARSER )
set(CONAN_RES_DIRS_HTTP_PARSER )
set(CONAN_SRC_DIRS_HTTP_PARSER )
set(CONAN_BUILD_DIRS_HTTP_PARSER "/Users/i346208/.conan/data/http_parser/2.9.2/_/_/package/6d51450c2a59514630eddfc457cb85671d554dc7/")
set(CONAN_FRAMEWORK_DIRS_HTTP_PARSER )
set(CONAN_LIBS_HTTP_PARSER http_parser)
set(CONAN_PKG_LIBS_HTTP_PARSER http_parser)
set(CONAN_SYSTEM_LIBS_HTTP_PARSER )
set(CONAN_FRAMEWORKS_HTTP_PARSER )
set(CONAN_FRAMEWORKS_FOUND_HTTP_PARSER "")  # Will be filled later
set(CONAN_DEFINES_HTTP_PARSER )
set(CONAN_BUILD_MODULES_PATHS_HTTP_PARSER )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_HTTP_PARSER )

set(CONAN_C_FLAGS_HTTP_PARSER "")
set(CONAN_CXX_FLAGS_HTTP_PARSER "")
set(CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER "")
set(CONAN_EXE_LINKER_FLAGS_HTTP_PARSER "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_HTTP_PARSER_LIST "")
set(CONAN_CXX_FLAGS_HTTP_PARSER_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_LIST "")
set(CONAN_EXE_LINKER_FLAGS_HTTP_PARSER_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_HTTP_PARSER "${CONAN_FRAMEWORKS_HTTP_PARSER}" "_HTTP_PARSER" "")
# Append to aggregated values variable
set(CONAN_LIBS_HTTP_PARSER ${CONAN_PKG_LIBS_HTTP_PARSER} ${CONAN_SYSTEM_LIBS_HTTP_PARSER} ${CONAN_FRAMEWORKS_FOUND_HTTP_PARSER})


#################
###  FMT
#################
set(CONAN_FMT_ROOT "/Users/i346208/.conan/data/fmt/6.2.0/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6")
set(CONAN_INCLUDE_DIRS_FMT "/Users/i346208/.conan/data/fmt/6.2.0/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/include")
set(CONAN_LIB_DIRS_FMT "/Users/i346208/.conan/data/fmt/6.2.0/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/lib")
set(CONAN_BIN_DIRS_FMT )
set(CONAN_RES_DIRS_FMT )
set(CONAN_SRC_DIRS_FMT )
set(CONAN_BUILD_DIRS_FMT "/Users/i346208/.conan/data/fmt/6.2.0/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/")
set(CONAN_FRAMEWORK_DIRS_FMT )
set(CONAN_LIBS_FMT fmt)
set(CONAN_PKG_LIBS_FMT fmt)
set(CONAN_SYSTEM_LIBS_FMT )
set(CONAN_FRAMEWORKS_FMT )
set(CONAN_FRAMEWORKS_FOUND_FMT "")  # Will be filled later
set(CONAN_DEFINES_FMT )
set(CONAN_BUILD_MODULES_PATHS_FMT )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_FMT )

set(CONAN_C_FLAGS_FMT "")
set(CONAN_CXX_FLAGS_FMT "")
set(CONAN_SHARED_LINKER_FLAGS_FMT "")
set(CONAN_EXE_LINKER_FLAGS_FMT "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_FMT_LIST "")
set(CONAN_CXX_FLAGS_FMT_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_FMT_LIST "")
set(CONAN_EXE_LINKER_FLAGS_FMT_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_FMT "${CONAN_FRAMEWORKS_FMT}" "_FMT" "")
# Append to aggregated values variable
set(CONAN_LIBS_FMT ${CONAN_PKG_LIBS_FMT} ${CONAN_SYSTEM_LIBS_FMT} ${CONAN_FRAMEWORKS_FOUND_FMT})


#################
###  EXPECTED-LITE
#################
set(CONAN_EXPECTED-LITE_ROOT "/Users/i346208/.conan/data/expected-lite/0.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_EXPECTED-LITE "/Users/i346208/.conan/data/expected-lite/0.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_EXPECTED-LITE )
set(CONAN_BIN_DIRS_EXPECTED-LITE )
set(CONAN_RES_DIRS_EXPECTED-LITE )
set(CONAN_SRC_DIRS_EXPECTED-LITE )
set(CONAN_BUILD_DIRS_EXPECTED-LITE "/Users/i346208/.conan/data/expected-lite/0.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_EXPECTED-LITE )
set(CONAN_LIBS_EXPECTED-LITE )
set(CONAN_PKG_LIBS_EXPECTED-LITE )
set(CONAN_SYSTEM_LIBS_EXPECTED-LITE )
set(CONAN_FRAMEWORKS_EXPECTED-LITE )
set(CONAN_FRAMEWORKS_FOUND_EXPECTED-LITE "")  # Will be filled later
set(CONAN_DEFINES_EXPECTED-LITE )
set(CONAN_BUILD_MODULES_PATHS_EXPECTED-LITE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_EXPECTED-LITE )

set(CONAN_C_FLAGS_EXPECTED-LITE "")
set(CONAN_CXX_FLAGS_EXPECTED-LITE "")
set(CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE "")
set(CONAN_EXE_LINKER_FLAGS_EXPECTED-LITE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_EXPECTED-LITE_LIST "")
set(CONAN_CXX_FLAGS_EXPECTED-LITE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_EXPECTED-LITE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_EXPECTED-LITE "${CONAN_FRAMEWORKS_EXPECTED-LITE}" "_EXPECTED-LITE" "")
# Append to aggregated values variable
set(CONAN_LIBS_EXPECTED-LITE ${CONAN_PKG_LIBS_EXPECTED-LITE} ${CONAN_SYSTEM_LIBS_EXPECTED-LITE} ${CONAN_FRAMEWORKS_FOUND_EXPECTED-LITE})


#################
###  OPTIONAL-LITE
#################
set(CONAN_OPTIONAL-LITE_ROOT "/Users/i346208/.conan/data/optional-lite/3.2.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_OPTIONAL-LITE "/Users/i346208/.conan/data/optional-lite/3.2.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_OPTIONAL-LITE )
set(CONAN_BIN_DIRS_OPTIONAL-LITE )
set(CONAN_RES_DIRS_OPTIONAL-LITE )
set(CONAN_SRC_DIRS_OPTIONAL-LITE )
set(CONAN_BUILD_DIRS_OPTIONAL-LITE "/Users/i346208/.conan/data/optional-lite/3.2.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_OPTIONAL-LITE )
set(CONAN_LIBS_OPTIONAL-LITE )
set(CONAN_PKG_LIBS_OPTIONAL-LITE )
set(CONAN_SYSTEM_LIBS_OPTIONAL-LITE )
set(CONAN_FRAMEWORKS_OPTIONAL-LITE )
set(CONAN_FRAMEWORKS_FOUND_OPTIONAL-LITE "")  # Will be filled later
set(CONAN_DEFINES_OPTIONAL-LITE )
set(CONAN_BUILD_MODULES_PATHS_OPTIONAL-LITE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_OPTIONAL-LITE )

set(CONAN_C_FLAGS_OPTIONAL-LITE "")
set(CONAN_CXX_FLAGS_OPTIONAL-LITE "")
set(CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE "")
set(CONAN_EXE_LINKER_FLAGS_OPTIONAL-LITE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_OPTIONAL-LITE_LIST "")
set(CONAN_CXX_FLAGS_OPTIONAL-LITE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_OPTIONAL-LITE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_OPTIONAL-LITE "${CONAN_FRAMEWORKS_OPTIONAL-LITE}" "_OPTIONAL-LITE" "")
# Append to aggregated values variable
set(CONAN_LIBS_OPTIONAL-LITE ${CONAN_PKG_LIBS_OPTIONAL-LITE} ${CONAN_SYSTEM_LIBS_OPTIONAL-LITE} ${CONAN_FRAMEWORKS_FOUND_OPTIONAL-LITE})


#################
###  STRING-VIEW-LITE
#################
set(CONAN_STRING-VIEW-LITE_ROOT "/Users/i346208/.conan/data/string-view-lite/1.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_STRING-VIEW-LITE "/Users/i346208/.conan/data/string-view-lite/1.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_STRING-VIEW-LITE )
set(CONAN_BIN_DIRS_STRING-VIEW-LITE )
set(CONAN_RES_DIRS_STRING-VIEW-LITE )
set(CONAN_SRC_DIRS_STRING-VIEW-LITE )
set(CONAN_BUILD_DIRS_STRING-VIEW-LITE "/Users/i346208/.conan/data/string-view-lite/1.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_STRING-VIEW-LITE )
set(CONAN_LIBS_STRING-VIEW-LITE )
set(CONAN_PKG_LIBS_STRING-VIEW-LITE )
set(CONAN_SYSTEM_LIBS_STRING-VIEW-LITE )
set(CONAN_FRAMEWORKS_STRING-VIEW-LITE )
set(CONAN_FRAMEWORKS_FOUND_STRING-VIEW-LITE "")  # Will be filled later
set(CONAN_DEFINES_STRING-VIEW-LITE )
set(CONAN_BUILD_MODULES_PATHS_STRING-VIEW-LITE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_STRING-VIEW-LITE )

set(CONAN_C_FLAGS_STRING-VIEW-LITE "")
set(CONAN_CXX_FLAGS_STRING-VIEW-LITE "")
set(CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE "")
set(CONAN_EXE_LINKER_FLAGS_STRING-VIEW-LITE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_STRING-VIEW-LITE_LIST "")
set(CONAN_CXX_FLAGS_STRING-VIEW-LITE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_STRING-VIEW-LITE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_STRING-VIEW-LITE "${CONAN_FRAMEWORKS_STRING-VIEW-LITE}" "_STRING-VIEW-LITE" "")
# Append to aggregated values variable
set(CONAN_LIBS_STRING-VIEW-LITE ${CONAN_PKG_LIBS_STRING-VIEW-LITE} ${CONAN_SYSTEM_LIBS_STRING-VIEW-LITE} ${CONAN_FRAMEWORKS_FOUND_STRING-VIEW-LITE})


#################
###  VARIANT-LITE
#################
set(CONAN_VARIANT-LITE_ROOT "/Users/i346208/.conan/data/variant-lite/1.2.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_VARIANT-LITE "/Users/i346208/.conan/data/variant-lite/1.2.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_VARIANT-LITE )
set(CONAN_BIN_DIRS_VARIANT-LITE )
set(CONAN_RES_DIRS_VARIANT-LITE )
set(CONAN_SRC_DIRS_VARIANT-LITE )
set(CONAN_BUILD_DIRS_VARIANT-LITE "/Users/i346208/.conan/data/variant-lite/1.2.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_VARIANT-LITE )
set(CONAN_LIBS_VARIANT-LITE )
set(CONAN_PKG_LIBS_VARIANT-LITE )
set(CONAN_SYSTEM_LIBS_VARIANT-LITE )
set(CONAN_FRAMEWORKS_VARIANT-LITE )
set(CONAN_FRAMEWORKS_FOUND_VARIANT-LITE "")  # Will be filled later
set(CONAN_DEFINES_VARIANT-LITE )
set(CONAN_BUILD_MODULES_PATHS_VARIANT-LITE )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_VARIANT-LITE )

set(CONAN_C_FLAGS_VARIANT-LITE "")
set(CONAN_CXX_FLAGS_VARIANT-LITE "")
set(CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE "")
set(CONAN_EXE_LINKER_FLAGS_VARIANT-LITE "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_VARIANT-LITE_LIST "")
set(CONAN_CXX_FLAGS_VARIANT-LITE_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_LIST "")
set(CONAN_EXE_LINKER_FLAGS_VARIANT-LITE_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_VARIANT-LITE "${CONAN_FRAMEWORKS_VARIANT-LITE}" "_VARIANT-LITE" "")
# Append to aggregated values variable
set(CONAN_LIBS_VARIANT-LITE ${CONAN_PKG_LIBS_VARIANT-LITE} ${CONAN_SYSTEM_LIBS_VARIANT-LITE} ${CONAN_FRAMEWORKS_FOUND_VARIANT-LITE})


#################
###  ASIO
#################
set(CONAN_ASIO_ROOT "/Users/i346208/.conan/data/asio/1.12.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9")
set(CONAN_INCLUDE_DIRS_ASIO "/Users/i346208/.conan/data/asio/1.12.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include")
set(CONAN_LIB_DIRS_ASIO )
set(CONAN_BIN_DIRS_ASIO )
set(CONAN_RES_DIRS_ASIO )
set(CONAN_SRC_DIRS_ASIO )
set(CONAN_BUILD_DIRS_ASIO "/Users/i346208/.conan/data/asio/1.12.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/")
set(CONAN_FRAMEWORK_DIRS_ASIO )
set(CONAN_LIBS_ASIO )
set(CONAN_PKG_LIBS_ASIO )
set(CONAN_SYSTEM_LIBS_ASIO )
set(CONAN_FRAMEWORKS_ASIO )
set(CONAN_FRAMEWORKS_FOUND_ASIO "")  # Will be filled later
set(CONAN_DEFINES_ASIO "-DASIO_STANDALONE")
set(CONAN_BUILD_MODULES_PATHS_ASIO )
# COMPILE_DEFINITIONS are equal to CONAN_DEFINES without -D, for targets
set(CONAN_COMPILE_DEFINITIONS_ASIO "ASIO_STANDALONE")

set(CONAN_C_FLAGS_ASIO "")
set(CONAN_CXX_FLAGS_ASIO "")
set(CONAN_SHARED_LINKER_FLAGS_ASIO "")
set(CONAN_EXE_LINKER_FLAGS_ASIO "")

# For modern cmake targets we use the list variables (separated with ;)
set(CONAN_C_FLAGS_ASIO_LIST "")
set(CONAN_CXX_FLAGS_ASIO_LIST "")
set(CONAN_SHARED_LINKER_FLAGS_ASIO_LIST "")
set(CONAN_EXE_LINKER_FLAGS_ASIO_LIST "")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND_ASIO "${CONAN_FRAMEWORKS_ASIO}" "_ASIO" "")
# Append to aggregated values variable
set(CONAN_LIBS_ASIO ${CONAN_PKG_LIBS_ASIO} ${CONAN_SYSTEM_LIBS_ASIO} ${CONAN_FRAMEWORKS_FOUND_ASIO})


### Definition of global aggregated variables ###

set(CONAN_PACKAGE_NAME None)
set(CONAN_PACKAGE_VERSION None)

set(CONAN_SETTINGS_ARCH "x86_64")
set(CONAN_SETTINGS_ARCH_BUILD "x86_64")
set(CONAN_SETTINGS_BUILD_TYPE "RelWithDebInfo")
set(CONAN_SETTINGS_COMPILER "apple-clang")
set(CONAN_SETTINGS_COMPILER_LIBCXX "libc++")
set(CONAN_SETTINGS_COMPILER_VERSION "12.0")
set(CONAN_SETTINGS_OS "Macos")
set(CONAN_SETTINGS_OS_BUILD "Macos")

set(CONAN_DEPENDENCIES ncurses restinio catch2 docopt.cpp spdlog http_parser fmt expected-lite optional-lite string-view-lite variant-lite asio)
# Storing original command line args (CMake helper) flags
set(CONAN_CMD_CXX_FLAGS ${CONAN_CXX_FLAGS})

set(CONAN_CMD_SHARED_LINKER_FLAGS ${CONAN_SHARED_LINKER_FLAGS})
set(CONAN_CMD_C_FLAGS ${CONAN_C_FLAGS})
# Defining accumulated conan variables for all deps

set(CONAN_INCLUDE_DIRS "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/include"
			"/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/include/ncursesw"
			"/Users/i346208/.conan/data/restinio/0.6.7/stiffstream/stable/package/a008c60d1dd14a82e47e1ef98ad5a9e638827fa6/include"
			"/Users/i346208/.conan/data/catch2/2.13.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/Users/i346208/.conan/data/docopt.cpp/0.6.2/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/include"
			"/Users/i346208/.conan/data/spdlog/1.5.0/_/_/package/1bc5e726aed56fe327dcaf9510b8289eb9034ad7/include"
			"/Users/i346208/.conan/data/http_parser/2.9.2/_/_/package/6d51450c2a59514630eddfc457cb85671d554dc7/include"
			"/Users/i346208/.conan/data/fmt/6.2.0/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/include"
			"/Users/i346208/.conan/data/expected-lite/0.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/Users/i346208/.conan/data/optional-lite/3.2.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/Users/i346208/.conan/data/string-view-lite/1.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/Users/i346208/.conan/data/variant-lite/1.2.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include"
			"/Users/i346208/.conan/data/asio/1.12.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/include" ${CONAN_INCLUDE_DIRS})
set(CONAN_LIB_DIRS "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/lib"
			"/Users/i346208/.conan/data/restinio/0.6.7/stiffstream/stable/package/a008c60d1dd14a82e47e1ef98ad5a9e638827fa6/lib"
			"/Users/i346208/.conan/data/catch2/2.13.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib"
			"/Users/i346208/.conan/data/docopt.cpp/0.6.2/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/lib"
			"/Users/i346208/.conan/data/spdlog/1.5.0/_/_/package/1bc5e726aed56fe327dcaf9510b8289eb9034ad7/lib"
			"/Users/i346208/.conan/data/http_parser/2.9.2/_/_/package/6d51450c2a59514630eddfc457cb85671d554dc7/lib"
			"/Users/i346208/.conan/data/fmt/6.2.0/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/lib" ${CONAN_LIB_DIRS})
set(CONAN_BIN_DIRS "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/bin" ${CONAN_BIN_DIRS})
set(CONAN_RES_DIRS  ${CONAN_RES_DIRS})
set(CONAN_FRAMEWORK_DIRS  ${CONAN_FRAMEWORK_DIRS})
set(CONAN_LIBS panelw menuw formw ncurses++w ticw ncursesw tinfow docopt spdlog http_parser fmt ${CONAN_LIBS})
set(CONAN_PKG_LIBS panelw menuw formw ncurses++w ticw ncursesw tinfow docopt spdlog http_parser fmt ${CONAN_PKG_LIBS})
set(CONAN_SYSTEM_LIBS  ${CONAN_SYSTEM_LIBS})
set(CONAN_FRAMEWORKS  ${CONAN_FRAMEWORKS})
set(CONAN_FRAMEWORKS_FOUND "")  # Will be filled later
set(CONAN_DEFINES "-DASIO_STANDALONE"
			"-DSPDLOG_COMPILED_LIB"
			"-DSPDLOG_FMT_EXTERNAL"
			"-DRESTINIO_EXTERNAL_EXPECTED_LITE"
			"-DRESTINIO_EXTERNAL_OPTIONAL_LITE"
			"-DRESTINIO_EXTERNAL_STRING_VIEW_LITE"
			"-DRESTINIO_EXTERNAL_VARIANT_LITE"
			"-DNCURSES_STATIC" ${CONAN_DEFINES})
set(CONAN_BUILD_MODULES_PATHS  ${CONAN_BUILD_MODULES_PATHS})
set(CONAN_CMAKE_MODULE_PATH "/Users/i346208/.conan/data/ncurses/6.2/_/_/package/20b55cb738c0fe57c8a1a04bba5b8dedff83b326/"
			"/Users/i346208/.conan/data/restinio/0.6.7/stiffstream/stable/package/a008c60d1dd14a82e47e1ef98ad5a9e638827fa6/"
			"/Users/i346208/.conan/data/catch2/2.13.3/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/lib/cmake/Catch2"
			"/Users/i346208/.conan/data/docopt.cpp/0.6.2/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/"
			"/Users/i346208/.conan/data/spdlog/1.5.0/_/_/package/1bc5e726aed56fe327dcaf9510b8289eb9034ad7/"
			"/Users/i346208/.conan/data/http_parser/2.9.2/_/_/package/6d51450c2a59514630eddfc457cb85671d554dc7/"
			"/Users/i346208/.conan/data/fmt/6.2.0/_/_/package/2349b5ca72b288c3eb71b7954318cdfd963bfee6/"
			"/Users/i346208/.conan/data/expected-lite/0.4.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/i346208/.conan/data/optional-lite/3.2.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/i346208/.conan/data/string-view-lite/1.3.0/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/i346208/.conan/data/variant-lite/1.2.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/"
			"/Users/i346208/.conan/data/asio/1.12.2/_/_/package/5ab84d6acfe1f23c4fae0ab88f26e3a396351ac9/" ${CONAN_CMAKE_MODULE_PATH})

set(CONAN_CXX_FLAGS " ${CONAN_CXX_FLAGS}")
set(CONAN_SHARED_LINKER_FLAGS " ${CONAN_SHARED_LINKER_FLAGS}")
set(CONAN_EXE_LINKER_FLAGS " ${CONAN_EXE_LINKER_FLAGS}")
set(CONAN_C_FLAGS " ${CONAN_C_FLAGS}")

# Apple Frameworks
conan_find_apple_frameworks(CONAN_FRAMEWORKS_FOUND "${CONAN_FRAMEWORKS}" "" "")
# Append to aggregated values variable: Use CONAN_LIBS instead of CONAN_PKG_LIBS to include user appended vars
set(CONAN_LIBS ${CONAN_LIBS} ${CONAN_SYSTEM_LIBS} ${CONAN_FRAMEWORKS_FOUND})


###  Definition of macros and functions ###

macro(conan_define_targets)
    if(${CMAKE_VERSION} VERSION_LESS "3.1.2")
        message(FATAL_ERROR "TARGETS not supported by your CMake version!")
    endif()  # CMAKE > 3.x
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CONAN_CMD_CXX_FLAGS}")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CONAN_CMD_C_FLAGS}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${CONAN_CMD_SHARED_LINKER_FLAGS}")


    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES "${CONAN_SYSTEM_LIBS_NCURSES} ${CONAN_FRAMEWORKS_FOUND_NCURSES} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES}" "${CONAN_LIB_DIRS_NCURSES}"
                                  CONAN_PACKAGE_TARGETS_NCURSES "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES}"
                                  "" ncurses)
    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_NCURSES_DEBUG} ${CONAN_FRAMEWORKS_FOUND_NCURSES_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES_DEBUG}" "${CONAN_LIB_DIRS_NCURSES_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_NCURSES_DEBUG "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG}"
                                  "debug" ncurses)
    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_NCURSES_RELEASE} ${CONAN_FRAMEWORKS_FOUND_NCURSES_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES_RELEASE}" "${CONAN_LIB_DIRS_NCURSES_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_NCURSES_RELEASE "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE}"
                                  "release" ncurses)
    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_NCURSES_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_NCURSES_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_NCURSES_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_NCURSES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" ncurses)
    set(_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_NCURSES_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_NCURSES_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_NCURSES_MINSIZEREL}" "${CONAN_LIB_DIRS_NCURSES_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_NCURSES_MINSIZEREL "${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" ncurses)

    add_library(CONAN_PKG::ncurses INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::ncurses PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_NCURSES} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_NCURSES_RELEASE} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_NCURSES_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_NCURSES_MINSIZEREL} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_NCURSES_DEBUG} ${_CONAN_PKG_LIBS_NCURSES_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_NCURSES_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_NCURSES_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::ncurses PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_NCURSES}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_NCURSES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_NCURSES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_NCURSES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_NCURSES_DEBUG}>)
    set_property(TARGET CONAN_PKG::ncurses PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_NCURSES}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_NCURSES_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_NCURSES_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_NCURSES_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_NCURSES_DEBUG}>)
    set_property(TARGET CONAN_PKG::ncurses PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_NCURSES_LIST} ${CONAN_CXX_FLAGS_NCURSES_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_NCURSES_RELEASE_LIST} ${CONAN_CXX_FLAGS_NCURSES_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_NCURSES_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_NCURSES_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_NCURSES_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_NCURSES_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_NCURSES_DEBUG_LIST}  ${CONAN_CXX_FLAGS_NCURSES_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_RESTINIO} ${CONAN_FRAMEWORKS_FOUND_RESTINIO} CONAN_PKG::http_parser CONAN_PKG::fmt CONAN_PKG::expected-lite CONAN_PKG::optional-lite CONAN_PKG::string-view-lite CONAN_PKG::variant-lite CONAN_PKG::asio")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RESTINIO}" "${CONAN_LIB_DIRS_RESTINIO}"
                                  CONAN_PACKAGE_TARGETS_RESTINIO "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES}"
                                  "" restinio)
    set(_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_RESTINIO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_RESTINIO_DEBUG} CONAN_PKG::http_parser CONAN_PKG::fmt CONAN_PKG::expected-lite CONAN_PKG::optional-lite CONAN_PKG::string-view-lite CONAN_PKG::variant-lite CONAN_PKG::asio")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RESTINIO_DEBUG}" "${CONAN_LIB_DIRS_RESTINIO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_RESTINIO_DEBUG "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_DEBUG}"
                                  "debug" restinio)
    set(_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_RESTINIO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_RESTINIO_RELEASE} CONAN_PKG::http_parser CONAN_PKG::fmt CONAN_PKG::expected-lite CONAN_PKG::optional-lite CONAN_PKG::string-view-lite CONAN_PKG::variant-lite CONAN_PKG::asio")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RESTINIO_RELEASE}" "${CONAN_LIB_DIRS_RESTINIO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_RESTINIO_RELEASE "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELEASE}"
                                  "release" restinio)
    set(_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_RESTINIO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_RESTINIO_RELWITHDEBINFO} CONAN_PKG::http_parser CONAN_PKG::fmt CONAN_PKG::expected-lite CONAN_PKG::optional-lite CONAN_PKG::string-view-lite CONAN_PKG::variant-lite CONAN_PKG::asio")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RESTINIO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RESTINIO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_RESTINIO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" restinio)
    set(_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_RESTINIO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_RESTINIO_MINSIZEREL} CONAN_PKG::http_parser CONAN_PKG::fmt CONAN_PKG::expected-lite CONAN_PKG::optional-lite CONAN_PKG::string-view-lite CONAN_PKG::variant-lite CONAN_PKG::asio")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_RESTINIO_MINSIZEREL}" "${CONAN_LIB_DIRS_RESTINIO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_RESTINIO_MINSIZEREL "${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" restinio)

    add_library(CONAN_PKG::restinio INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::restinio PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_RESTINIO} ${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RESTINIO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_RESTINIO_RELEASE} ${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RESTINIO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_RESTINIO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RESTINIO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_RESTINIO_MINSIZEREL} ${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RESTINIO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_RESTINIO_DEBUG} ${_CONAN_PKG_LIBS_RESTINIO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_RESTINIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_RESTINIO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::restinio PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_RESTINIO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RESTINIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RESTINIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_RESTINIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_RESTINIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::restinio PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_RESTINIO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_RESTINIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_RESTINIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_RESTINIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_RESTINIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::restinio PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_RESTINIO_LIST} ${CONAN_CXX_FLAGS_RESTINIO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_RESTINIO_RELEASE_LIST} ${CONAN_CXX_FLAGS_RESTINIO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_RESTINIO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_RESTINIO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_RESTINIO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_RESTINIO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_RESTINIO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_RESTINIO_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES "${CONAN_SYSTEM_LIBS_CATCH2} ${CONAN_FRAMEWORKS_FOUND_CATCH2} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CATCH2_DEPENDENCIES "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CATCH2}" "${CONAN_LIB_DIRS_CATCH2}"
                                  CONAN_PACKAGE_TARGETS_CATCH2 "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES}"
                                  "" catch2)
    set(_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_CATCH2_DEBUG} ${CONAN_FRAMEWORKS_FOUND_CATCH2_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CATCH2_DEBUG}" "${CONAN_LIB_DIRS_CATCH2_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_CATCH2_DEBUG "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_DEBUG}"
                                  "debug" catch2)
    set(_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_CATCH2_RELEASE} ${CONAN_FRAMEWORKS_FOUND_CATCH2_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CATCH2_RELEASE}" "${CONAN_LIB_DIRS_CATCH2_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_CATCH2_RELEASE "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELEASE}"
                                  "release" catch2)
    set(_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_CATCH2_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_CATCH2_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CATCH2_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_CATCH2_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_CATCH2_RELWITHDEBINFO "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" catch2)
    set(_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_CATCH2_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_CATCH2_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_CATCH2_MINSIZEREL}" "${CONAN_LIB_DIRS_CATCH2_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_CATCH2_MINSIZEREL "${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" catch2)

    add_library(CONAN_PKG::catch2 INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::catch2 PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_CATCH2} ${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CATCH2_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_CATCH2_RELEASE} ${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CATCH2_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_CATCH2_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CATCH2_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_CATCH2_MINSIZEREL} ${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CATCH2_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_CATCH2_DEBUG} ${_CONAN_PKG_LIBS_CATCH2_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_CATCH2_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_CATCH2_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::catch2 PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_CATCH2}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_CATCH2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_CATCH2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_CATCH2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_CATCH2_DEBUG}>)
    set_property(TARGET CONAN_PKG::catch2 PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_CATCH2}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_CATCH2_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_CATCH2_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_CATCH2_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_CATCH2_DEBUG}>)
    set_property(TARGET CONAN_PKG::catch2 PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_CATCH2_LIST} ${CONAN_CXX_FLAGS_CATCH2_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_CATCH2_RELEASE_LIST} ${CONAN_CXX_FLAGS_CATCH2_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_CATCH2_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_CATCH2_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_CATCH2_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_CATCH2_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_CATCH2_DEBUG_LIST}  ${CONAN_CXX_FLAGS_CATCH2_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES "${CONAN_SYSTEM_LIBS_DOCOPT.CPP} ${CONAN_FRAMEWORKS_FOUND_DOCOPT.CPP} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOCOPT.CPP}" "${CONAN_LIB_DIRS_DOCOPT.CPP}"
                                  CONAN_PACKAGE_TARGETS_DOCOPT.CPP "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES}"
                                  "" docopt.cpp)
    set(_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_DOCOPT.CPP_DEBUG} ${CONAN_FRAMEWORKS_FOUND_DOCOPT.CPP_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOCOPT.CPP_DEBUG}" "${CONAN_LIB_DIRS_DOCOPT.CPP_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_DOCOPT.CPP_DEBUG "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_DEBUG}"
                                  "debug" docopt.cpp)
    set(_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_DOCOPT.CPP_RELEASE} ${CONAN_FRAMEWORKS_FOUND_DOCOPT.CPP_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOCOPT.CPP_RELEASE}" "${CONAN_LIB_DIRS_DOCOPT.CPP_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_DOCOPT.CPP_RELEASE "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELEASE}"
                                  "release" docopt.cpp)
    set(_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_DOCOPT.CPP_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_DOCOPT.CPP_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOCOPT.CPP_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_DOCOPT.CPP_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_DOCOPT.CPP_RELWITHDEBINFO "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" docopt.cpp)
    set(_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_DOCOPT.CPP_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_DOCOPT.CPP_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_DOCOPT.CPP_MINSIZEREL}" "${CONAN_LIB_DIRS_DOCOPT.CPP_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_DOCOPT.CPP_MINSIZEREL "${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" docopt.cpp)

    add_library(CONAN_PKG::docopt.cpp INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::docopt.cpp PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_DOCOPT.CPP} ${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOCOPT.CPP_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_DOCOPT.CPP_RELEASE} ${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOCOPT.CPP_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_DOCOPT.CPP_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOCOPT.CPP_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_DOCOPT.CPP_MINSIZEREL} ${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOCOPT.CPP_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_DOCOPT.CPP_DEBUG} ${_CONAN_PKG_LIBS_DOCOPT.CPP_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_DOCOPT.CPP_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_DOCOPT.CPP_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::docopt.cpp PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_DOCOPT.CPP}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_DOCOPT.CPP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_DOCOPT.CPP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_DOCOPT.CPP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DOCOPT.CPP_DEBUG}>)
    set_property(TARGET CONAN_PKG::docopt.cpp PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_DOCOPT.CPP}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_DOCOPT.CPP_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_DOCOPT.CPP_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_DOCOPT.CPP_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_DOCOPT.CPP_DEBUG}>)
    set_property(TARGET CONAN_PKG::docopt.cpp PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_DOCOPT.CPP_LIST} ${CONAN_CXX_FLAGS_DOCOPT.CPP_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_DOCOPT.CPP_RELEASE_LIST} ${CONAN_CXX_FLAGS_DOCOPT.CPP_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_DOCOPT.CPP_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_DOCOPT.CPP_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_DOCOPT.CPP_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_DOCOPT.CPP_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_DOCOPT.CPP_DEBUG_LIST}  ${CONAN_CXX_FLAGS_DOCOPT.CPP_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES "${CONAN_SYSTEM_LIBS_SPDLOG} ${CONAN_FRAMEWORKS_FOUND_SPDLOG} CONAN_PKG::fmt")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SPDLOG}" "${CONAN_LIB_DIRS_SPDLOG}"
                                  CONAN_PACKAGE_TARGETS_SPDLOG "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES}"
                                  "" spdlog)
    set(_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_SPDLOG_DEBUG} ${CONAN_FRAMEWORKS_FOUND_SPDLOG_DEBUG} CONAN_PKG::fmt")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SPDLOG_DEBUG}" "${CONAN_LIB_DIRS_SPDLOG_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_SPDLOG_DEBUG "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_DEBUG}"
                                  "debug" spdlog)
    set(_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_SPDLOG_RELEASE} ${CONAN_FRAMEWORKS_FOUND_SPDLOG_RELEASE} CONAN_PKG::fmt")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SPDLOG_RELEASE}" "${CONAN_LIB_DIRS_SPDLOG_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_SPDLOG_RELEASE "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELEASE}"
                                  "release" spdlog)
    set(_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_SPDLOG_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_SPDLOG_RELWITHDEBINFO} CONAN_PKG::fmt")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SPDLOG_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_SPDLOG_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_SPDLOG_RELWITHDEBINFO "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" spdlog)
    set(_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_SPDLOG_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_SPDLOG_MINSIZEREL} CONAN_PKG::fmt")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_SPDLOG_MINSIZEREL}" "${CONAN_LIB_DIRS_SPDLOG_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_SPDLOG_MINSIZEREL "${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" spdlog)

    add_library(CONAN_PKG::spdlog INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::spdlog PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_SPDLOG} ${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SPDLOG_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_SPDLOG_RELEASE} ${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SPDLOG_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_SPDLOG_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SPDLOG_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_SPDLOG_MINSIZEREL} ${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SPDLOG_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_SPDLOG_DEBUG} ${_CONAN_PKG_LIBS_SPDLOG_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_SPDLOG_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_SPDLOG_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::spdlog PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_SPDLOG}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_SPDLOG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_SPDLOG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_SPDLOG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_SPDLOG_DEBUG}>)
    set_property(TARGET CONAN_PKG::spdlog PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_SPDLOG}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_SPDLOG_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_SPDLOG_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_SPDLOG_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_SPDLOG_DEBUG}>)
    set_property(TARGET CONAN_PKG::spdlog PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_SPDLOG_LIST} ${CONAN_CXX_FLAGS_SPDLOG_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_SPDLOG_RELEASE_LIST} ${CONAN_CXX_FLAGS_SPDLOG_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_SPDLOG_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_SPDLOG_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_SPDLOG_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_SPDLOG_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_SPDLOG_DEBUG_LIST}  ${CONAN_CXX_FLAGS_SPDLOG_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES "${CONAN_SYSTEM_LIBS_HTTP_PARSER} ${CONAN_FRAMEWORKS_FOUND_HTTP_PARSER} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HTTP_PARSER}" "${CONAN_LIB_DIRS_HTTP_PARSER}"
                                  CONAN_PACKAGE_TARGETS_HTTP_PARSER "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES}"
                                  "" http_parser)
    set(_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_HTTP_PARSER_DEBUG} ${CONAN_FRAMEWORKS_FOUND_HTTP_PARSER_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HTTP_PARSER_DEBUG}" "${CONAN_LIB_DIRS_HTTP_PARSER_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_HTTP_PARSER_DEBUG "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_DEBUG}"
                                  "debug" http_parser)
    set(_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_HTTP_PARSER_RELEASE} ${CONAN_FRAMEWORKS_FOUND_HTTP_PARSER_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HTTP_PARSER_RELEASE}" "${CONAN_LIB_DIRS_HTTP_PARSER_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_HTTP_PARSER_RELEASE "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELEASE}"
                                  "release" http_parser)
    set(_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_HTTP_PARSER_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_HTTP_PARSER_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HTTP_PARSER_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_HTTP_PARSER_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_HTTP_PARSER_RELWITHDEBINFO "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" http_parser)
    set(_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_HTTP_PARSER_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_HTTP_PARSER_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_HTTP_PARSER_MINSIZEREL}" "${CONAN_LIB_DIRS_HTTP_PARSER_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_HTTP_PARSER_MINSIZEREL "${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" http_parser)

    add_library(CONAN_PKG::http_parser INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::http_parser PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_HTTP_PARSER} ${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HTTP_PARSER_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_HTTP_PARSER_RELEASE} ${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HTTP_PARSER_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_HTTP_PARSER_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HTTP_PARSER_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_HTTP_PARSER_MINSIZEREL} ${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HTTP_PARSER_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_HTTP_PARSER_DEBUG} ${_CONAN_PKG_LIBS_HTTP_PARSER_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_HTTP_PARSER_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_HTTP_PARSER_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::http_parser PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_HTTP_PARSER}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_HTTP_PARSER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_HTTP_PARSER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_HTTP_PARSER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_HTTP_PARSER_DEBUG}>)
    set_property(TARGET CONAN_PKG::http_parser PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_HTTP_PARSER}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_HTTP_PARSER_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_HTTP_PARSER_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_HTTP_PARSER_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_HTTP_PARSER_DEBUG}>)
    set_property(TARGET CONAN_PKG::http_parser PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_HTTP_PARSER_LIST} ${CONAN_CXX_FLAGS_HTTP_PARSER_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_HTTP_PARSER_RELEASE_LIST} ${CONAN_CXX_FLAGS_HTTP_PARSER_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_HTTP_PARSER_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_HTTP_PARSER_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_HTTP_PARSER_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_HTTP_PARSER_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_HTTP_PARSER_DEBUG_LIST}  ${CONAN_CXX_FLAGS_HTTP_PARSER_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_FMT_DEPENDENCIES "${CONAN_SYSTEM_LIBS_FMT} ${CONAN_FRAMEWORKS_FOUND_FMT} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FMT_DEPENDENCIES "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FMT}" "${CONAN_LIB_DIRS_FMT}"
                                  CONAN_PACKAGE_TARGETS_FMT "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES}"
                                  "" fmt)
    set(_CONAN_PKG_LIBS_FMT_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_FMT_DEBUG} ${CONAN_FRAMEWORKS_FOUND_FMT_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FMT_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FMT_DEBUG}" "${CONAN_LIB_DIRS_FMT_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_FMT_DEBUG "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_DEBUG}"
                                  "debug" fmt)
    set(_CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_FMT_RELEASE} ${CONAN_FRAMEWORKS_FOUND_FMT_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FMT_RELEASE}" "${CONAN_LIB_DIRS_FMT_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_FMT_RELEASE "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELEASE}"
                                  "release" fmt)
    set(_CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_FMT_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_FMT_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FMT_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_FMT_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_FMT_RELWITHDEBINFO "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" fmt)
    set(_CONAN_PKG_LIBS_FMT_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_FMT_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_FMT_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_FMT_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_FMT_MINSIZEREL}" "${CONAN_LIB_DIRS_FMT_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_FMT_MINSIZEREL "${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" fmt)

    add_library(CONAN_PKG::fmt INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::fmt PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_FMT} ${_CONAN_PKG_LIBS_FMT_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FMT_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_FMT_RELEASE} ${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FMT_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_FMT_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FMT_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_FMT_MINSIZEREL} ${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FMT_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_FMT_DEBUG} ${_CONAN_PKG_LIBS_FMT_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_FMT_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_FMT_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::fmt PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_FMT}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_FMT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_FMT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_FMT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_FMT_DEBUG}>)
    set_property(TARGET CONAN_PKG::fmt PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_FMT}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_FMT_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_FMT_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_FMT_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_FMT_DEBUG}>)
    set_property(TARGET CONAN_PKG::fmt PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_FMT_LIST} ${CONAN_CXX_FLAGS_FMT_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_FMT_RELEASE_LIST} ${CONAN_CXX_FLAGS_FMT_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_FMT_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_FMT_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_FMT_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_FMT_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_FMT_DEBUG_LIST}  ${CONAN_CXX_FLAGS_FMT_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_EXPECTED-LITE} ${CONAN_FRAMEWORKS_FOUND_EXPECTED-LITE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPECTED-LITE}" "${CONAN_LIB_DIRS_EXPECTED-LITE}"
                                  CONAN_PACKAGE_TARGETS_EXPECTED-LITE "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES}"
                                  "" expected-lite)
    set(_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_EXPECTED-LITE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_EXPECTED-LITE_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPECTED-LITE_DEBUG}" "${CONAN_LIB_DIRS_EXPECTED-LITE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_EXPECTED-LITE_DEBUG "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_DEBUG}"
                                  "debug" expected-lite)
    set(_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_EXPECTED-LITE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_EXPECTED-LITE_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPECTED-LITE_RELEASE}" "${CONAN_LIB_DIRS_EXPECTED-LITE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_EXPECTED-LITE_RELEASE "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELEASE}"
                                  "release" expected-lite)
    set(_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_EXPECTED-LITE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_EXPECTED-LITE_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPECTED-LITE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_EXPECTED-LITE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_EXPECTED-LITE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" expected-lite)
    set(_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_EXPECTED-LITE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_EXPECTED-LITE_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_EXPECTED-LITE_MINSIZEREL}" "${CONAN_LIB_DIRS_EXPECTED-LITE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_EXPECTED-LITE_MINSIZEREL "${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" expected-lite)

    add_library(CONAN_PKG::expected-lite INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::expected-lite PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_EXPECTED-LITE} ${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPECTED-LITE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_EXPECTED-LITE_RELEASE} ${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPECTED-LITE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_EXPECTED-LITE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPECTED-LITE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_EXPECTED-LITE_MINSIZEREL} ${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPECTED-LITE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_EXPECTED-LITE_DEBUG} ${_CONAN_PKG_LIBS_EXPECTED-LITE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_EXPECTED-LITE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_EXPECTED-LITE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::expected-lite PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_EXPECTED-LITE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_EXPECTED-LITE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_EXPECTED-LITE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_EXPECTED-LITE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_EXPECTED-LITE_DEBUG}>)
    set_property(TARGET CONAN_PKG::expected-lite PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_EXPECTED-LITE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_EXPECTED-LITE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_EXPECTED-LITE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_EXPECTED-LITE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_EXPECTED-LITE_DEBUG}>)
    set_property(TARGET CONAN_PKG::expected-lite PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_EXPECTED-LITE_LIST} ${CONAN_CXX_FLAGS_EXPECTED-LITE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_EXPECTED-LITE_RELEASE_LIST} ${CONAN_CXX_FLAGS_EXPECTED-LITE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_EXPECTED-LITE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_EXPECTED-LITE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_EXPECTED-LITE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_EXPECTED-LITE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_EXPECTED-LITE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_EXPECTED-LITE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_OPTIONAL-LITE} ${CONAN_FRAMEWORKS_FOUND_OPTIONAL-LITE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPTIONAL-LITE}" "${CONAN_LIB_DIRS_OPTIONAL-LITE}"
                                  CONAN_PACKAGE_TARGETS_OPTIONAL-LITE "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES}"
                                  "" optional-lite)
    set(_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_OPTIONAL-LITE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_OPTIONAL-LITE_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPTIONAL-LITE_DEBUG}" "${CONAN_LIB_DIRS_OPTIONAL-LITE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_OPTIONAL-LITE_DEBUG "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_DEBUG}"
                                  "debug" optional-lite)
    set(_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_OPTIONAL-LITE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_OPTIONAL-LITE_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPTIONAL-LITE_RELEASE}" "${CONAN_LIB_DIRS_OPTIONAL-LITE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_OPTIONAL-LITE_RELEASE "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELEASE}"
                                  "release" optional-lite)
    set(_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_OPTIONAL-LITE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_OPTIONAL-LITE_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPTIONAL-LITE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_OPTIONAL-LITE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_OPTIONAL-LITE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" optional-lite)
    set(_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_OPTIONAL-LITE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_OPTIONAL-LITE_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_OPTIONAL-LITE_MINSIZEREL}" "${CONAN_LIB_DIRS_OPTIONAL-LITE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_OPTIONAL-LITE_MINSIZEREL "${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" optional-lite)

    add_library(CONAN_PKG::optional-lite INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::optional-lite PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_OPTIONAL-LITE} ${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPTIONAL-LITE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_OPTIONAL-LITE_RELEASE} ${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPTIONAL-LITE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_OPTIONAL-LITE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPTIONAL-LITE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_OPTIONAL-LITE_MINSIZEREL} ${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPTIONAL-LITE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_OPTIONAL-LITE_DEBUG} ${_CONAN_PKG_LIBS_OPTIONAL-LITE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_OPTIONAL-LITE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_OPTIONAL-LITE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::optional-lite PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_OPTIONAL-LITE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_OPTIONAL-LITE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_OPTIONAL-LITE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_OPTIONAL-LITE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_OPTIONAL-LITE_DEBUG}>)
    set_property(TARGET CONAN_PKG::optional-lite PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_OPTIONAL-LITE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_OPTIONAL-LITE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_OPTIONAL-LITE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_OPTIONAL-LITE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_OPTIONAL-LITE_DEBUG}>)
    set_property(TARGET CONAN_PKG::optional-lite PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_OPTIONAL-LITE_LIST} ${CONAN_CXX_FLAGS_OPTIONAL-LITE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_OPTIONAL-LITE_RELEASE_LIST} ${CONAN_CXX_FLAGS_OPTIONAL-LITE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_OPTIONAL-LITE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_OPTIONAL-LITE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_OPTIONAL-LITE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_OPTIONAL-LITE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_OPTIONAL-LITE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_OPTIONAL-LITE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_STRING-VIEW-LITE} ${CONAN_FRAMEWORKS_FOUND_STRING-VIEW-LITE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STRING-VIEW-LITE}" "${CONAN_LIB_DIRS_STRING-VIEW-LITE}"
                                  CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES}"
                                  "" string-view-lite)
    set(_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_STRING-VIEW-LITE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_STRING-VIEW-LITE_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STRING-VIEW-LITE_DEBUG}" "${CONAN_LIB_DIRS_STRING-VIEW-LITE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE_DEBUG "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_DEBUG}"
                                  "debug" string-view-lite)
    set(_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_STRING-VIEW-LITE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_STRING-VIEW-LITE_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STRING-VIEW-LITE_RELEASE}" "${CONAN_LIB_DIRS_STRING-VIEW-LITE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE_RELEASE "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELEASE}"
                                  "release" string-view-lite)
    set(_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_STRING-VIEW-LITE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_STRING-VIEW-LITE_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STRING-VIEW-LITE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_STRING-VIEW-LITE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" string-view-lite)
    set(_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_STRING-VIEW-LITE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_STRING-VIEW-LITE_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_STRING-VIEW-LITE_MINSIZEREL}" "${CONAN_LIB_DIRS_STRING-VIEW-LITE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE_MINSIZEREL "${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" string-view-lite)

    add_library(CONAN_PKG::string-view-lite INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::string-view-lite PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE} ${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STRING-VIEW-LITE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE_RELEASE} ${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STRING-VIEW-LITE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STRING-VIEW-LITE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE_MINSIZEREL} ${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STRING-VIEW-LITE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_STRING-VIEW-LITE_DEBUG} ${_CONAN_PKG_LIBS_STRING-VIEW-LITE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_STRING-VIEW-LITE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_STRING-VIEW-LITE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::string-view-lite PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_STRING-VIEW-LITE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_STRING-VIEW-LITE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_STRING-VIEW-LITE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_STRING-VIEW-LITE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_STRING-VIEW-LITE_DEBUG}>)
    set_property(TARGET CONAN_PKG::string-view-lite PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_STRING-VIEW-LITE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_STRING-VIEW-LITE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_STRING-VIEW-LITE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_STRING-VIEW-LITE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_STRING-VIEW-LITE_DEBUG}>)
    set_property(TARGET CONAN_PKG::string-view-lite PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_STRING-VIEW-LITE_LIST} ${CONAN_CXX_FLAGS_STRING-VIEW-LITE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_STRING-VIEW-LITE_RELEASE_LIST} ${CONAN_CXX_FLAGS_STRING-VIEW-LITE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_STRING-VIEW-LITE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_STRING-VIEW-LITE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_STRING-VIEW-LITE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_STRING-VIEW-LITE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_STRING-VIEW-LITE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_STRING-VIEW-LITE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES "${CONAN_SYSTEM_LIBS_VARIANT-LITE} ${CONAN_FRAMEWORKS_FOUND_VARIANT-LITE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_VARIANT-LITE}" "${CONAN_LIB_DIRS_VARIANT-LITE}"
                                  CONAN_PACKAGE_TARGETS_VARIANT-LITE "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES}"
                                  "" variant-lite)
    set(_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_VARIANT-LITE_DEBUG} ${CONAN_FRAMEWORKS_FOUND_VARIANT-LITE_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_VARIANT-LITE_DEBUG}" "${CONAN_LIB_DIRS_VARIANT-LITE_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_VARIANT-LITE_DEBUG "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_DEBUG}"
                                  "debug" variant-lite)
    set(_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_VARIANT-LITE_RELEASE} ${CONAN_FRAMEWORKS_FOUND_VARIANT-LITE_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_VARIANT-LITE_RELEASE}" "${CONAN_LIB_DIRS_VARIANT-LITE_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_VARIANT-LITE_RELEASE "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELEASE}"
                                  "release" variant-lite)
    set(_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_VARIANT-LITE_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_VARIANT-LITE_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_VARIANT-LITE_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_VARIANT-LITE_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_VARIANT-LITE_RELWITHDEBINFO "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" variant-lite)
    set(_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_VARIANT-LITE_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_VARIANT-LITE_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_VARIANT-LITE_MINSIZEREL}" "${CONAN_LIB_DIRS_VARIANT-LITE_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_VARIANT-LITE_MINSIZEREL "${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" variant-lite)

    add_library(CONAN_PKG::variant-lite INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::variant-lite PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_VARIANT-LITE} ${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_VARIANT-LITE_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_VARIANT-LITE_RELEASE} ${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_VARIANT-LITE_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_VARIANT-LITE_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_VARIANT-LITE_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_VARIANT-LITE_MINSIZEREL} ${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_VARIANT-LITE_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_VARIANT-LITE_DEBUG} ${_CONAN_PKG_LIBS_VARIANT-LITE_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_VARIANT-LITE_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_VARIANT-LITE_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::variant-lite PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_VARIANT-LITE}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_VARIANT-LITE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_VARIANT-LITE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_VARIANT-LITE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_VARIANT-LITE_DEBUG}>)
    set_property(TARGET CONAN_PKG::variant-lite PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_VARIANT-LITE}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_VARIANT-LITE_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_VARIANT-LITE_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_VARIANT-LITE_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_VARIANT-LITE_DEBUG}>)
    set_property(TARGET CONAN_PKG::variant-lite PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_VARIANT-LITE_LIST} ${CONAN_CXX_FLAGS_VARIANT-LITE_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_VARIANT-LITE_RELEASE_LIST} ${CONAN_CXX_FLAGS_VARIANT-LITE_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_VARIANT-LITE_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_VARIANT-LITE_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_VARIANT-LITE_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_VARIANT-LITE_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_VARIANT-LITE_DEBUG_LIST}  ${CONAN_CXX_FLAGS_VARIANT-LITE_DEBUG_LIST}>)


    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES "${CONAN_SYSTEM_LIBS_ASIO} ${CONAN_FRAMEWORKS_FOUND_ASIO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO}" "${CONAN_LIB_DIRS_ASIO}"
                                  CONAN_PACKAGE_TARGETS_ASIO "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES}"
                                  "" asio)
    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG "${CONAN_SYSTEM_LIBS_ASIO_DEBUG} ${CONAN_FRAMEWORKS_FOUND_ASIO_DEBUG} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO_DEBUG}" "${CONAN_LIB_DIRS_ASIO_DEBUG}"
                                  CONAN_PACKAGE_TARGETS_ASIO_DEBUG "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG}"
                                  "debug" asio)
    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE "${CONAN_SYSTEM_LIBS_ASIO_RELEASE} ${CONAN_FRAMEWORKS_FOUND_ASIO_RELEASE} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO_RELEASE}" "${CONAN_LIB_DIRS_ASIO_RELEASE}"
                                  CONAN_PACKAGE_TARGETS_ASIO_RELEASE "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE}"
                                  "release" asio)
    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO "${CONAN_SYSTEM_LIBS_ASIO_RELWITHDEBINFO} ${CONAN_FRAMEWORKS_FOUND_ASIO_RELWITHDEBINFO} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_ASIO_RELWITHDEBINFO}"
                                  CONAN_PACKAGE_TARGETS_ASIO_RELWITHDEBINFO "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO}"
                                  "relwithdebinfo" asio)
    set(_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL "${CONAN_SYSTEM_LIBS_ASIO_MINSIZEREL} ${CONAN_FRAMEWORKS_FOUND_ASIO_MINSIZEREL} ")
    string(REPLACE " " ";" _CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL}")
    conan_package_library_targets("${CONAN_PKG_LIBS_ASIO_MINSIZEREL}" "${CONAN_LIB_DIRS_ASIO_MINSIZEREL}"
                                  CONAN_PACKAGE_TARGETS_ASIO_MINSIZEREL "${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL}"
                                  "minsizerel" asio)

    add_library(CONAN_PKG::asio INTERFACE IMPORTED)

    # Property INTERFACE_LINK_FLAGS do not work, necessary to add to INTERFACE_LINK_LIBRARIES
    set_property(TARGET CONAN_PKG::asio PROPERTY INTERFACE_LINK_LIBRARIES ${CONAN_PACKAGE_TARGETS_ASIO} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_LIST}>

                                                                 $<$<CONFIG:Release>:${CONAN_PACKAGE_TARGETS_ASIO_RELEASE} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELEASE}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_RELEASE_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_RELEASE_LIST}>>

                                                                 $<$<CONFIG:RelWithDebInfo>:${CONAN_PACKAGE_TARGETS_ASIO_RELWITHDEBINFO} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_RELWITHDEBINFO}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_RELWITHDEBINFO_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_RELWITHDEBINFO_LIST}>>

                                                                 $<$<CONFIG:MinSizeRel>:${CONAN_PACKAGE_TARGETS_ASIO_MINSIZEREL} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_MINSIZEREL}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_MINSIZEREL_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_MINSIZEREL_LIST}>>

                                                                 $<$<CONFIG:Debug>:${CONAN_PACKAGE_TARGETS_ASIO_DEBUG} ${_CONAN_PKG_LIBS_ASIO_DEPENDENCIES_DEBUG}
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,MODULE_LIBRARY>:${CONAN_SHARED_LINKER_FLAGS_ASIO_DEBUG_LIST}>
                                                                 $<$<STREQUAL:$<TARGET_PROPERTY:TYPE>,EXECUTABLE>:${CONAN_EXE_LINKER_FLAGS_ASIO_DEBUG_LIST}>>)
    set_property(TARGET CONAN_PKG::asio PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CONAN_INCLUDE_DIRS_ASIO}
                                                                      $<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_ASIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_ASIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_ASIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_ASIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::asio PROPERTY INTERFACE_COMPILE_DEFINITIONS ${CONAN_COMPILE_DEFINITIONS_ASIO}
                                                                      $<$<CONFIG:Release>:${CONAN_COMPILE_DEFINITIONS_ASIO_RELEASE}>
                                                                      $<$<CONFIG:RelWithDebInfo>:${CONAN_COMPILE_DEFINITIONS_ASIO_RELWITHDEBINFO}>
                                                                      $<$<CONFIG:MinSizeRel>:${CONAN_COMPILE_DEFINITIONS_ASIO_MINSIZEREL}>
                                                                      $<$<CONFIG:Debug>:${CONAN_COMPILE_DEFINITIONS_ASIO_DEBUG}>)
    set_property(TARGET CONAN_PKG::asio PROPERTY INTERFACE_COMPILE_OPTIONS ${CONAN_C_FLAGS_ASIO_LIST} ${CONAN_CXX_FLAGS_ASIO_LIST}
                                                                  $<$<CONFIG:Release>:${CONAN_C_FLAGS_ASIO_RELEASE_LIST} ${CONAN_CXX_FLAGS_ASIO_RELEASE_LIST}>
                                                                  $<$<CONFIG:RelWithDebInfo>:${CONAN_C_FLAGS_ASIO_RELWITHDEBINFO_LIST} ${CONAN_CXX_FLAGS_ASIO_RELWITHDEBINFO_LIST}>
                                                                  $<$<CONFIG:MinSizeRel>:${CONAN_C_FLAGS_ASIO_MINSIZEREL_LIST} ${CONAN_CXX_FLAGS_ASIO_MINSIZEREL_LIST}>
                                                                  $<$<CONFIG:Debug>:${CONAN_C_FLAGS_ASIO_DEBUG_LIST}  ${CONAN_CXX_FLAGS_ASIO_DEBUG_LIST}>)

    set(CONAN_TARGETS CONAN_PKG::ncurses CONAN_PKG::restinio CONAN_PKG::catch2 CONAN_PKG::docopt.cpp CONAN_PKG::spdlog CONAN_PKG::http_parser CONAN_PKG::fmt CONAN_PKG::expected-lite CONAN_PKG::optional-lite CONAN_PKG::string-view-lite CONAN_PKG::variant-lite CONAN_PKG::asio)

endmacro()


macro(conan_basic_setup)
    set(options TARGETS NO_OUTPUT_DIRS SKIP_RPATH KEEP_RPATHS SKIP_STD SKIP_FPIC)
    cmake_parse_arguments(ARGUMENTS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN} )

    if(CONAN_EXPORTED)
        conan_message(STATUS "Conan: called by CMake conan helper")
    endif()

    if(CONAN_IN_LOCAL_CACHE)
        conan_message(STATUS "Conan: called inside local cache")
    endif()

    if(NOT ARGUMENTS_NO_OUTPUT_DIRS)
        conan_message(STATUS "Conan: Adjusting output directories")
        conan_output_dirs_setup()
    endif()

    if(NOT ARGUMENTS_TARGETS)
        conan_message(STATUS "Conan: Using cmake global configuration")
        conan_global_flags()
    else()
        conan_message(STATUS "Conan: Using cmake targets configuration")
        conan_define_targets()
    endif()

    if(ARGUMENTS_SKIP_RPATH)
        # Change by "DEPRECATION" or "SEND_ERROR" when we are ready
        conan_message(WARNING "Conan: SKIP_RPATH is deprecated, it has been renamed to KEEP_RPATHS")
    endif()

    if(NOT ARGUMENTS_SKIP_RPATH AND NOT ARGUMENTS_KEEP_RPATHS)
        # Parameter has renamed, but we keep the compatibility with old SKIP_RPATH
        conan_set_rpath()
    endif()

    if(NOT ARGUMENTS_SKIP_STD)
        conan_set_std()
    endif()

    if(NOT ARGUMENTS_SKIP_FPIC)
        conan_set_fpic()
    endif()

    conan_check_compiler()
    conan_set_libcxx()
    conan_set_vs_runtime()
    conan_set_find_paths()
    conan_include_build_modules()
    conan_set_find_library_paths()
endmacro()


macro(conan_set_find_paths)
    # CMAKE_MODULE_PATH does not have Debug/Release config, but there are variables
    # CONAN_CMAKE_MODULE_PATH_DEBUG to be used by the consumer
    # CMake can find findXXX.cmake files in the root of packages
    set(CMAKE_MODULE_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_MODULE_PATH})

    # Make find_package() to work
    set(CMAKE_PREFIX_PATH ${CONAN_CMAKE_MODULE_PATH} ${CMAKE_PREFIX_PATH})

    # Set the find root path (cross build)
    set(CMAKE_FIND_ROOT_PATH ${CONAN_CMAKE_FIND_ROOT_PATH} ${CMAKE_FIND_ROOT_PATH})
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
        set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_PROGRAM})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
        set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_LIBRARY})
    endif()
    if(CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
        set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ${CONAN_CMAKE_FIND_ROOT_PATH_MODE_INCLUDE})
    endif()
endmacro()


macro(conan_set_find_library_paths)
    # CMAKE_INCLUDE_PATH, CMAKE_LIBRARY_PATH does not have Debug/Release config, but there are variables
    # CONAN_INCLUDE_DIRS_DEBUG/RELEASE CONAN_LIB_DIRS_DEBUG/RELEASE to be used by the consumer
    # For find_library
    set(CMAKE_INCLUDE_PATH ${CONAN_INCLUDE_DIRS} ${CMAKE_INCLUDE_PATH})
    set(CMAKE_LIBRARY_PATH ${CONAN_LIB_DIRS} ${CMAKE_LIBRARY_PATH})
endmacro()


macro(conan_set_vs_runtime)
    if(CONAN_LINK_RUNTIME)
        conan_get_policy(CMP0091 policy_0091)
        if(policy_0091 STREQUAL "NEW")
            if(CONAN_LINK_RUNTIME MATCHES "MTd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebug")
            elseif(CONAN_LINK_RUNTIME MATCHES "MDd")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDebugDLL")
            elseif(CONAN_LINK_RUNTIME MATCHES "MT")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded")
            elseif(CONAN_LINK_RUNTIME MATCHES "MD")
                set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
            endif()
        else()
            foreach(flag CMAKE_C_FLAGS_RELEASE CMAKE_CXX_FLAGS_RELEASE
                         CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
                         CMAKE_C_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_MINSIZEREL)
                if(DEFINED ${flag})
                    string(REPLACE "/MD" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
            foreach(flag CMAKE_C_FLAGS_DEBUG CMAKE_CXX_FLAGS_DEBUG)
                if(DEFINED ${flag})
                    string(REPLACE "/MDd" ${CONAN_LINK_RUNTIME} ${flag} "${${flag}}")
                endif()
            endforeach()
        endif()
    endif()
endmacro()


macro(conan_flags_setup)
    # Macro maintained for backwards compatibility
    conan_set_find_library_paths()
    conan_global_flags()
    conan_set_rpath()
    conan_set_vs_runtime()
    conan_set_libcxx()
endmacro()


function(conan_message MESSAGE_OUTPUT)
    if(NOT CONAN_CMAKE_SILENT_OUTPUT)
        message(${ARGV${0}})
    endif()
endfunction()


function(conan_get_policy policy_id policy)
    if(POLICY "${policy_id}")
        cmake_policy(GET "${policy_id}" _policy)
        set(${policy} "${_policy}" PARENT_SCOPE)
    else()
        set(${policy} "" PARENT_SCOPE)
    endif()
endfunction()


function(conan_find_libraries_abs_path libraries package_libdir libraries_abs_path)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${CONAN_FOUND_LIBRARY})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()
    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


function(conan_package_library_targets libraries package_libdir libraries_abs_path deps build_type package_name)
    unset(_CONAN_ACTUAL_TARGETS CACHE)
    unset(_CONAN_FOUND_SYSTEM_LIBS CACHE)
    foreach(_LIBRARY_NAME ${libraries})
        find_library(CONAN_FOUND_LIBRARY NAME ${_LIBRARY_NAME} PATHS ${package_libdir}
                     NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
        if(CONAN_FOUND_LIBRARY)
            conan_message(STATUS "Library ${_LIBRARY_NAME} found ${CONAN_FOUND_LIBRARY}")
            set(_LIB_NAME CONAN_LIB::${package_name}_${_LIBRARY_NAME}${build_type})
            add_library(${_LIB_NAME} UNKNOWN IMPORTED)
            set_target_properties(${_LIB_NAME} PROPERTIES IMPORTED_LOCATION ${CONAN_FOUND_LIBRARY})
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIB_NAME})
            set(_CONAN_ACTUAL_TARGETS ${_CONAN_ACTUAL_TARGETS} ${_LIB_NAME})
        else()
            conan_message(STATUS "Library ${_LIBRARY_NAME} not found in package, might be system one")
            set(CONAN_FULLPATH_LIBS ${CONAN_FULLPATH_LIBS} ${_LIBRARY_NAME})
            set(_CONAN_FOUND_SYSTEM_LIBS "${_CONAN_FOUND_SYSTEM_LIBS};${_LIBRARY_NAME}")
        endif()
        unset(CONAN_FOUND_LIBRARY CACHE)
    endforeach()

    # Add all dependencies to all targets
    string(REPLACE " " ";" deps_list "${deps}")
    foreach(_CONAN_ACTUAL_TARGET ${_CONAN_ACTUAL_TARGETS})
        set_property(TARGET ${_CONAN_ACTUAL_TARGET} PROPERTY INTERFACE_LINK_LIBRARIES "${_CONAN_FOUND_SYSTEM_LIBS};${deps_list}")
    endforeach()

    set(${libraries_abs_path} ${CONAN_FULLPATH_LIBS} PARENT_SCOPE)
endfunction()


macro(conan_set_libcxx)
    if(DEFINED CONAN_LIBCXX)
        conan_message(STATUS "Conan: C++ stdlib: ${CONAN_LIBCXX}")
        if(CONAN_COMPILER STREQUAL "clang" OR CONAN_COMPILER STREQUAL "apple-clang")
            if(CONAN_LIBCXX STREQUAL "libstdc++" OR CONAN_LIBCXX STREQUAL "libstdc++11" )
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")
            elseif(CONAN_LIBCXX STREQUAL "libc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
            endif()
        endif()
        if(CONAN_COMPILER STREQUAL "sun-cc")
            if(CONAN_LIBCXX STREQUAL "libCstd")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=Cstd")
            elseif(CONAN_LIBCXX STREQUAL "libstdcxx")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcxx4")
            elseif(CONAN_LIBCXX STREQUAL "libstlport")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stlport4")
            elseif(CONAN_LIBCXX STREQUAL "libstdc++")
                set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -library=stdcpp")
            endif()
        endif()
        if(CONAN_LIBCXX STREQUAL "libstdc++11")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=1)
        elseif(CONAN_LIBCXX STREQUAL "libstdc++")
            add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)
        endif()
    endif()
endmacro()


macro(conan_set_std)
    conan_message(STATUS "Conan: Adjusting language standard")
    # Do not warn "Manually-specified variables were not used by the project"
    set(ignorevar "${CONAN_STD_CXX_FLAG}${CONAN_CMAKE_CXX_STANDARD}${CONAN_CMAKE_CXX_EXTENSIONS}")
    if (CMAKE_VERSION VERSION_LESS "3.1" OR
        (CMAKE_VERSION VERSION_LESS "3.12" AND ("${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "20" OR "${CONAN_CMAKE_CXX_STANDARD}" STREQUAL "gnu20")))
        if(CONAN_STD_CXX_FLAG)
            conan_message(STATUS "Conan setting CXX_FLAGS flags: ${CONAN_STD_CXX_FLAG}")
            set(CMAKE_CXX_FLAGS "${CONAN_STD_CXX_FLAG} ${CMAKE_CXX_FLAGS}")
        endif()
    else()
        if(CONAN_CMAKE_CXX_STANDARD)
            conan_message(STATUS "Conan setting CPP STANDARD: ${CONAN_CMAKE_CXX_STANDARD} WITH EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS}")
            set(CMAKE_CXX_STANDARD ${CONAN_CMAKE_CXX_STANDARD})
            set(CMAKE_CXX_EXTENSIONS ${CONAN_CMAKE_CXX_EXTENSIONS})
        endif()
    endif()
endmacro()


macro(conan_set_rpath)
    conan_message(STATUS "Conan: Adjusting default RPATHs Conan policies")
    if(APPLE)
        # https://cmake.org/Wiki/CMake_RPATH_handling
        # CONAN GUIDE: All generated libraries should have the id and dependencies to other
        # dylibs without path, just the name, EX:
        # libMyLib1.dylib:
        #     libMyLib1.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     libMyLib0.dylib (compatibility version 0.0.0, current version 0.0.0)
        #     /usr/lib/libc++.1.dylib (compatibility version 1.0.0, current version 120.0.0)
        #     /usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1197.1.1)
        # AVOID RPATH FOR *.dylib, ALL LIBS BETWEEN THEM AND THE EXE
        # SHOULD BE ON THE LINKER RESOLVER PATH (./ IS ONE OF THEM)
        set(CMAKE_SKIP_RPATH 1 CACHE BOOL "rpaths" FORCE)
        # Policy CMP0068
        # We want the old behavior, in CMake >= 3.9 CMAKE_SKIP_RPATH won't affect the install_name in OSX
        set(CMAKE_INSTALL_NAME_DIR "")
    endif()
endmacro()


macro(conan_set_fpic)
    if(DEFINED CONAN_CMAKE_POSITION_INDEPENDENT_CODE)
        conan_message(STATUS "Conan: Adjusting fPIC flag (${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})")
        set(CMAKE_POSITION_INDEPENDENT_CODE ${CONAN_CMAKE_POSITION_INDEPENDENT_CODE})
    endif()
endmacro()


macro(conan_output_dirs_setup)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})

    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
endmacro()


macro(conan_split_version VERSION_STRING MAJOR MINOR)
    #make a list from the version string
    string(REPLACE "." ";" VERSION_LIST "${VERSION_STRING}")

    #write output values
    list(LENGTH VERSION_LIST _version_len)
    list(GET VERSION_LIST 0 ${MAJOR})
    if(${_version_len} GREATER 1)
        list(GET VERSION_LIST 1 ${MINOR})
    endif()
endmacro()


macro(conan_error_compiler_version)
    message(FATAL_ERROR "Detected a mismatch for the compiler version between your conan profile settings and CMake: \n"
                        "Compiler version specified in your conan profile: ${CONAN_COMPILER_VERSION}\n"
                        "Compiler version detected in CMake: ${VERSION_MAJOR}.${VERSION_MINOR}\n"
                        "Please check your conan profile settings (conan profile show [default|your_profile_name])\n"
                        "P.S. You may set CONAN_DISABLE_CHECK_COMPILER CMake variable in order to disable this check."
           )
endmacro()

set(_CONAN_CURRENT_DIR ${CMAKE_CURRENT_LIST_DIR})

function(conan_get_compiler CONAN_INFO_COMPILER CONAN_INFO_COMPILER_VERSION)
    conan_message(STATUS "Current conanbuildinfo.cmake directory: " ${_CONAN_CURRENT_DIR})
    if(NOT EXISTS ${_CONAN_CURRENT_DIR}/conaninfo.txt)
        conan_message(STATUS "WARN: conaninfo.txt not found")
        return()
    endif()

    file (READ "${_CONAN_CURRENT_DIR}/conaninfo.txt" CONANINFO)

    # MATCHALL will match all, including the last one, which is the full_settings one
    string(REGEX MATCH "full_settings.*" _FULL_SETTINGS_MATCHED ${CONANINFO})
    string(REGEX MATCH "compiler=([-A-Za-z0-9_ ]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER)
        set(${CONAN_INFO_COMPILER} ${_CONAN_INFO_COMPILER} PARENT_SCOPE)
    endif()

    string(REGEX MATCH "compiler.version=([-A-Za-z0-9_.]+)" _MATCHED ${_FULL_SETTINGS_MATCHED})
    if(DEFINED CMAKE_MATCH_1)
        string(STRIP "${CMAKE_MATCH_1}" _CONAN_INFO_COMPILER_VERSION)
        set(${CONAN_INFO_COMPILER_VERSION} ${_CONAN_INFO_COMPILER_VERSION} PARENT_SCOPE)
    endif()
endfunction()


function(check_compiler_version)
    conan_split_version(${CMAKE_CXX_COMPILER_VERSION} VERSION_MAJOR VERSION_MINOR)
    if(DEFINED CONAN_SETTINGS_COMPILER_TOOLSET)
       conan_message(STATUS "Conan: Skipping compiler check: Declared 'compiler.toolset'")
       return()
    endif()
    if(CMAKE_CXX_COMPILER_ID MATCHES MSVC)
        # MSVC_VERSION is defined since 2.8.2 at least
        # https://cmake.org/cmake/help/v2.8.2/cmake.html#variable:MSVC_VERSION
        # https://cmake.org/cmake/help/v3.14/variable/MSVC_VERSION.html
        if(
            # 1920-1929 = VS 16.0 (v142 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "16" AND NOT((MSVC_VERSION GREATER 1919) AND (MSVC_VERSION LESS 1930))) OR
            # 1910-1919 = VS 15.0 (v141 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "15" AND NOT((MSVC_VERSION GREATER 1909) AND (MSVC_VERSION LESS 1920))) OR
            # 1900      = VS 14.0 (v140 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "14" AND NOT(MSVC_VERSION EQUAL 1900)) OR
            # 1800      = VS 12.0 (v120 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "12" AND NOT VERSION_MAJOR STREQUAL "18") OR
            # 1700      = VS 11.0 (v110 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "11" AND NOT VERSION_MAJOR STREQUAL "17") OR
            # 1600      = VS 10.0 (v100 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "10" AND NOT VERSION_MAJOR STREQUAL "16") OR
            # 1500      = VS  9.0 (v90 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "9" AND NOT VERSION_MAJOR STREQUAL "15") OR
            # 1400      = VS  8.0 (v80 toolset)
            (CONAN_COMPILER_VERSION STREQUAL "8" AND NOT VERSION_MAJOR STREQUAL "14") OR
            # 1310      = VS  7.1, 1300      = VS  7.0
            (CONAN_COMPILER_VERSION STREQUAL "7" AND NOT VERSION_MAJOR STREQUAL "13") OR
            # 1200      = VS  6.0
            (CONAN_COMPILER_VERSION STREQUAL "6" AND NOT VERSION_MAJOR STREQUAL "12") )
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "gcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 5.0)
            conan_message(STATUS "Conan: Compiler GCC>=5, checking major version ${CONAN_COMPILER_VERSION}")
            conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "clang")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        set(_CHECK_VERSION ${VERSION_MAJOR}.${VERSION_MINOR})
        set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 8.0)
            conan_message(STATUS "Conan: Compiler Clang>=8, checking major version ${CONAN_COMPILER_VERSION}")
            if("${CONAN_COMPILER_MINOR}" STREQUAL "")
                set(_CHECK_VERSION ${VERSION_MAJOR})
                set(_CONAN_VERSION ${CONAN_COMPILER_MAJOR})
            endif()
        endif()
        conan_message(STATUS "Conan: Checking correct version: ${_CHECK_VERSION}")
        if(NOT ${_CHECK_VERSION} VERSION_EQUAL ${_CONAN_VERSION})
            conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "apple-clang" OR CONAN_COMPILER STREQUAL "sun-cc" OR CONAN_COMPILER STREQUAL "mcst-lcc")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
           conan_error_compiler_version()
        endif()
    elseif(CONAN_COMPILER STREQUAL "intel")
        conan_split_version(${CONAN_COMPILER_VERSION} CONAN_COMPILER_MAJOR CONAN_COMPILER_MINOR)
        if(NOT ${CONAN_COMPILER_VERSION} VERSION_LESS 19.1)
            if(NOT ${VERSION_MAJOR}.${VERSION_MINOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR}.${CONAN_COMPILER_MINOR})
               conan_error_compiler_version()
            endif()
        else()
            if(NOT ${VERSION_MAJOR} VERSION_EQUAL ${CONAN_COMPILER_MAJOR})
               conan_error_compiler_version()
            endif()
        endif()
    else()
        conan_message(STATUS "WARN: Unknown compiler '${CONAN_COMPILER}', skipping the version check...")
    endif()
endfunction()


function(conan_check_compiler)
    if(CONAN_DISABLE_CHECK_COMPILER)
        conan_message(STATUS "WARN: Disabled conan compiler checks")
        return()
    endif()
    if(NOT DEFINED CMAKE_CXX_COMPILER_ID)
        if(DEFINED CMAKE_C_COMPILER_ID)
            conan_message(STATUS "This project seems to be plain C, using '${CMAKE_C_COMPILER_ID}' compiler")
            set(CMAKE_CXX_COMPILER_ID ${CMAKE_C_COMPILER_ID})
            set(CMAKE_CXX_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
        else()
            message(FATAL_ERROR "This project seems to be plain C, but no compiler defined")
        endif()
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID AND NOT CMAKE_C_COMPILER_ID)
        # This use case happens when compiler is not identified by CMake, but the compilers are there and work
        conan_message(STATUS "*** WARN: CMake was not able to identify a C or C++ compiler ***")
        conan_message(STATUS "*** WARN: Disabling compiler checks. Please make sure your settings match your environment ***")
        return()
    endif()
    if(NOT DEFINED CONAN_COMPILER)
        conan_get_compiler(CONAN_COMPILER CONAN_COMPILER_VERSION)
        if(NOT DEFINED CONAN_COMPILER)
            conan_message(STATUS "WARN: CONAN_COMPILER variable not set, please make sure yourself that "
                          "your compiler and version matches your declared settings")
            return()
        endif()
    endif()

    if(NOT CMAKE_HOST_SYSTEM_NAME STREQUAL ${CMAKE_SYSTEM_NAME})
        set(CROSS_BUILDING 1)
    endif()

    # If using VS, verify toolset
    if (CONAN_COMPILER STREQUAL "Visual Studio")
        if (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "LLVM" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "llvm" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "clang" OR
            CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Clang")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Clang")
        elseif (CONAN_SETTINGS_COMPILER_TOOLSET MATCHES "Intel")
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "Intel")
        else()
            set(EXPECTED_CMAKE_CXX_COMPILER_ID "MSVC")
        endif()

        if (NOT CMAKE_CXX_COMPILER_ID MATCHES ${EXPECTED_CMAKE_CXX_COMPILER_ID})
            message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}'. Toolset specifies compiler as '${EXPECTED_CMAKE_CXX_COMPILER_ID}' "
                                "but CMake detected '${CMAKE_CXX_COMPILER_ID}'")
        endif()

    # Avoid checks when cross compiling, apple-clang crashes because its APPLE but not apple-clang
    # Actually CMake is detecting "clang" when you are using apple-clang, only if CMP0025 is set to NEW will detect apple-clang
    elseif((CONAN_COMPILER STREQUAL "gcc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "GNU") OR
        (CONAN_COMPILER STREQUAL "apple-clang" AND NOT CROSS_BUILDING AND (NOT APPLE OR NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")) OR
        (CONAN_COMPILER STREQUAL "clang" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang") OR
        (CONAN_COMPILER STREQUAL "sun-cc" AND NOT CMAKE_CXX_COMPILER_ID MATCHES "SunPro") )
        message(FATAL_ERROR "Incorrect '${CONAN_COMPILER}', is not the one detected by CMake: '${CMAKE_CXX_COMPILER_ID}'")
    endif()


    if(NOT DEFINED CONAN_COMPILER_VERSION)
        conan_message(STATUS "WARN: CONAN_COMPILER_VERSION variable not set, please make sure yourself "
                             "that your compiler version matches your declared settings")
        return()
    endif()
    check_compiler_version()
endfunction()


macro(conan_set_flags build_type)
    set(CMAKE_CXX_FLAGS${build_type} "${CMAKE_CXX_FLAGS${build_type}} ${CONAN_CXX_FLAGS${build_type}}")
    set(CMAKE_C_FLAGS${build_type} "${CMAKE_C_FLAGS${build_type}} ${CONAN_C_FLAGS${build_type}}")
    set(CMAKE_SHARED_LINKER_FLAGS${build_type} "${CMAKE_SHARED_LINKER_FLAGS${build_type}} ${CONAN_SHARED_LINKER_FLAGS${build_type}}")
    set(CMAKE_EXE_LINKER_FLAGS${build_type} "${CMAKE_EXE_LINKER_FLAGS${build_type}} ${CONAN_EXE_LINKER_FLAGS${build_type}}")
endmacro()


macro(conan_global_flags)
    if(CONAN_SYSTEM_INCLUDES)
        include_directories(SYSTEM ${CONAN_INCLUDE_DIRS}
                                   "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                                   "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                                   "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                                   "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    else()
        include_directories(${CONAN_INCLUDE_DIRS}
                            "$<$<CONFIG:Release>:${CONAN_INCLUDE_DIRS_RELEASE}>"
                            "$<$<CONFIG:RelWithDebInfo>:${CONAN_INCLUDE_DIRS_RELWITHDEBINFO}>"
                            "$<$<CONFIG:MinSizeRel>:${CONAN_INCLUDE_DIRS_MINSIZEREL}>"
                            "$<$<CONFIG:Debug>:${CONAN_INCLUDE_DIRS_DEBUG}>")
    endif()

    link_directories(${CONAN_LIB_DIRS})

    conan_find_libraries_abs_path("${CONAN_LIBS_DEBUG}" "${CONAN_LIB_DIRS_DEBUG}"
                                  CONAN_LIBS_DEBUG)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELEASE}" "${CONAN_LIB_DIRS_RELEASE}"
                                  CONAN_LIBS_RELEASE)
    conan_find_libraries_abs_path("${CONAN_LIBS_RELWITHDEBINFO}" "${CONAN_LIB_DIRS_RELWITHDEBINFO}"
                                  CONAN_LIBS_RELWITHDEBINFO)
    conan_find_libraries_abs_path("${CONAN_LIBS_MINSIZEREL}" "${CONAN_LIB_DIRS_MINSIZEREL}"
                                  CONAN_LIBS_MINSIZEREL)

    add_compile_options(${CONAN_DEFINES}
                        "$<$<CONFIG:Debug>:${CONAN_DEFINES_DEBUG}>"
                        "$<$<CONFIG:Release>:${CONAN_DEFINES_RELEASE}>"
                        "$<$<CONFIG:RelWithDebInfo>:${CONAN_DEFINES_RELWITHDEBINFO}>"
                        "$<$<CONFIG:MinSizeRel>:${CONAN_DEFINES_MINSIZEREL}>")

    conan_set_flags("")
    conan_set_flags("_RELEASE")
    conan_set_flags("_DEBUG")

endmacro()


macro(conan_target_link_libraries target)
    if(CONAN_TARGETS)
        target_link_libraries(${target} ${CONAN_TARGETS})
    else()
        target_link_libraries(${target} ${CONAN_LIBS})
        foreach(_LIB ${CONAN_LIBS_RELEASE})
            target_link_libraries(${target} optimized ${_LIB})
        endforeach()
        foreach(_LIB ${CONAN_LIBS_DEBUG})
            target_link_libraries(${target} debug ${_LIB})
        endforeach()
    endif()
endmacro()


macro(conan_include_build_modules)
    if(CMAKE_BUILD_TYPE)
        if(${CMAKE_BUILD_TYPE} MATCHES "Debug")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_DEBUG} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "Release")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELEASE} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "RelWithDebInfo")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_RELWITHDEBINFO} ${CONAN_BUILD_MODULES_PATHS})
        elseif(${CMAKE_BUILD_TYPE} MATCHES "MinSizeRel")
            set(CONAN_BUILD_MODULES_PATHS ${CONAN_BUILD_MODULES_PATHS_MINSIZEREL} ${CONAN_BUILD_MODULES_PATHS})
        endif()
    endif()

    foreach(_BUILD_MODULE_PATH ${CONAN_BUILD_MODULES_PATHS})
        include(${_BUILD_MODULE_PATH})
    endforeach()
endmacro()


### Definition of user declared vars (user_info) ###

set(CONAN_USER_NCURSES_lib_suffix "w")