#Da sistemare
- /drone_nav/uav_navigation/src/drone_planning/model/iris2/iris1.urdf : 
bisogna modificare all'inteno del file descritto il link ai modelli .dea, /home/michele/drone_nav/uav_navigation/src/drone_planning/model/iris2/*.dae con /home/nome_utente/...
-


# drone_nav
navigazione con moveit/gazebo e groundstation

### uav_navigation
La cartella uav_navigation contiene i file necessari alla raccolta dei punti presi dal laser e la generazione della mappa octomap che riconosce le collisioni dentro moveit  

### matlab
La cartella matlab contiene gli script per la generazione dei waypoints del drone e lo script che fornisce la lunghezza della navigazione e il tempo di risoluzione degli algoritmi

## Prerequisiti
- ROS kinetic per Ubuntu 16.04 (per il laser  e octomap sono necessari almeno 8GB di RAM)
- Per il funzionamento è necessario installare il 
[px4](https://dev.px4.io/en/setup/dev_env_linux.html#jmavsimgazebo-simulation)  
possibile ma non del tutto testato il funzionamento con la simulazione con ardupilot
[Ardupilot&Gazebo](http://ardupilot.org/dev/docs/using-gazebo-simulator-with-sitl.html)  
- Mavros e mavlink.
- Groudstation
[Qgroundstation](http://qgroundcontrol.com/)
,se si vuole scegliere diverse groundstation basta basta modificare il file di generazione dei waypoints nei file matlab che lo generano.

## Esecuzione
Basta eseguire catkin_make nella cartella uav_navigation e poi collegarla alla directory ros  
Eseguire il file sh e poi inizia il divertimento
