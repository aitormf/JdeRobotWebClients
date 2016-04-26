#include <Ice/Ice.h>
#include <Number.h>

using namespace std;
using namespace Demo;



int n=0;
class NumberI : public Number {
public:
    virtual int getNumber(const Ice::Current&);
};

int 
NumberI::
getNumber(const Ice::Current&)
{
    return n++;
}

int
main(int argc, char* argv[])
{
    int status = 0;
    Ice::CommunicatorPtr ic;
    try {
        ic = Ice::initialize(argc, argv);
	Ice::PropertiesPtr prop = ic->getProperties();
	std::string Endpoints = prop->getProperty("NumberSrv.Endpoints");
        Ice::ObjectAdapterPtr adapter =
            ic->createObjectAdapterWithEndpoints("NumberServer", Endpoints);
        Ice::ObjectPtr object = new NumberI;
        adapter->add(object, ic->stringToIdentity("Number"));
        adapter->activate();
        ic->waitForShutdown();
    } catch (const Ice::Exception& e) {
        cerr << e << endl;
        status = 1;
    } catch (const char* msg) {
        cerr << msg << endl;
        status = 1;
    }
    if (ic) {
        try {
            ic->destroy();
        } catch (const Ice::Exception& e) {
            cerr << e << endl;
            status = 1;
        }
    }
    return status;
}
