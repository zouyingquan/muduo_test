
CURDIR = $(pwd)
CC = g++
MUDO_SRC_INC_PATH = /home/share/workspace/MuduoLearn/Muduo_Src/muduo/
MUDO_INC_PATH = /home/share/workspace/MuduoLearn/Muduo_Src/build/release-install-cpp11/include
MUDO_LIB_PATH = /home/share/workspace/MuduoLearn/Muduo_Src/build/release-install-cpp11/lib

PRJ_LIB += -lmuduo_net
PRJ_LIB += -lmuduo_base


test:test.cc
	$(CC) -o $@ $^ -I$(MUDO_SRC_INC_PATH) -L$(MUDO_LIB_PATH) $(PRJ_LIB) -std=c++11 -lpthread

