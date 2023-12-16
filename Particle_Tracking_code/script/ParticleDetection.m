function [CropArea,data,FrameNumber] = ParticleDetection(file,FirstFrame,LastFrame,FrameRate,showVideo) 

vi = VideoReader( file ) ;

%%

[~,CropArea] = imcrop( read(vi,1) ) ; 

%%

FrameNumber = [ ] ; 

data = cell(1,LastFrame) ; 

for k = FirstFrame:FrameRate:LastFrame

    fig = imcrop( read(vi,k) , CropArea ) ;

    centers = imageProcessing(fig) ; 

    data{k,1} = centers ; 

    FrameNumber = cat(1,FrameNumber,k) ;

    if strcmp(showVideo,'yes')

        imshow(fig)
    
        hold on 
    
        if any(centers)
    
            plot(centers(:,1),centers(:,2),'ro')
    
        end
    
        pause(0.05)

    end

end

data = data(~cellfun('isempty',data)) ;