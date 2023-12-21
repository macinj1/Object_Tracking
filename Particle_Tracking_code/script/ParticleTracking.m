function [Particles] = ParticleTracking(data,FrameNumber)

%% Particle Tracking

DI = size(data{1,1},1) ;

Particles_aux = cell(1,DI) ; 

for k = 1:DI

    Particles_aux{1,k} = [FrameNumber(1) data{1,1}(k,:)] ; 

end


% 

clc 

DI = size(data,1) ;
Particles = cell(1,1) ; 

for k = 2:DI  

    % Sort particles from frame

    particles_new_frame = [] ; 
    particles_to_delete = [] ;

    for s = 1:size(Particles_aux,2)

        [d,p] = min( pdist2( Particles_aux{1,s}(end,2:3) , data{k,1} ) ) ;

        particles_new_frame = cat(1,particles_new_frame,p) ; 

        if d <= 10

            Particles_aux{1,s} = cat( 1 , Particles_aux{1,s} , [FrameNumber(k) data{k,1}(p,:)] ) ; 

        else

            Particles = cat( 2 , Particles , Particles_aux{1,s} )  ; 

            particles_to_delete = cat(1,particles_to_delete,s) ; 

        end

    end

    Particles_aux(:,particles_to_delete) = [] ; % Particles out of the frame

    % Add new particles

    particles_missing_aux = ( 1:size(data{k,1},1) )' ; 

    particles_missing = particles_missing_aux( ~ismember( particles_missing_aux , particles_new_frame ) ) ;

    if any(particles_missing)

        for s = 1:length(particles_missing)

            Particles_aux = cat( 2 , Particles_aux , [FrameNumber(k) data{k,1}(particles_missing(s),:)] )  ; 

        end

    end

end

Particles = cat(2,Particles,Particles_aux) ;
Particles(:,1) = [] ;
