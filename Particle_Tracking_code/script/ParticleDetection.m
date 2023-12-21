function [CropArea,data,FrameNumber,spaceScale] = ParticleDetection(file,FirstFrame,LastFrame,FrameRate,showVideo) 

%% Load Video 

vi = VideoReader( file ) ;

%% Select area of interest 

[~,CropArea] = imcrop( read(vi,1) ) ; 

if size(CropArea,2) ~= 4
    
   error('Error! CropArea does not exist.')

end

%% Enter dimension space

errorType = 1 ; 

while errorType == 1 

    prompt = "From the area you cropped, enter one dimension in meters or equivalent unit of the rectangle: width or height of rectangle: ";

    pxlsScale = input(prompt) ; 

    prompt = "Which dimension was it: width = type 1 || height = type 0: ";

    scaleDirection = input(prompt) ; 

    prompt = "Do you want to modify the scale you just typed: yes = type 1 || no = type 0 : ";

    errorType = input(prompt) ; 

    clc

end

clear errorType

if scaleDirection == 1

    spaceScale = pxlsScale / CropArea(3) ; 

else

    spaceScale = pxlsScale / CropArea(4) ; 

end

clear scaleDirection pxlsScale


%% Mean value for substraction

clear MFrame

for k = 1:floor( vi.NumFrames/25 )

    MFrame(:,:,k) = rgb2gray( imcrop( read(vi,k) , CropArea )  ) ;

end

MFrame = mean( MFrame , 3 ) ;

%% Detect particles in each frame

FrameNumber = [ ] ; 

data = cell(1,LastFrame) ; 

for k = FirstFrame:FrameRate:LastFrame

    fig = imcrop( read(vi,k) , CropArea ) ;

    % centers = imageProcessing(fig) ; 

    centers = imageProcessingMean(fig,MFrame) ; 

    data{k,1} = centers ; 

    FrameNumber = cat(1,FrameNumber,k) ;

    if strcmp(showVideo,'yes')

        imshow(fig)

        title( sprintf('Frame number %3.f',k) )
    
        hold on 
    
        if any(centers)
    
            plotHandles = plot(centers(:,1),centers(:,2),'ro') ; 
    
        end
    
        pause(0.05)

        delete(plotHandles)

    end

end

data = data(~cellfun('isempty',data)) ;
