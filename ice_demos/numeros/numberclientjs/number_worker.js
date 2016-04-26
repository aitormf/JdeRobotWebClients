var window=self;
var global=self;

importScripts('./Ice.min.js');
importScripts('./Number.js');

var server;

var id = new Ice.InitializationData();
var communicator;
var connection;

var Promise = Ice.Promise;
var NumberPrx = Demo.NumberPrx;

function pedirNumero(prx){
    NumberPrx.checkedCast(prx).then(function(server){
        console.log("conectado");
            server.getNumber().then(function (numero){
                 postMessage(numero);
                setTimeout(pedirNumero(prx),500);
        },function(err){console.log(err)});
    },function(err){console.log(err)});
}

onmessage = function(e) {
    server= e.data;
    id.properties = Ice.createProperties();
    communicator = Ice.initialize();
  console.log(server.dir);
    
    var proxy = communicator.stringToProxy("Number:ws -h " + server.dir + " -p " + server.port);
    //console.log(proxy);

        pedirNumero(proxy);
   // var server=NumberPrx.checkedCast(proxy);
    //var numero=  server.getNumber();
    //console.log(numero);
  /* NumberPrx.checkedCast(proxy).then(function(server){
        console.log("conectado");
            server.getNumber().then(function (numero){
                 postMessage(numero);
        },function(err){console.log(err)});
    },function(err){console.log(err)});*/
  //var workerResult = 'Result: ' + (e.data[0] * e.data[1]);
  //console.log('Posting message back to main script');
  //postMessage(workerResult);
}
