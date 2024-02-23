function eqimage=myhisteq(image)

    %check if not grayscale
    if(size(image, 3) ~= 1)
       %convert to grayscale 
       image=rgb2gray(image);
    end
    
    %get dimension of the image
    [M,N] = size(image);
    
    % Caluculate the size of image
    totalpixel = M*N;
    maxintensity = 255;
    
    % ---- create histogram -----
    
   histarray = myhist(image);


[c,histsize] = size(histarray);
pk = zeros(1,histsize);

for i=1:histsize
    pk(1,i) = histarray(1,i)/totalpixel;
end

Pk = zeros(1,histsize);
Pk(1,1) = pk(1,1);
for i=2:histsize
    Pk(1,i) = pk(1,i) + Pk(1,i-1);
end



eqimage = zeros(M,N);
   for i=1:M
        for j=1:N
           eqimage(i,j) = round(Pk(1,image(i,j)+1)*maxintensity);
        end
   end
    eqimage = uint8(eqimage);
end


