% Matlab code for generating and saving a figure as eps and pdf
%
% T. Nordling 8.9.2009

%% Generates and saves the Step response example figure

% Introduces two systems as transfer functions
G1 = tf([1],[2 1])
G2 = tf([0.5],[1 0.1 1])

% Create figure
fig_size = [15 10]; %[width height] Sets figure size app. to text width
f1 = figure(1); %Opens a new figure
hold('all'); %Allows you to plot several things in the same figure

% Step response of G1
[y t] = step(G1, 20);
plot([0 20],[1 1],'k:') %Marks the final value using a black dotted line
plot(t,y,'b-') %Plots the step response using a blue solid line
text('Interpreter','latex','String','$$G_{1}(s) = \frac{1}{2s+1}$$',...
	'Position',[14 0.92],'FontSize',10) %Annotates the curve

% Step response of G2
[y t] = step(G2, 20);
plot([0 20],[0.5 0.5],'k:') %Marks the final value using a black dotted line
plot(t,y,'r--') %Plots the step response using a red dashed line
text('Interpreter','latex','String','$$G_{2}(s) = \frac{0.5}{s^2+0.1s+1}$$',...
	'Position',[14 0.22],'FontSize',10) %Annotates the curve

% Figure properties
axis([0 20 0 1.1]) %Selects the axis area
grid off %Turns off grid
set(gcf,'PaperPositionMode','manual', ... %Allows you to position the figure
      'PaperUnits', 'centimeters', ... %Units for the figure
      'PaperSize', fig_size, ... %Sets the figure size 
      'PaperPosition', [0 0 fig_size(1) fig_size(2)]); %[left bottom width height] Makes a thight bounding box
set(gca, 'Color','none'); %Makes the axis transparent

% Annotation of the plot
xlabel('Time (sec)','Units','pixels','FontSize',10); %X label
ylabel('Amplitude (cm)','Units','pixels','FontSize',10);%Y label

% Saves the figure to a file
print -f1 -depsc2 -noui -painters -tiff -r600 Stepresponse %Saves as eps including a preview tiff
print -f1 -dpdf -noui -painters -r600 Stepresponse %Saves as pdf (noui removes the user interface from the figure)
