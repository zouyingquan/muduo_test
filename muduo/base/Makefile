CC = g++
CURDIR := $(shell pwd)

LIB_NAME = muduo_base
DEST_DIR = $(CURDIR)/object
INSTALL_DIR = $(CURDIR)/../../lib


PRJ_INC += -I$(CURDIR)
PRJ_INC += -I$(CURDIR)/../../
SRC_INC += $(CURDIR)


SRC_FILES = $(subst , , $(foreach dir,$(SRC_INC),$(wildcard $(dir)/*.cc)))


MAKEFILE_V = @

#vpath %.cc $(subst :, ,$(sort $(dir $(SRC_FILES))))

OTMP := $(notdir $(SRC_FILES))
OTMP := $(patsubst %.cc,%.o, $(OTMP))

DEP_DIR := $(DEST_DIR)

OBJ_FILES += $(patsubst %,$(DEST_DIR)/%,$(OTMP))
DEP_FILES += $(patsubst %.o,$(DEP_DIR)/%.d,$(OTMP))

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

.PHONY:all install

all:$(INSTALL_DIR)/$(BIN_STATIC)
	
$(INSTALL_DIR)/$(BIN_STATIC): $(OBJ_FILES)
	$(MAKEFILE_V)echo "  AR  $^"
	$(AR) rcs $@ $^
	

	
# how to compile C source
$(DEST_DIR)/%.o: %.cc
	$(MAKEFILE_V)echo "  $(CC)  $<"
	$(MAKEFILE_V)$(CC) -o $@ -MMD -MT $@ -c $< $(PRJ_INC) $(CXXFLAGS)
#	> $(DEP_DIR)/$*.d 
#	$(MAKEFILE_V)cp -f $(DEP_DIR)/$*.d $(DEP_DIR)/$*.d.tmp
#	$(MAKEFILE_V)sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' < $(DEP_DIR)/$*.d.tmp | fmt -1 | sed -e 's/^ *//' -e 's/$$/:/' >> $(DEP_DIR)/$*.d
#	$(MAKEFILE_V)rm -f $(DEP_DIR)/$*.d.tmp

clean:
	rm -rf $(DEST_DIR)/*
	rm -rf $(INSTALL_DIR)/$(BIN_STATIC)
