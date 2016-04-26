require('Ice');
require('jderobot/laser');
require('jderobot/motors');

var Ice = global.Ice;
//console.log(global.jderobot);

var jderobot = global.jderobot;

var id = new Ice.InitializationData();
var communicator;

var Prx = jderobot.LaserPrx;
var srv;
var promiseLaser;

var Prx2 = jderobot.MotorsPrx;

var config = {epname:"Laser",addr:"localhost",port:"8996"};


id.properties = Ice.createProperties();
id.properties.setProperty("Ice.Trace.Network", "3");
id.properties.setProperty("Ice.Trace.Protocol", "1");
communicator = Ice.initialize(id);
   
// Create the proxy to connect
var proxy = communicator.stringToProxy(config.epname+":default -h " + config.addr + " -p " + config.port);


/* Opcion para mantener la conexion abierta*/
Prx.checkedCast(proxy).then(
    function(ar){
        console.log("Laser connected: " + ar);
        srv = ar;     

	srv.getLaserData().then(function (data){
	    console.log("laser frontal: "+data.distanceData[90]);
	});
    },
    function(ex, ar){
        console.log("Laser NOT connected: " + ex);
});


/*Cada vez de que envia o recibe algo se hace una conexion nueva*/
var proxy2 = communicator.stringToProxy("Motors:default -h localhost -p 8999");
Prx2.checkedCast(proxy2).then(
    function(srv2){
        console.log("Motors connected: " + srv2);    
	srv2.setV(50);
    },
    function(ex, ar){
        console.log("Motors NOT connected: " + ex);
});

      


