CC	 	   = g++
AR		   = ar
MAKEFILE_V = @

CURDIR := $(shell pwd)

LIB_NAME = muduo_net
DEST_DIR = $(CURDIR)/object
INSTALL_DIR = $(CURDIR)/../../lib

PRJ_INC += -I$(CURDIR)/
PRJ_INC += -I$(CURDIR)/poller
PRJ_INC += -I$(CURDIR)/../../



#vpath %.cc $(subst :, ,$(sort $(dir $(SRC_FILES))))
SRC_INC    = $(CURDIR)
SRC_FILES  = $(subst , , $(foreach dir,$(SRC_INC),$(wildcard $(dir)/*.cc)))
OTMP      := $(notdir $(SRC_FILES))
OTMP      := $(patsubst %.cc,%.o, $(OTMP))
OBJ_FILES += $(patsubst %,$(DEST_DIR)/%,$(OTMP))
OBJ_FILES += $(subst , , $(foreach dir,$(SRC_INC),$(wildcard $(dir)/*.cc)))

#找出poller文件夹下的所有.cc文件转成对应目录下的.o文件
POLLER_INC   = $(CURDIR)/poller
POLLER_FILES = $(subst , , $(foreach dir,$(POLLER_INC),$(wildcard $(dir)/*.cc)))  
POLL_OTMP   := $(notdir $(POLLER_FILES))
POLL_OTMP   := $(patsubst %.cc,%.o, $(POLL_OTMP))
POLL_OBJ    := $(patsubst %,$(DEST_DIR)/%,$(POLL_OTMP))

CXXFLAGS = -g -DCHECK_PTHREAD_RETURN_VALUE -D_FILE_OFFSET_BITS=64 -Wall -Wextra -Werror -Wconversion -Wno-unused-parameter -Wold-style-cast -Woverloaded-virtual -Wpointer-arith -Wshadow -Wwrite-strings -march=native -std=c++11 -rdynamic -O2 -DNDEBUG

ifneq ($(LIB_NAME),)
CFLAGS += -fPIC
CXXFLAGS += -fPIC
BIN_STATIC = lib$(LIB_NAME).a
BIN_DYNAMIC = lib$(LIB_NAME).so

ifeq ($(INSTALL_DIR),)
INSTALL_DIR = $(CURDIR)/lib
endif

endif

.PHONY:all clean

all:$(INSTALL_DIR)/$(BIN_STATIC)

$(INSTALL_DIR)/$(BIN_STATIC): $(OBJ_FILES)
#	$(MAKEFILE_V)echo "  AR  $^"
	@make -C $(POLLER_INC) all
	ar rcs $@ $^ $(POLL_OBJ)
	
	
# how to compile C source
$(DEST_DIR)/%.o: %.cc
	@echo "  $(CC)  $<"
	@$(CC) -o $@ -c $^ $(PRJ_INC) $(CXXFLAGS)
	
clean:
	rm -rf $(DEST_DIR)/*.o
	@make -C $(POLLER_INC) clean
	rm -rf $(INSTALL_DIR)/$(BIN_STATIC)
	
