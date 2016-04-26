/*
 * client's Constructor.
 * Params:
 *     - serv (server's direction and port)={dir:direction,port: port}
 *     - outid output's id
 */
function NumberClient (serv,outid){
   /*************************
    **** Public objects  ****
    *************************/
   this.serv=serv;
   this.outid=outid;
   
   /*************************
    **** Private objects ****
    *************************/
   var w;
   
   /*************************
    **** Private methods ****
    *************************/
   
   /*
    * writeLine
    * displays server's response
    */
   var writeLine = function (msg)
   {
      out=document.getElementById(outid);
      out.innerHTML=out.innerHTML + msg + "\n";
      //$("#output").val($("#output").val() + msg + "\n");
      //$("#output").scrollTop($("#output").get(0).scrollHeight);
      out.scrollTop=0;
   };
   
   
   /*************************
    ** Privileged methods ***
    *************************/
   
   /*
    * start
    * run client 
    */
   this.start= function(){
      //worker, serv, outid checks
      if (!window.Worker) {
         alert("This application does not work in this browser");
         return;
      }
      if (!serv||!serv.dir||!serv.port) {
         alert("The server's data are not well defined");
         return;
      } 
      if (!outid) {
         alert("Not defined where the output (outid)");
         return;
      } 
      w = new Worker("js/numberclientjs/number_worker.js");
      w.onerror=function(e) {
         console.log(e);
         alert(""+e);
      };

      w.onmessage = function(event) {
        writeLine(event.data);
      };
      w.postMessage(serv);
   };
   
   
   /*
    * stop
    * stop client 
    */
   this.stop= function () {
      //console.log("stop");
      if (w){
         w.terminate();
         w = undefined;
      }
   };
   /*
    * isrunning
    * Returns a boolean indicating if the client is running
    */
   this.isrunning= function () {
      return w!=undefined;
   };
   
   /*
    * restart
    * stops and start client
    */
   this.restart= function () {
      stop();
      start();
   };
}
