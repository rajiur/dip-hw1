function main
    fontSize = 10;
   
    imagefiles = ['cells-1.png  ';'cells-2_n.tif';'cells-3_n.tif'];
    %Use char to convert back to a padded character array.

    for i=1:3
        img=imread(imagefiles(i,:));
        subplot(3, 4, (i-1)*4+1);
        imshow(img);
        title(strcat('Grayscale: ',num2str(i)), 'FontSize', fontSize);
        
        %mybinarize(image, peakStepLength, peakStepHeight, histSmoothSize)
        [binimage,threshold,histarray, smoothhist] = mybinarize(img, 2,1,  5);
        display(strcat('Image-',num2str(i),' threshold: ',num2str(threshold)));
        smoothimage2 = mysmoothing(binimage,3,5,'clos-open');
        subplot(3, 4, (i-1)*4+2);
        imshow(smoothimage2);
        title( 'CLOS-OPEN', 'FontSize', fontSize);
        
        [labelimage,labeltable,  labelcount] = mylabel(smoothimage2);
        %display(labeltable);     display(labelcount);
        subplot(3, 4, (i-1)*4+3);
        %coloredLabelsImage = label2rgb (labelimage, 'hsv', 'k', 'shuffle'); 
        coloredLabelsImage = mylabel2rgb (labelimage,labelcount); 
        imshow(coloredLabelsImage);
        title( 'MyLabeled', 'FontSize', fontSize);
        
         
        
        [centroidimageRGB, centroidsize, centroidx, centroidy] = mycentroid(smoothimage2,labelimage, labeltable,  labelcount);
        subplot(3, 4, (i-1)*4+4);
        imshow(centroidimageRGB);
        title('With Centroid', 'FontSize', fontSize);
        display(strcat('Image-',num2str(i),'blob no: blobs size (x,y):' ));
        
        newblobcount=0;
        for x=1:labelcount
            if(centroidsize(1,x)>=15) 
                newblobcount=newblobcount+1;
                display (strcat('',num2str(newblobcount),': ',num2str(centroidsize(1,x)), ' (',num2str(centroidx(1,x)),',',num2str(centroidy(1,x)),')'));
            end
        end
        display(strcat('Image-',num2str(i),' total blob: ',num2str(newblobcount)));
        %display(centroidsize);
    end
    
  
    %{
    for image=1:3
        if image==1
            img=imread(imagefile1);
        else if image==2
            img
        else 
        end
    end
    
    
    img(1,1)=imread(imagefile1);
    img(1,2)=imread(imagefile1);
    img(1,3)=imread(imagefile1);
    %}
    
    
    
    
    
    
%{
    subplot(2, 2, 1);
    imshow(img);
    title('Original Grayscale Image', 'FontSize', fontSize);
    
    %mybinarize(image, peakWinSize, smoothSize)
    [binimage,threshold,histarray, smoothhist] = mybinarize(img, 10, 10);
    display(threshold);
    smoothimage2 = mysmoothing(binimage,5,'clos-open');
    subplot(2, 2, 2);
    imshow(smoothimage2);
    title( 'Smooth CLOS-OPEN(5)', 'FontSize', fontSize);
    
 
    [labelimage,labeltable,  labelcount] = mylabel(smoothimage2);
    %display(labeltable);     display(labelcount);
    subplot(2, 2, 3);
    coloredLabelsImage = label2rgb (labelimage, 'hsv', 'k', 'shuffle'); 
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
    [labelimage, labelimageRGB, labeltable,  labelcount] = mylabel(smoothimage2);
    [centroidimageRGB, centroidsize, centroidx, centroidy] = mycentroid(smoothimage2,labelimage, labeltable,  labelcount);
    
    %display(centroidx);display(centroidy);
    %newRGB = double(cat(3, centroidimage, smoothimage2, smoothimage2));
    
% Display the image.
subplot(2, 2, 4);
imshow(centroidimageRGB);
title('Image with Centroid', 'FontSize', fontSize);

display(centroidsize);
%}
end