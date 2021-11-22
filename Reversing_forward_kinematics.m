
 % In this case we use those from "UR-5" but any robot's
 % parameters and joint ranges could be used
 clear
  Angles = zeros(6,24);
  pose = zeros(4,4,24);
  for i = 1:24
      for j = 1:6
        Angles(j,i) = randi([-360 360]); 
      end
        pose(1:4,1:4,i) = fkin(Angles(1:6,i));
  end 
  
%%
a = sym('a',[1 6]);
alpha = sym('alpha',[1 6]);
d = sym('d',[1 6]);
thetaOff = sym('thetaOff',[1 6]);
T0_6 = sym(zeros(4,4,24));

for i = 1:24
    T0_6(1:4,1:4,i) = DHTrans(a, alpha, d, thetaOff, Angles(1:6,i));
end
%% 
eqnSet = sym(zeros(4,4,24));
for i = 1:24
    for j = 1:4
        for h = 1:4
            eqnSet(h,j,i)= T0_6(h,j,i) == pose(h,j,i);  
        end 
   end
end
%%
S = solve(eqnSet)

function Pose = fkin(JointAngles)

% The UR5's DH-parameters taken from https://www.universal-robots.com/articles/ur/application-installation/dh-parameters-for-calculations-of-kinematics-and-dynamics
a = [0 -0.425 -0.39225 0 0 0];
d = [0.089159 0 0 0.10915 0.09465 0.0823];
alpha = [pi/2 0 0 pi/2 -pi/2 0];

% Finding end effector related to base using general DHP transformations
Pose = DHTrans(a, alpha, d, zeros(1,6), JointAngles);
end