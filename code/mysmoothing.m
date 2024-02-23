function smoothimage = mysmoothing(image,openwindowsize,closewindowsize,type)
    %get dimension of the image
    [M,N] = size(image);
    
    
 
if strcmp(type,'open-clos')==1 
        smoothimage=myopen(myclose(image,closewindowsize),openwindowsize);
        %smoothimage=myopen(myopen(myclose(myclose(image,openwindowsize),openwindowsize),openwindowsize),openwindowsize);
    elseif strcmp(type,'clos-open')==1 
        smoothimage=myclose(myopen(image,openwindowsize),closewindowsize);
    else 
        display('invalid type!');
        smoothimage = image;
end
    

    %smoothimage=mydilate(image,openwindowsize);
    
    
    

end