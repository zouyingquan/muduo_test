#include <stdio.h>

#include "muduo/net/EventLoop.h"
#include "muduo/net/InetAddress.h"
#include "muduo/net/Acceptor.h"



using namespace muduo;
using namespace muduo::net;

void newConnection(int sockfd,const InetAddress& addr)
{
	printf("new connection comming !!!\n");
}

int main()
{
	printf("main() : pid = %d \n",getpid());
	InetAddress listenAddr(9981);
	EventLoop loop;
	
	Acceptor acceptor(&loop,listenAddr,false);
	acceptor.setNewConnectionCallback(newConnection);
	acceptor.listen();

	loop.loop();
	
	return 0;
}

