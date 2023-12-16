function [Particles,Particle_Velocity] = ComputeVelocity(Particles,timeScale,spaceScale)

%% Particle Position

for k = 1:size(Particles,2)

    Particles{1,k}(:,1) = Particles{1,k}(:,1)*timeScale ;

    Particles{1,k}(:,2:3) = Particles{1,k}(:,2:3)*spaceScale ;

end

%% Particle Velocity

Particle_Velocity = cell( size(Particles ) ) ; 

for k = 1:size(Particles,2)

    Particle_Velocity{1,k}(:,1) = Particles{1,k}(1:end-1,1) ;

    Particle_Velocity{1,k}(:,2) = sqrt( diff( Particles{1,k}(:,2) ).^2 + diff( Particles{1,k}(:,3) ).^2 ) ./ diff( Particles{1,k}(:,1) ) ; 

end