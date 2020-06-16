%input variables
L1= 4; %length of first link
L2= 3; %length of second link
x0 = rand; %X-Coordinate of the first revolute joint 
y0 = rand; %Y-Coordinate of the first revolute joint
%the angle that second link makes with X-axis ranges from 0 deg to 180 deg
theta1 = linspace(45,135,10); %total 10 angles in the range of theta1
%the angle that second link makes with X-axis ranges from 0 deg to 180 deg
theta2 = linspace(0,180,30); %total 30 angles in the range of theta2
ct=1; %ct denotes each frame/configuration of the robotic arm
%for each of the 10 angles of theta1, there are 30 angles of theta2
for i=1:length(theta1)
    THETA1=theta1(i); %varying the values of theta1
    for j=1:length(theta2)
        THETA2=theta2(j); %varying the values of theta2
        %coordinates of the second revolute joint
        x1 = x0 + L1*cosd(THETA1); %X-Coordinate
        y1 = y0 + L1*sind(THETA1); %Y-Coordinate
        %coordinates of the manipulator
        x2 = x1 + L2*cosd(THETA2); %X-Coordinate
        y2 = y1 + L2*sind(THETA2); %Y-Coordinate
        %plotting the link coordinates
        plot([x0 x1],[y0 y1],[x1 x2],[y1 y2], 'linewidth', 3)
        axis([-10 10 -10 10])
        pause(0.05)
        xlabel('X-AXIS')
        ylabel('Y-AXIS')
        %introducing an array containing all the frames (ct) of the arm
        M(ct) = getframe(gcf)
        ct = ct+1; %moving onto the next frame/configuration after each loop
    end
end
%introducing a video file with name and type of file
videofile = VideoWriter('forward-kiematics of 2R Robot.avi', 'Uncompressed AVI')
%opening , writing and closing the video file
open(videofile) %opening the video file
writeVideo(videofile,M) %writing the frames array into the video file
close(videofile) %closing the videofile
        