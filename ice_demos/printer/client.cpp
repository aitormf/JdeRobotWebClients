#include <Ice/Ice.h>
#include <Printer.h>

using namespace std;
using namespace Demo;

int
main(int argc, char* argv[])
{
    int status = 0;
    Ice::CommunicatorPtr ic;
    string s;
    string salir="s";
    try {
        ic = Ice::initialize(argc, argv);
        Ice::ObjectPrx base = ic->propertyToProxy("Proxy");
        PrinterPrx printer = PrinterPrx::checkedCast(base);
        if (!printer)
            throw "Invalid proxy";

	while(true){
		cin>>s;
		if (salir.compare(s)==0){
			break;
		}
		printer->printString(s);
	}
	
        
    } catch (const Ice::Exception& ex) {
        cerr << ex << endl;
        status = 1;
    } catch (const char* msg) {
        cerr << msg << endl;
        status = 1;
    }
    if (ic)
        ic->destroy();
    return status;
}
