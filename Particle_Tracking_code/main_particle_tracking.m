%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Copyright 2023 Jonatan Mac Intyre
% ORCID https://orcid.org/0000-0002-3383-0946
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%      http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%
% Code description:
%
% The present code allows to track small object in a video, determine their
% position as a function of time. It computes the velocity of each object.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Particle Tracking 

clear all 
clearvars -global
addpath(genpath(pwd))
clc 

%% Define parameters 

file = 'lead2.3_S0001.avi' ; 

% Select the frame rate to analyze and the step
FirstFrame = 1 ; 
LastFrame = 200 ; 
FrameRate = 5 ; 

% Show video with particle tracking: 'yes' or 'no'
showVideo = 'yes' ; 

% Set the Time Scale
timeScale = 1e-4 ; % time/frame

%% Run code

[Particles,Particle_Velocity,Settings] = run_analysis(file,FirstFrame,LastFrame,FrameRate,showVideo,timeScale) ; 

clear file FirstFrame LastFrame FrameRate spaceScale timeScale showVideo

fprintf('Total number of particles detected: %1.f \n', size(Particles,2) )
