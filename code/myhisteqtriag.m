function [eqimage,trianglehist]=myhisteqtriag(image)

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
    
    
    % calculate histogram of the image 
    histarray = myhist(image);
    [c,histsize] = size(histarray);
    
    
    % Probability 
    pk = zeros(1,histsize);
    for i=1:histsize
        pk(1,i) = histarray(1,i)/totalpixel;
    end

    % Cumulatie Probability
    Pk = zeros(1,histsize);
    Pk(1,1) = pk(1,1);
    for i=2:histsize
        Pk(1,i) = pk(1,i) + Pk(1,i-1);
    end
    
    
    
    
    % ---- create triangular histogram -----
        pd2 = makedist('Triangular','a',0,'b',128,'c',256);
        x = 1:1:256;

        trianglehist = pdf(pd2,x);
       %bar(trianglehist);
     % -------- create cumulative sum
        [c,histsize] = size(trianglehist);
       
        
        % Probability 
         tk = zeros(1,histsize);
        for i=1:histsize
            tk(1,i) = trianglehist(1,i)/totalpixel;
        end
       
        % Cumulatie Probability
        Tk = zeros(1,histsize);
        Tk(1,1) = tk(1,1);
        for i=2:histsize
            Tk(1,i) = tk(1,i) + Tk(1,i-1);
        end
        
        % normalize the cumulative probability
        Tkmax = Tk(1,256);
        for i=1:histsize
            Tk(1,i) = Tk(1,i)/Tkmax;
        end
        
        %store mapped values
        map = zeros(1,histsize);
        for i=1:histsize
            for j=1:histsize
               if Tk(1,j)>=Pk(1,i) 
                   break;
               end
            end
            %display(strcat(num2str(Pk(1,i)),'=Pk, Tk=',num2str(Tk(1,j)))); 
            map(1,i)=j-1;
        end
        
        %create the equalized image from mapping
       eqimage = zeros(M,N);
       for i=1:M
            for j=1:N
               eqimage(i,j) =  map(image(i,j)+1);
            end
       end
        eqimage = uint8(eqimage);
    
end
