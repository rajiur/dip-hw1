function hw1_2c( imagefile,shapingtype,openwindowsize,closewindowsize)   
    fontSize = 10;
    %read the imag file, if not gray image convert to grayimage
    img=imread(imagefile);
        if(size(img, 3) ~= 1) 
           grayimg=rgb2gray(img);
        else grayimg = img;
        end
    
    % shape according to shapingtype input    
    if strcmp(shapingtype,'equalized') == 1
          %display(shapingtype);
        img =  myhisteq(grayimg);
    elseif strcmp(shapingtype,'gaussian')==1
         % display(shapingtype);
        [img,hist] = myhisteqgaussian(grayimg,170,100000);
    elseif strcmp(shapingtype,'triangular')==1
       % display(shapingtype);
        [img,hist] = myhisteqtriag(grayimg);

    else
        display('Usage: >> hw1_2c(imageifile, shapingtype: equalized|gaussian|triangular,openwindowsize,closewindowsize  )');
        return;
    end

    subplot(2, 2, 1);
    imshow(img);
    title(strcat('Equalized: ',shapingtype), 'FontSize', fontSize);
   
    %mybinarize(image, peakStepLength, peakStepHeight, histSmoothSize)
    [binimage,threshold,histarray, smoothhist] = mybinarize(img, 2,1,  5);
    display(strcat('Equalized: ',shapingtype,' threshold: ',num2str(threshold)));
    smoothimage2 = mysmoothing(binimage,openwindowsize,closewindowsize,'clos-open');
    subplot(2,2, 2);
    imshow(smoothimage2);
    title( 'Binary', 'FontSize', fontSize);
    
    [labelimage,labeltable,  labelcount] = mylabel(smoothimage2);
    %display(labeltable);     display(labelcount);
    subplot(2, 2, 3);
     %coloredLabelsImage = label2rgb (labelimage, 'hsv', 'k', 'shuffle'); 
    coloredLabelsImage = mylabel2rgb (labelimage,labelcount);
    imshow(coloredLabelsImage);
    title( 'Matlab Label Colored', 'FontSize', fontSize);
    
    
    [centroidimageRGB, centroidsize, centroidx, centroidy] = mycentroid(smoothimage2,labelimage, labeltable,  labelcount);
    subplot(2, 2, 4);
    imshow(centroidimageRGB);
    title('With Centroid', 'FontSize', fontSize);
    
    newblobcount=0;
    for x=1:labelcount
        if(centroidsize(1,x)>=15) 
            newblobcount=newblobcount+1;
            display (strcat(num2str(newblobcount),': ',num2str(centroidsize(1,x)), ' (',num2str(centroidx(1,x)),',',num2str(centroidy(1,x)),')'));
        end
    end
    display(strcat('Image: ',imagefile,', total blob: ',num2str(newblobcount)));
    

end