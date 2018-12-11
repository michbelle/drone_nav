%%comparazione

final_point=ori(:,si);
final_position=[endpoint.LatestMessage.Pose.Position.X;endpoint.LatestMessage.Pose.Position.Y;endpoint.LatestMessage.Pose.Position.Z];
d=final_point-final_position;
fprintf('errore rispetto a x = %3.2f\n', d(1,1));
fprintf('errore rispetto a y = %3.2f\n', d(2,1));
fprintf('errore rispetto a z = %3.2f\n', d(3,1));

ertot=sqrt(d(3,1)^2+(sqrt(d(1,1)^2+d(2,1)^2)^2);

fprintf('errore TOTALE = %5.2f\n',ertot);
