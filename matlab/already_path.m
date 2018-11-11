%% gia path
%load already existing value of path

%load('col.mat')
load('col.mat')

start_longitude= startposition.LatestMessage.Longitude;	
start_latitude = startposition.LatestMessage.Latitude;

si=size(ori);
si=si(2);

start=[start_longitude,start_latitude];

destination=start;

%theta angolo misurato in senso antiorario
%R distanza punto

for c=1:si
   x=ori(1,c);
   y=ori(2,c);
   theta=atan2(y,x);
   R=sqrt(x^2+y^2);
%calcolato la distanza e l'angolo di bearing si procede a calcolare il valore della variazione di latitudine e longitudine

   dx = R*cos(theta);
   dy = R*sin(theta);

   delta_longitude = dx/(111320*cos(deg2rad(destination(c,2))));
   delta_latitude = dy/110540; %dove i valori son dati per la circonferenza terreste

   final_longitude = destination(c,1) + rad2deg(delta_longitude);
   final_latitude = destination(c,2)+ rad2deg(delta_latitude);

   destination=[destination;[final_longitude,final_latitude]];
end

destination;

%% φ2 = asin( sin φ1 ⋅ cos δ + cos φ1 ⋅ sin δ ⋅ cos θ )
% λ2 = λ1 + atan2( sin θ ⋅ sin δ ⋅ cos φ1, cos δ − sin φ1 ⋅ sin φ2 )
% φ is latitude, λ is longitude, θ is the bearing (clockwise from north), δ is the angular distance d/R; d being the distance travelled, R the earth’s radius

dest=start;
R=6373044.737;
for c=1:si-1
   x=ori(1,c+1)-ori(1,c);
   y=ori(2,c+1)-ori(2,c);
   d=sqrt(x^2+y^2);
   delta=atan2(y,x);
   if x>0 && y >0 || x<0 && y <0
       final_latitude = asin(sin(deg2rad(dest(c,2)))*cos(d/R) + 2*cos(deg2rad(dest(c,2)))*sin(d/R)*cos(delta));
       final_longitude = deg2rad(dest(c,1)) + 1/1.9*atan2( sin(theta)*sin(d/R)*cos(final_latitude), cos(d/R)-sin(deg2rad(dest(c,2)))*sin(final_latitude));
       dest=[dest;[rad2deg(final_longitude),rad2deg(final_latitude)]]; 
   elseif x>0 && y<0 || x<0 && y >0
       final_latitude = asin( sin(deg2rad(dest(c,2)))*cos(d/R) + cos(deg2rad(dest(c,2)))*sin(d/R)*cos(delta));
       final_longitude = deg2rad(dest(c,1)) + atan2( sin(theta)*sin(d/R)*cos(final_latitude), cos(d/R)-sin(deg2rad(dest(c,2)))*sin(final_latitude));
       dest=[dest;[rad2deg(final_longitude),rad2deg(final_latitude)]];
   else
       ori
   end

   %a=sin(deg2rad(dest(c,2)))*cos(d/R)
   %b=cos(deg2rad(dest(c,2)))*sin(d/R)*cos(delta) 
   %d=asin(a+b)
   %rad2deg(d)
   
   %final_latitude = asin( sin(deg2rad(dest(c,2)))*cos(d/R) + cos(deg2rad(dest(c,2)))*sin(d/R)*cos(delta));
   %final_longitude = deg2rad(dest(c,1)) + atan2( sin(theta)*sin(d/R)*cos(final_latitude), cos(d/R)-sin(deg2rad(dest(c,2)))*sin(final_latitude));
   %dest=[dest;[rad2deg(final_longitude),rad2deg(final_latitude)]];
end

dest;

destin=start;

for c=2:si
   x=ori(1,c);
   y=ori(2,c);
   d=sqrt(x^2+y^2);
   delta=atan2(x,y);
   
   %a=sin(deg2rad(dest(c,2)))*cos(d/R)
   %b=cos(deg2rad(dest(c,2atan)))*sin(d/R)*cos(delta)

   final_latitude = asin( sin(deg2rad(destin(1,2)))*cos(d/R) + cos(deg2rad(destin(1,2)))*sin(d/R)*cos(delta));
   final_longitude = deg2rad(destin(1,1)) + atan2( sin(theta)*sin(d/R)*cos(final_latitude), cos(d/R)-sin(deg2rad(destin(1,2)))*sin(final_latitude));
   destin=[destin;[rad2deg(final_longitude),rad2deg(final_latitude)]];
end

destin;



%% iniziare la creazione del file per la navigazione

%intestatura:tipo volo e forme
plan=fopen('planning.plan','w');
fprintf(plan,'{\n"fileType": "Plan",\n"geoFence": {\n\t"circles": [],\n\t"polygons": [],\n\t"version": 2\n},');

fprintf(plan,'\n\t"groundStation": "QGroundControl",\n\t"mission": {\n\t\t "cruiseSpeed": 15,\n\t\t "firmwareType": 12,\n\t\t "hoverSpeed": 5,\n\t\t "items": [');

%takeoff (command 22) e primo punto

fprintf(plan,'\n\t\t{\n\t\t "AMSLAltAboveTerrain": 50,\n\t\t "Altitude": 2,\n\t\t "AltitudeMode": 0,\n\t\t "autoContinue": true,\n\t\t "command": 22,\n\t\t "doJumpId": 1,\n\t\t "frame": 3,\n\t\t "params": [\n\t\t\t 15,\n\t\t\t 0,\n\t\t\t 0, \n\t\t\t null,\n\t\t\t %3.15f,\n\t\t\t %3.15f,\n\t\t\t 2\n\t\t\t ],\n\t\t"type": "SimpleItem"\n\t\t},', dest(2,2), dest(2,1));
%fprintf(plan,'\n\t\t{\n\t\t "AMSLAltAboveTerrain": 50,\n\t\t "Altitude": %3.5f,\n\t\t "AltitudeMode": 0,\n\t\t "autoContinue": true,\n\t\t "command": 22,\n\t\t "doJumpId": 1,\n\t\t "frame": 3,\n\t\t "params": [\n\t\t\t 15,\n\t\t\t 0,\n\t\t\t 0, \n\t\t\t null,\n\t\t\t %3.15f,\n\t\t\t %3.15f,\n\t\t\t %3.5f\n\t\t\t ],\n\t\t"type": "SimpleItem"\n\t\t},', ori(3,2), dest(2,2), dest(2,1), ori(3,2));

%si muove tra i punti
%3.5f
for c=3:(si-1)
   fprintf(plan,'\n\t\t{\n\t\t "AMSLAltAboveTerrain": 50,\n\t\t "Altitude": %3.5f,\n\t\t "AltitudeMode": 0,\n\t\t "autoContinue": true,\n\t\t "command": 16,\n\t\t "doJumpId": %i,\n\t\t "frame": 3,\n\t\t "params": [\n\t\t\t 0,\n\t\t\t 0,\n\t\t\t 0, \n\t\t\t null,\n\t\t\t %3.15f,\n\t\t\t %3.15f,\n\t\t\t %3.5f\n\t\t\t ],\n\t\t"type": "SimpleItem"\n\t\t},',ori(3,c-1),c-1, dest(c,2),dest(c,1), ori(3,c));
end

%stai nella posizione indefinitivamente

fprintf(plan,'\n\t\t{\n\t\t "AMSLAltAboveTerrain": %3.5f,\n\t\t "Altitude": %3.5f,\n\t\t "AltitudeMode": 0,\n\t\t "autoContinue": true,\n\t\t "command": 17,\n\t\t "doJumpId": %i,\n\t\t "frame": 3,\n\t\t "params": [\n\t\t\t 0,\n\t\t\t 0,\n\t\t\t 50, \n\t\t\t null,\n\t\t\t %3.15f,\n\t\t\t %3.15f,\n\t\t\t %3.5f\n\t\t\t ],\n\t\t"type": "SimpleItem"\n\t\t}',ori(3,si), ori(3,si), si,dest(si,2),dest(si,1), ori(3,si));

%conlusione del pacchetto

fprintf(plan,'\n\t\t],\n\t\t"plannedHomePosition": [\n\t\t\t %3.15f,\n\t\t\t %3.15f,\n\t\t\t 0\n\t\t],\n\t\t"vehicleType": 2,\n\t\t"version": 2\n\t},\n\t\t"rallyPoints": {\n\t\t"points": [\n\t\t],\n\t\t"version": 2\n\t\t},\n\t"version": 1\n}',start(2),start(1));
fclose(plan);
