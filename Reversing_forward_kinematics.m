
 % In this case we use those from "KUKA KR 6 R900-2" but any robot's
 % parameters and joint ranges could be used.
 robot = 'KUKA-KR-6-R900-2';
 
  Angles = zeros(6,24);
  RDKpose = zeros(4,4,24);
  for i = 1:24
        Angles(1,i) = randi([-170 170]); 
        Angles(2,i) = randi([-190 45]); 
        Angles(3,i) = randi([-120 156]); 
        Angles(4,i) = randi([-185 185]); 
        Angles(5,i) = randi([-120 120]); 
        Angles(6,i) = randi([-350 350]); 
        
        RDKpose(1:4,1:4,i) = RDKRobPose(robot, Angles(1:6,i))
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
            
            %eqnSet = [eqnSet eqn];
        end 
   end
end
%S = solve(T0_6 == RDKpose, a,alpha,d,thetaOff)

%% 
eqn = [x + 2*y == u, 4*x + 5*y == v]
