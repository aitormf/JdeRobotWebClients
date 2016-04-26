Compile:

slice2cpp Number.ice

g++ -I. -c server.cpp
g++  -I. -c client.cpp
g++  -I. -c Number.cpp


g++ -o client client.o Number.o  -lIce -lIceUtil
g++ -o server server.o Number.o  -lIce -lIceUtil

Run:
./server --Ice.Config=server.cfg
./client --Ice.Config=client.cfg
