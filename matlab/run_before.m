%% Inizializzazione
% Si lancia per iniziare le variabili
% si lancia questo file, poi gli altri
rosinit;
%stepss = rossubscriber('/move_group/result');
%orientation = rossubscriber('/move_group/display_planned_path');
startposition = rossubscriber('/mavros/global_position/global');
endpoint = rossubscriber('/mavros/local_position/pose');
%c=fopen('risult', 'w')
