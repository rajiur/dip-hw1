function [labelimageRGB]=mylabel2rgb(labelimage,labelcount)
    
    colors = distinguishable_colors(labelcount) ;% labelcountx3 color list
    labelimageRGB = double(cat(3, labelimage, labelimage, labelimage));
    [M,N] = size(labelimage);
    
    %display(labelimage(1,19));
    %display(labelimage(1:1,1:90));
    
    for i=1:M
        for j=1:N
            if labelimage(i,j) ~=  0
                %display(strcat(num2str(labelimage(i,j)), '(', num2str(i), ',' , num2str(j), ')'  ));
                labelimageRGB(i,j,1) = colors(labelimage(i,j),1);
                labelimageRGB(i,j,2) = colors(labelimage(i,j),2);
                labelimageRGB(i,j,3) = colors(labelimage(i,j),3);
             
            end  
        end
    end

end
 