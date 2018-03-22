%% Example file for assignments
% In this example, you can see how comments code and results are
% converted into a document using the MATLAB command publish.
% To get some hints on how you can customize the output, try
% help publish.
% To publish this file as a pdf-file give the command
% publish('example.m','format','pdf','outputDir','.'). 

%% Code
% This is the code implemented for the assignment. The output will be
% shown after the code.

x = pi./[4 3 2];

y = sin(x)

xx = 0:pi/100:pi;

yy1 = sin(2*xx);
yy2 = sin(4*xx);

%% Plots
% Then there are some plots that we would like to include
figure(1)
H=plot(xx,yy1,'-o',xx,yy2,'-o');

% Make the lines thicker and the circles larger
set(H,'LineWidth',2,'MarkerSize',8)

% Make the numbers on the axis larger
set(gca,'FontSize',18)

% Add labels and a legend
xlabel('x')
ylabel('sin(ax)')
legend('a=2','a=4')

% Make the axis fit the plot

axis tight