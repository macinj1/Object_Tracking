function centers = imageProcessing(fig)

J = medfilt2( rgb2gray( fig ) ) ; 

T = adaptthresh(J, 0.55,'ForegroundPolarity','dark','Statistic','gaussian');

bw = imbinarize(J,T);

se = strel('disk',1) ;
bw = ~imdilate(~bw,se) ;

bw = ~imclearborder(~bw) ; 
D = -bwdist(bw);

L = watershed(D);
L(bw) = 0;

s = regionprops(L,'Centroid','Area') ; 

centers = cat(1,s.Centroid) ; 