%%Banchmark
%Acquisisco i dati del path calcolato da MoveIt

%rosinit;
orientation = rossubscriber('/move_group/display_planned_path');
si=size(orientation.LatestMessage.Trajectory.MultiDofJointTrajectory.Points);
si=si(1);
for x=1:si
    X = orientation.LatestMessage.Trajectory.MultiDofJointTrajectory.Points(x).Transforms.Translation.X;
    Y = orientation.LatestMessage.Trajectory.MultiDofJointTrajectory.Points(x).Transforms.Translation.Y;
    Z = orientation.LatestMessage.Trajectory.MultiDofJointTrajectory.Points(x).Transforms.Translation.Z;
    QW = orientation.LatestMessage.Trajectory.MultiDofJointTrajectory.Points(x).Transforms.Rotation.W;
    QX = orientation.LatestMessage.Trajectory.MultiDofJointTrajectory.Points(x).Transforms.Rotation.X;
    QY = orientation.LatestMessage.Trajectory.MultiDofJointTrajectory.Points(x).Transforms.Rotation.Y;
    QZ = orientation.LatestMessage.Trajectory.MultiDofJointTrajectory.Points(x).Transforms.Rotation.Z;
    QWW=[QWW;QW];
    QXX=[QXX;QX];
    QYY=[QYY;QY];
    QZZ=[QZZ;QZ];

    A=[X;Y;Z];
	ori=[ori,A];
	x=x+1;
end
%ori
Q=quaternion(QWW,QXX,QYY,QZZ);

lunghezza_tot=0.0000;

for c=2:si
    x=ori(c)-ori(c-1);
    y=ori(c)-ori(c-1);
    z=ori(c)-ori(c-1);
    lunghezza_sez=sqrt(sqrt(x^2+y^2)+z^2);
    lunghezza_tot = lunghezza_tot + lunghezza_sez;
end

lunghezza_tot