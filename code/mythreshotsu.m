function threshold = mythreshotsu(image)
    [M,N] = size(image);
    %display(M);display(N);
    histarray = zeros(1,256);
    for i=1:M
        for j=1:N
            histarray(image(i,j)) = histarray(image(i,j))+1;
        end
    end

    winSize = 5;
    winMidSize = floor (winSize / 2);

    %smoothing
    smoothhist = zeros(1,256);
    for i=winMidSize:(256 - winMidSize-1)

        mean = 0;
        for j=(i - winMidSize + 1):(i + winMidSize)

             mean = mean + histarray(1,j);
        end

        smoothhist(1,i) = mean / winSize;
    end
    
    result=zeros(size([1 256]));

    for i=0:255
         [wbk,varbk]=calweightmean(smoothhist,1,i);
         [wfg,varfg]=calweightmean(smoothhist,i+1,255);
        result(i+1)=(wbk*varbk)+(wfg*varfg);
    end

    %Find the minimum value in the array.                   
    [val, threshold]=min(result);
    
end