% This is the main file
% =====================

clear all; clc;

% Accessing the general functions
% ===============================
 
addpath D:\Office\Research\Function\ 

% Sensing the need of medication
% ==============================

Parameters;     % System parameters

Medication_need;
save X0 X0

pause(1);

%%%%%%%%%%%%%%%%%
% Time Simulation
%%%%%%%%%%%%%%%%%

clear all; % clc;

Parameters;     % System parameters
load X0        % IC for bad patient

%T_sim;
%Plot_fig;

T_sim_compare;  % Comparison with linear control
Plot_fig_compare;
