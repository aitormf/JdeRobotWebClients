Pasos que he seguido para crear la app de ejemplo:
1- Instalar JdeRobot, las instrucciones están en el siguiente link: http://jderobot.org/index.php/Manual-5#Installing_JdeRobot_5

2- Instalar ICE-JS, las instrucciones están en el siguiente link: http://jderobot.org/Aitormf-tfg#IceJS

3- Descargar el repositorio de JdeRobot: 
      git clone https://github.com/RoboticsURJC/JdeRobot.git

4- Compilar los interfaces ICE de JdeRobot para JS
   4.1 crear el directorio js_files: 
          mkdir js_files
   4.2 copiar el directorio ~/JdeRobot/src/stable/interfaces/slice/jderobot dentro de js_files: 
          cp -r ~/JdeRobot/src/stable/interfaces/slice/jderobot js_files
   4.3 moverse a js_files y crear los ficheros javascript: 
	  slice2js -I. jderobot/*.ice
   4.4 borrar los slice: 
          rm -r jderobot

5- crear carpeta para contener la app: 
      mkdir app

6- copiar la carpeta node_modules al directorio de la app: 
      cp -r /opt/IceJS-0.1.0/node_modules app

7- crear directorio jderobot en el node_modules de la app y copiar todos los js creados de los interfaces ICE dentro
      mkdir app/node_modules/jderobot
      cp js_files/* app/node_modules/jderobot/

8- crear app.js y escribir el código de la aplicación
