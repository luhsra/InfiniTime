# check if already run. Changing the compiler var can cause reconfigure so don't want to do it again
if(DEFINED ARM_CLANG_TOOLCHAIN)
    return()
endif()
set(ARM_CLANG_TOOLCHAIN TRUE)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

set(TOOLCHAIN_PREFIX arm-none-eabi-)

# Without that flag CMake is not able to pass test compilation check
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(EXTRA_FLAGS "--target=arm-none-eabi --rtlib=libgcc --unwindlib=libgcc -l:crt0.o -l:crti.o")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${EXTRA_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${EXTRA_FLAGS} --stdlib=libstdc++ -nostdlib++ -lstdc++ -lsupc++")

separate_arguments(CXX_LIB_LIST UNIX_COMMAND ${CXX_STDLIB})
message(${CXX_STDLIB})
message(${CXX_LIB_LIST})
include_directories(BEFORE ${CXX_LIB_LIST})

# set(CMAKE_AR undefined)
# set(CMAKE_RANLIB undefined)

# set(CMAKE_OBJCOPY undefined)
# set(CMAKE_SIZE_UTIL undefined)
