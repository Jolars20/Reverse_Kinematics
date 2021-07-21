function tform = RDKRobPose(robot, theta)
%clc
%close
%clear

% global robot

% Generate a Robolink object RDK. This object interfaces with RoboDK.
RDK = Robolink;
RDK.HideRoboDK();
RDK.ItemList()
%% 

%if size(RDK.ItemList()) < 2  
%    Robot_path = append('C:\Users\Johsb\Desktop\Skoleting\Robotteknologi 09-2020 -\2. Semester\Reversing Forward Kinematics\',robot, '.robot');
%    robot = RDK.AddFile(Robot_path); %RDK.Item(robot); %RDK.ItemUserPick('Select one robot', RDK.ITEM_TYPE_ROBOT);
%else 
%    robot = RDK.Item(robot);
%end
%% 
robot = RDK.Item(robot,2)
%if robot.Valid() == 0
%    error('No robot selected');
%end

tform = robot.SolveFK(theta)
end 