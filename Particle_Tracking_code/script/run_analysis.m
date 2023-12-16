function [Particles,Particle_Velocity,Settings] = run_analysis(file,FirstFrame,LastFrame,FrameRate,showVideo,timeScale,spaceScale)

%% Detect particles 

[CropArea,data,FrameNumber] = ParticleDetection(file,FirstFrame,LastFrame,FrameRate,showVideo) ;

%% Particle Tracking 

[Particles] = ParticleTracking(data,FrameNumber) ; 

%% Scales convertion and velocity calculation

[Particles,Particle_Velocity] = ComputeVelocity(Particles,timeScale,spaceScale) ; 

%% Allocate and delete variables

clear data FrameNumber showVideo

Settings.file = file ;
Settings.FirstFrame = FirstFrame ; 
Settings.LastFrame = LastFrame ; 
Settings.FrameRate = FrameRate ; 
Settings.spaceScale = spaceScale ;
Settings.timeScale = timeScale ;
Settings.CropArea = CropArea ;

clear file FirstFrame LastFrame FrameRate spaceScale timeScale CropArea
