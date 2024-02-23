function hw1_2b  (imagefile, shapingtype)
   %imagefile = 'einstein.jpg';
   img =  imread(imagefile);
   
   fontSize = 10;
   
   %check if image is grayscale
   if(size(img, 3) ~= 1) 
       grayimg=rgb2gray(img);
   else
       grayimg=img;
   end
   
   subplot(2, 3,    1);
    imshow(grayimg);
    title( 'Original Image', 'FontSize', fontSize);
   
    
    
    % ---- create histogram -----
    histarray = myhist(grayimg);
    
    
    subplot(2,3,  2);
    bar(histarray);
    title( 'Histogram', 'FontSize', fontSize);
   
    %display(shapingtype);
    if strcmp(shapingtype,'equalized')==1
    
         % ---- create equilized image -----
        eqimg= myhisteq(grayimg);
        subplot(2,3,  4);
        imshow(eqimg);
        title( 'Eq (Flat) Image', 'FontSize', fontSize);

         % ---- create histogram -----
        eqhistarray = myhist(eqimg);


         subplot(2,3,  5);
        bar(eqhistarray);
        title( 'Eq (Flat) Histogram', 'FontSize', fontSize);
    
    elseif  strcmp(shapingtype,'triangular')==1
        [triagimg,hist]= myhisteqtriag(grayimg);
        
        subplot(2,3, 4);
        bar(hist);
        title( 'Trianguar Distribution', 'FontSize', fontSize);
        
        subplot(2,3, 5);
        imshow(triagimg);
        title( 'Eq (Triangular)  Image', 'FontSize', fontSize);

        % ---- create histogram -----
        triaghistarray = myhist(triagimg);

         subplot(2,3,  6);
        bar(triaghistarray);
        title( 'Eq (Triangular) Histogram', 'FontSize', fontSize);
        
    elseif strcmp(shapingtype,'gaussian')==1
                
        [gimg,hist]= myhisteqgaussian(grayimg,130,10000);
        
        subplot(2,3, 4);
        bar(hist);
        title( 'Gaussian Distribution', 'FontSize', fontSize);
        
        
        subplot(2,3,  5);
        imshow(gimg);
        title( 'Eq (Gaussian)  Image', 'FontSize', fontSize);


        % ---- create histogram -----
        ghistarray = myhist(gimg);
         subplot(2,3, 6);
        bar(ghistarray);
        title( 'Eq (Gaussian) Histogram', 'FontSize', fontSize);
        
    else
        display('Usage: >> hw1_2b(imagefilename, shapingtype:{equalized|gaussian|traingular}');
    end
    
    
    
    
    
end