function hw1_1b  (imagefile, openWindowSize, closeWindowSize)
    %imagefile = 'cells-1.png';
    %imagefile = 'cells-3_n.tif';
    
   img=imread(imagefile);
   
    fontSize = 10;

    %mybinarize(image, peakStepLength, peakStepHeight, histSmoothSize)
    [binimage,threshold,histarray, smoothhist] = mybinarize(img, 2,1,  5);
    display(strcat( 'Threshold: ',num2str(threshold)));
    subplot(1, 3, 1);
    imshow(binimage);
    title( strcat( 'Binary Image: Th=',num2str(threshold)), 'FontSize', fontSize);
     
    smoothimage1 = mysmoothing(binimage,openWindowSize, closeWindowSize,'open-clos');
    subplot(1, 3, 2);
    imshow(smoothimage1);
    title( 'Smooth OPEN-CLOS(3)', 'FontSize', fontSize);
    
    smoothimage2 = mysmoothing(binimage,openWindowSize, closeWindowSize,'clos-open');
    subplot(1, 3, 3);
    imshow(smoothimage2);
    title( 'Smooth CLOS-OPEN(3)', 'FontSize', fontSize);
    
   
    
end