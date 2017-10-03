#This target is to ensure accidental execution of Makefile as a bash script will not execute commands like rm in unexpected directories and exit gracefully.
.prevent_execution:
	exit 0

CC = g++

#remove @ for no make command prints
DEBUG = @

APP_DIR = .
APP_INCLUDE_DIRS += -I $(APP_DIR)

#Executable name is set to sample
APP_NAME = sample
APP_SRC_FILES = $(shell find $(APP_DIR)/ -name '*.cpp')

#Add Include Directories.
#Set APPD_IOT_SDK_PATH environment variable to the directory where IoT C++ SDK is installed.
CURL_DIR=/usr/include/curl
SDK_HEADER_DIR= $(APPD_IOT_SDK_PATH)/include
SDK_LIB_DIR= $(APPD_IOT_SDK_PATH)/lib

SDK_INCLUDE_DIRS += -I$(CURL_DIR)
SDK_INCLUDE_DIRS += -I$(SDK_HEADER_DIR)

#Add Linker Flags
LD_FLAG += -lcurl
LD_FLAG += -lappdynamics_iot
LD_FLAG += -L$(SDK_LIB_DIR)

#Aggregate all include and src directories
INCLUDE_ALL_DIRS += $(SDK_INCLUDE_DIRS)
INCLUDE_ALL_DIRS += $(APP_INCLUDE_DIRS)
SRC_FILES += $(APP_SRC_FILES)

#Add Compiler flags
COMPILER_FLAGS += -Wall


MAKE_CMD = $(CC) $(SRC_FILES) $(COMPILER_FLAGS) -o $(APP_NAME) $(LD_FLAG) $(INCLUDE_ALL_DIRS)

all:
	$(DEBUG)$(MAKE_CMD)

clean:
	rm -f $(APP_DIR)/$(APP_NAME)
