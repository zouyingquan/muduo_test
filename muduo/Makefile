
CURDIR = $(shell pwd)


.PYHON:all clean



all: bulid_base bulid_net

bulid_net:
	@echo "------------------muduo_net---------------------"
	@make -C $(CURDIR)/net all
	
bulid_base:
	@echo "------------------bulid_base---------------------"
	@make -C $(CURDIR)/base all
	
clean:
	@echo "------------------muduo_net clean---------------------"
	@make -C $(CURDIR)/net clean
	@echo "------------------bulid_base clean---------------------"
	@make -C $(CURDIR)/base clean
