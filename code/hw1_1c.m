function hw1_1c  (imagefile)
   img=imread(imagefile);
   
    fontSize = 10;

    %{
    subplot(2,2 , 1);
    imshow(img);
    title('Original Grayscale Image', 'FontSize', fontSize);
    
    %}
    
    %mybinarize(image, peakStepLength, peakStepHeight, histSmoothSize)
    [binimage,threshold,histarray, smoothhist] = mybinarize(img, 2,1,  5);
    display(threshold);
    smoothimage2 = mysmoothing(binimage,5,3,'clos-open');
    %smoothimage2 = myopen(myclose(myopen(myclose(binimage,5),3),5),3);
    
    %{
    subplot(2, 2, 2);
    imshow(smoothimage2);
    title( 'Smooth CLOS-OPEN(5)', 'FontSize', fontSize);
    %}
 
    [labelimage,labeltable,  labelcount] = mylabel(smoothimage2);
    %display(labeltable);     
    display(labelcount);
    subplot(1, 2, 1);
    %coloredLabelsImage = label2rgb (labelimage, 'hsv', 'k', 'shuffle'); 
    coloredLabelsImage = mylabel2rgb (labelimage,labelcount); 
    imshow(coloredLabelsImage);
    title( 'MyLabeled', 'FontSize', fontSize);

    
       
   %{
       binaryImage = im2bw(img,0.5);
    se = strel('disk',5);
    smoothimage = imclose(imclose(binaryImage,se),se);
    subplot(3, 3, 5);
    imshow(smoothimage);
    title( 'Matlab CLOS-OPEN (disk,9)', 'FontSize', fontSize);
    [labeledImage numberOfBlobs] = bwlabel(smoothimage, 8);
    %display(numberOfBlobs);
    coloredLabelsImage = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); 
    subplot(3, 3, 6);
    imshow(coloredLabelsImage);
    title( 'Matlab Labeled', 'FontSize', fontSize);
    %}
    
    %subsetimage = smoothimage2([86:125],[81:120]);
    [labelimage,  labeltable,  labelcount] = mylabel(smoothimage2);
    [centroidimageRGB, centroidsize, centroidx, centroidy] = mycentroid(smoothimage2,labelimage, labeltable,  labelcount);
    
    %display(centroidx);display(centroidy);
    %newRGB = double(cat(3, centroidimage, smoothimage2, smoothimage2));
    
% Display the image.
subplot(1, 2, 2);
imshow(centroidimageRGB);
title('Image with Centroid', 'FontSize', fontSize);

%display(centroidsize);

end