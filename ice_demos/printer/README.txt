Compile:

Ice 3.5

slice2cpp Printer.ice

g++ -I/opt/Ice-3.5.1/include -I. -c server.cpp
g++ -I/opt/Ice-3.5.1/include -I. -c client.cpp
g++ -I/opt/Ice-3.5.1/include -I. -c Printer.cpp


g++ -o client client.o Printer.o -L/opt/Ice-3.5.1/lib -lIce -lIceUtil
g++ -o server server.o Printer.o -L/opt/Ice-3.5.1/lib -lIce -lIceUtil

Ice 3.4

slice2cpp Printer.ice

g++ -I. -c server.cpp
g++  -I. -c client.cpp
g++  -I. -c Printer.cpp

g++ -o client client.o Printer.o  -lIce -lIceUtil
g++ -o server server.o Printer.o  -lIce -lIceUtil

Run:
./server --Ice.Config=server.cfg
./client --Ice.Config=client.cfg
