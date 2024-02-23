function [centroidimageRGB, centroidsize, centroidx, centroidy]=mycentroid(binimage, labelimage, labeltable,labelcount)
    %get dimension of the image
    [M,N] = size(labelimage);
    %display(labelimage);
   %display(labelcount);
    
    %centroidimage=zeros(M,N);
    labelxmin(1:labelcount)=M;
    labelxmax=zeros(1,labelcount);
    labelymin(1:labelcount)=N;
    labelymax=zeros(1,labelcount);
    centroidx = zeros(1,labelcount);
    centroidy = zeros(1,labelcount);
    centroidsize = zeros(1,labelcount);
    
    
    for currentlabel=1:labelcount
        for i=1:M
            for j=1:N
                if currentlabel==labelimage(i,j);
                    if labelxmin(1,currentlabel)>i
                         labelxmin(1,currentlabel) = i; end
                    if labelxmax(1,currentlabel)<i
                         labelxmax(1,currentlabel)=i; end
                    if labelymin(1,currentlabel)>j
                         labelymin(1,currentlabel) = j; end
                    if labelymax(1,currentlabel)<j
                         labelymax(1,currentlabel)=j; end  
                    %display([labelxmin, labelxmax, labelymin, labelymax]);
                    centroidsize(1,currentlabel) = centroidsize(1,currentlabel)+1;
                end
            end
        end
    end
    
    for currentlabel=1:labelcount
        centroidx(1,currentlabel)=round((labelxmin(1,currentlabel)+labelxmax(1,currentlabel))/2);
        centroidy(1,currentlabel)=round((labelymin(1,currentlabel)+labelymax(1,currentlabel))/2);
    end
    %display(centroidx); display(centroidy);
    
    
    centroidimageRGB = double(cat(3, binimage, binimage, binimage));
    
    
    
     for x=1:labelcount
       colorx = centroidx(1,x);
       colory = centroidy(1,x);
       centroidimageRGB(colorx,colory,1)=1; 
       centroidimageRGB(colorx,colory,2)=0;
       centroidimageRGB(colorx,colory,3)=0;
       
       if colorx > 1 %top
            centroidimageRGB(colorx-1,colory,1)=1; 
            centroidimageRGB(colorx-1,colory,2)=0; 
            centroidimageRGB(colorx-1,colory,3)=0; 
       end
        if colory > 1 %left
            centroidimageRGB(colorx,colory-1,1)=1; 
            centroidimageRGB(colorx,colory-1,2)=0;
            centroidimageRGB(colorx,colory-1,3)=0;
        end
        if colory < N %right
            centroidimageRGB(colorx,colory+1,1)=1;
            centroidimageRGB(colorx,colory+1,2)=0;
            centroidimageRGB(colorx,colory+1,3)=0; 
        end
        if colorx < M %bottom
            centroidimageRGB(colorx+1,colory,1)=1; 
            centroidimageRGB(colorx+1,colory,2)=0; 
            centroidimageRGB(colorx+1,colory,3)=0; 
        end

       
    end
    
end