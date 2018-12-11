%%Banchmark
%Acquisisco i dati del path calcolato da MoveIt

%rosinit;
%stepss = rossubscriber('/move_group/result');
si=size(stepss.LatestMessage.Result.PlannedTrajectory.MultiDofJointTrajectory.Points);
si=si(1);
for x=1:si
    X = stepss.LatestMessage.Result.PlannedTrajectory.MultiDofJointTrajectory.Points(x).Transforms.Translation.X;
    Y = stepss.LatestMessage.Result.PlannedTrajectory.MultiDofJointTrajectory.Points(x).Transforms.Translation.Y;
    Z = stepss.LatestMessage.Result.PlannedTrajectory.MultiDofJointTrajectory.Points(x).Transforms.Translation.Z;
    QW = stepss.LatestMessage.Result.PlannedTrajectory.MultiDofJointTrajectory.Points(x).Transforms.Rotation.W;
    QX = stepss.LatestMessage.Result.PlannedTrajectory.MultiDofJointTrajectory.Points(x).Transforms.Rotation.X;
    QY = stepss.LatestMessage.Result.PlannedTrajectory.MultiDofJointTrajectory.Points(x).Transforms.Rotation.Y;
    QZ = stepss.LatestMessage.Result.PlannedTrajectory.MultiDofJointTrajectory.Points(x).Transforms.Rotation.Z;
    QWW=[QWW;QW];
    QXX=[QXX;QX];
    QYY=[QYY;QY];
    QZZ=[QZZ;QZ];

    A=[X;Y;Z];
	ori=[ori,A];
end
%ori
Q=quaternion(QWW,QXX,QYY,QZZ);

lunghezza_tot=0.0000;

for c=2:si
    x=ori(1,c)-ori(1,c-1);
    y=ori(2,c)-ori(2,c-1);
    z=ori(3,c)-ori(3,c-1);
    lunghezza_sez=sqrt(sqrt(x^2+y^2)+z^2);
    lunghezza_tot = lunghezza_tot + lunghezza_sez;
end

lunghezza_tot
time=stepss.LatestMessage.Result.PlanningTime
