function hw1_1a (imagefile)
    %imagefile = 'cells-1.png';
    %imagefile = 'cells-3_n.tif';
    
   img=imread(imagefile);
    
    
    fontSize = 10;

    %mybinarize(image, peakStepLength, peakStepHeight, histSmoothSize)
    [binimage,threshold,histarray, smoothhist] = mybinarize(img, 2,1,  5);
    %threshold = 201;
    display(strcat( 'My Threshold: ',num2str(threshold)));
    
    % show original image
    subplot(2, 3, 1);
    imshow(img);
    title('Original Image', 'FontSize', fontSize);
    
    % show binary image
    subplot(2, 3, 2);
    imshow(binimage);
    title( strcat( 'Binary Image: Th=',num2str(threshold)), 'FontSize', fontSize);
    
    
    subplot(2, 3, 3);
    level = graythresh(img);
    matlabbinimage = im2bw(img,level);
    imshow(matlabbinimage);
    title( strcat( 'Matlab Binary: Th=',num2str(round(level*256))), 'FontSize', fontSize);
     display(strcat( 'Matlab Threshold: ',num2str(round(level*256))));

    subplot(2,3,4);
    bar(histarray);
    title( 'My Histogram', 'FontSize', fontSize);
   %display(histarray);
    subplot(2,3,5);
    bar(smoothhist);
    title( 'My Smooth Histogram', 'FontSize', fontSize);
    
    subplot(2,3,6)
    hist = histogram(img,256);
    bar(hist.Values) ;
    title( 'Matlab Histogram', 'FontSize', fontSize);
end