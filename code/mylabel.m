function [labelimage,  labeltable, labelcount] = mylabel(image)

    
%{
l = 1  // Initial Label number
for each pixel
  if pixel X is foreground
    if neighbours A,B,C & D are unlabelled (equal to zero)
      label pixel X with l
      increment l
    else
       num = neighbour label A,B,C & D with least value, not including 0
       label pixel X and pixels A, B, C & D if foreground with num
    end if
  end if
done
%}

    %get dimension of the image
    [M,N] = size(image);
    
    label=0; % Initial Label number
    labelimage = zeros(M,N); % background=0
    
    % The maximum number of blobs is given by an image filled with equally spaced single pixel
	% blobs. For images with less blobs, memory will be wasted, but this approach is simpler and
	% probably quicker than dynamically resizing arrays
    %labletable = zeros(1, M*N/4);
    labeltable = zeros(1,1);
    
  
    
    % ------------ FIRST ITERATION ---------------
    for i=1:M
        for j=1:N
       
           %val=image(i,j);
           topLeftLabel=0;      topLabel=0;     topRightLabel=0;
           leftLabel=0;                         rightLabel=0;
           bottomLeftLabel=0;   bottomLabel=0;  bottomRightLabel=0;
           
           if image(i,j)==1
                % Find label for neighbours (0 if out of range)               
                if i > 1 && j > 1 % top left
                    topLeftLabel=labelimage(i-1,j-1); end
                if i > 1 % top
                    topLabel=labelimage(i-1,j); end
                if i >1 && j < N % top right
                    topRightLabel=labelimage(i-1,j+1); end
                if j > 1 % left
                    leftLabel = labelimage(i,j-1); end
                
                if j <N % right
                    rightLabel = labelimage(i,j+1); end
                if i < M && j > 1 % bottom left
                    bottomLeftLabel = labelimage(i+1,j-1); end
                if i< M % bottom
                    bottomLabel = labelimage(i+1,j); end
                if i < M && j < N %bottom right
                    bottomRightLabel = labelimage(i+1,j+1); end
                
                
                % Look for label with least value
                min = intmax;
                if topLeftLabel ~= 0 && topLeftLabel < min 
                    min = topLeftLabel ; end
                if topLabel ~= 0 && topLabel < min 
                    min = topLabel; end
                if topRightLabel ~= 0 && topRightLabel < min 
                    min = topRightLabel; end
                if leftLabel ~= 0 && leftLabel < min 
                    min = leftLabel;end
                
                if rightLabel ~= 0 && rightLabel < min
                    min = rightLabel; end
                if bottomLeftLabel ~= 0 && bottomLeftLabel <min
                    min = bottomLeftLabel; end
                if bottomLabel ~= 0 && bottomLabel < min
                    min = bottomLabel; end
                if bottomRightLabel ~= 0  && bottomRightLabel < min
                    min = bottomRightLabel; end
                
                
                
                % If no neighbours in foreground
                if min==intmax 
                    label=label+1 ; %increament label for new label
                    labelimage(i,j)=label;% this is a new blob, label it with new label
                    labeltable(1,label) = label;
                % neighbour found
                else
                  % Label pixel with lowest label from neighbours  
                    labelimage(i,j)=min;
                    if topLeftLabel ~= 0 
                        labeltable(1,topLeftLabel) = min; end
					if topLabel ~= 0 
                        labeltable(1,topLabel) = min; end
					if topRightLabel ~= 0 
                        labeltable(1,topRightLabel) = min; end
					if leftLabel ~= 0 
                        labeltable(1,leftLabel) = min; end
                    
                    if rightLabel ~= 0 
                        labeltable(1,rightLabel) = min; end
                    if bottomLeftLabel ~= 0 
                        labeltable(1,bottomLeftLabel) = min; end
                    if bottomLabel ~= 0 
                        labeltable(1,bottomLabel) = min; end
                    if bottomRightLabel ~= 0 
                        labeltable(1,bottomRightLabel) = min; end
                    
                end    
            end    
                
                
               
        end
    end
    
    
      
    % ----- SECOND ITERATION - BOTTOM UP --------------- 
    
    topLeftLabel=0;      topLabel=0;     topRightLabel=0;
    leftLabel=0;                        rightLabel=0;
    bottomLeftLabel=0;   bottomLabel=0;  bottomRightLabel=0;
    
    
    i=M;
    j=N;
    while i>=1
        while j>=1
            
            if image(i,j)==1
                % Find label for neighbours (0 if out of range)               
                if i > 1 && j > 1 % top left
                    topLeftLabel=labelimage(i-1,j-1); end
                if i > 1 % top
                    topLabel=labelimage(i-1,j); end
                if i >1 && j < N % top right
                    topRightLabel=labelimage(i-1,j+1); end
                if j > 1 % left
                    leftLabel = labelimage(i,j-1); end
                
                if j <N % right
                    rightLabel = labelimage(i,j+1); end
                if i < M && j > 1 % bottom left
                    bottomLeftLabel = labelimage(i+1,j-1); end
                if i< M % bottom
                    bottomLabel = labelimage(i+1,j); end
                if i < M && j < N %bottom right
                    bottomRightLabel = labelimage(i+1,j+1); end
                
                
                % Look for label with least value
                min = intmax;
                if topLeftLabel ~= 0 && topLeftLabel < min 
                    min = topLeftLabel ; end
                if topLabel ~= 0 && topLabel < min 
                    min = topLabel; end
                if topRightLabel ~= 0 && topRightLabel < min 
                    min = topRightLabel; end
                if leftLabel ~= 0 && leftLabel < min 
                    min = leftLabel;end
                
                if rightLabel ~= 0 && rightLabel < min
                    min = rightLabel; end
                if bottomLeftLabel ~= 0 && bottomLeftLabel <min
                    min = bottomLeftLabel; end
                if bottomLabel ~= 0 && bottomLabel < min
                    min = bottomLabel; end
                if bottomRightLabel ~= 0  && bottomRightLabel < min
                    min = bottomRightLabel; end
                
                
                
                % neighbour found
                if min ~= intmax && min ~= 0
                  % Label pixel with lowest label from neighbours  
                    labelimage(i,j)=min;
                    if topLeftLabel ~= 0 
                        labeltable(1,topLeftLabel) = min; end
					if topLabel ~= 0 
                        labeltable(1,topLabel) = min; end
					if topRightLabel ~= 0 
                        labeltable(1,topRightLabel) = min; end
					if leftLabel ~= 0 
                        labeltable(1,leftLabel) = min; end
                    
                    if rightLabel ~= 0 
                        labeltable(1,rightLabel) = min; end
                    if bottomLeftLabel ~= 0 
                        labeltable(1,bottomLeftLabel) = min; end
                    if bottomLabel ~= 0 
                        labeltable(1,bottomLabel) = min; end
                    if bottomRightLabel ~= 0 
                        labeltable(1,bottomRightLabel) = min; end
                    
                end    
            end  
            
            j = j-1;
        end
        i=i-1;
    end  
    
     
    
    
    % -------------- FINE UNIQUE LABELS ----------------
    uniquelabel = unique(labeltable);

    [A,B] = size(labeltable);
    [c,labelcount] = size(uniquelabel);
    
    labeltablenew = zeros(1,B);
    
   % display(labeltable);
   % display(labelimage);
    for a=1:B
        labeltablenew(1,a) = find(uniquelabel==labeltable(1,a));
    end
    
    % remove duplicate blob number
    labeltable = unique(labeltablenew);
   
    
    labelimagenew=zeros(M,N);
     for i=1:M
        for j=1:N
            if(labelimage(i,j)~=0)
                labelimagenew(i,j)=labeltablenew(1,labelimage(i,j));
            end
        end
     end
     
     % display(labelimagenew);
      
      
     labelimage= labelimagenew;
    
    
     %labelimageRGB = double(cat(3, labelimage, labelimage, labelimage));
    
end