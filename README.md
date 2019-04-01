#Da sistemare:
- verificare simulazione funzionante da pc esterno dopo aver installato simulazione da px4
- provare ad usare QGis per la costruzione dell'ambiente 3d


# drone_nav
pachetti ROS per la navigazione con moveit/gazebo e groundstation

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
,se si vuole scegliere diverse groundstation basta basta modificare il file di generazione dei waypoints nei file matlab.

## Esecuzione
Per installare tutto basta eseguire il file sh  
source initial_ros_px4_simu.sh  
che installa la simulazione fornita da px4 con ROS kinect e i pacchetti ros mavros e mavlink per la connessione con il drone (il file è preso dal sito px4 indicato in precedenza data: 21/12/2018)  
Poi basta eseguire catkin_make nella cartella uav_navigation e poi collegarla alla directory ros  
Eseguire il file sh e poi inizia il divertimento
