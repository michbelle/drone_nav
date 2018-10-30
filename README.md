# drone_nav
navigazione con moveit/gazebo e groundstation

## uav_navigation
La cartella uav_navigation contiene i file necessari alla raccolta dei punti presi dal laser  
e la generazione della mappa octomap che riconosce le collisioni dentro moveit  

## matlab
La cartella matlab contiene gli script per la generazione dei waypoint del drone  
e lo script che fornisce la lunghezza della navigazione

## Prerequisiti
Per il funzionamento è necessario installare il 
[px4](https://dev.px4.io/en/setup/dev_env_linux.html#jmavsimgazebo-simulation)
ros e gazebo oppure se già installato ros, solo i nodi mavros e mavlink.

## Esecuzione
Basta eseguire catkin_make nella cartella uav_navigation e poi collegarla alla directory ros  
Eseguire il file sh e poi dovrebbe essere eseguito
