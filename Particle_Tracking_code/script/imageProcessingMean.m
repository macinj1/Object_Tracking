function centers = imageProcessingMean(fig,MFrame)

%% Image processing

bw = abs( double( rgb2gray( fig ) ) -  MFrame  ) > 20 ; 

s = regionprops(bw,'Centroid','Area') ; 

centers = cat(1,s.Centroid) ; 
