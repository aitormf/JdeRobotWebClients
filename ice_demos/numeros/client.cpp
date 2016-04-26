#include <Ice/Ice.h>
#include <Number.h>

using namespace std;
using namespace Demo;

int
main(int argc, char* argv[])
{
    int status = 0;
    Ice::CommunicatorPtr ic;
    int i;
    try {
        ic = Ice::initialize(argc, argv);
        Ice::ObjectPrx base = ic->propertyToProxy("Proxy");
        NumberPrx num = NumberPrx::checkedCast(base);
        if (!num)
            throw "Invalid proxy";

	while(true){
		i=num->getNumber();
		cout<<i<<endl;
		sleep(1);
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
