function hw1_2a  (imagefile)
   %imagefile = 'einstein.jpg';
   img =  imread(imagefile);
   
   fontSize = 10;
   
   %check if image is grayscale
   if(size(img, 3) ~= 1) 
       grayimg=rgb2gray(img);
   else
       grayimg=img;
   end
   
   subplot(2, 2,   1);
    imshow(grayimg);
    title( 'Original Image', 'FontSize', fontSize);
   
    
    
    % ---- create histogram -----
    histarray = myhist(grayimg);
    
    subplot(2, 2,   2);
    bar(histarray);
    title( 'Histogram', 'FontSize', fontSize);

    
    % ---- create equilized image -----
    eqimg= myhisteq(grayimg);
    subplot(2, 2,   3);
    imshow(eqimg);
    title( 'Eq Image', 'FontSize', fontSize);
   
    % ---- create histogram -----
    eqhistarray = myhist(eqimg);

    subplot(2, 2,   4);
    bar(eqhistarray);
    title( 'Eq Histogram', 'FontSize', fontSize);

end