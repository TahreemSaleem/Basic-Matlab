
%EE433: Digital Image Processing
%Class: BESE-4
%Lab 1: Review MATLAB/Python
%Date: 26th September, 2016

%Tahreem Saleem- 05983



%Task# 01
%    Code comments:
%        A=ones(16,16);        %16x16 matrix with all elements as 1
%        A=A*255;    %multiplying matrix A with 255 to give it white color
%        B=zeros(16,16);  %16x16 matrix with all elements as 0
%        C=[A B;B A]; %setting the position of two matrix  and making and array
%        colormap(gray); % setting the color map of image to gray 
%        image(C) %display image from C matrix

%    Using imagsc:
%        A=ones(16,16);
%        B=zeros(16,16);
%        C=[A B;B A];
%        colormap(gray);
 %       imagesc(C) % makes the minimum value to the first color in the colormap and the maximum value to the last color.

%    Making 128x128 D matrix:  
%        A=ones(16,16);
%        B=zeros(16,16);
%        C=[A B;B A];
%        D=[C C C C;C C C C];
%        colormap(gray);
%        imagesc(D)  
%    Saving image:
%        A=ones(16,16);
%        A=A*255;
%        B=zeros(16,16);
%        C=[A B;B A];
%        colormap(gray);imwrite(C,'myimage.tif')

%
%
%Task# 02
%    Image Read:
%        imread('myimage.tif');

%    Image size:
%        [m,n,k] = size(A)
%    Image show: 
%        imshow(A)
%    Increasing Blue component: 
%        B = double(A);
%        Bth(:,:,3) = 3*B(:,:,3);
%        Bu = uint8(Bth);
%        figure, imshow(Bu);
%        figure, imshow(Bth , []);
%        imwrite(Bu,’f1.png’);
%        imwrite(Bth,’f2.png’);%

%Task #03%

function [out] = mystery (in)   %taking input (in) and returning out
    [m,n,k] = size(in); %taking size of the input image
    out = in([2:m,m],:,2) - in(1:m,:,2); %taking 2nd row uptill last mth row and including another mth row,
    %taking all the columns and selecting only green value from input and
    %subtrating input images 1st row uptill mth row and all the columns and
    %green value of the image. In short its eliminating the green value from
    %the image 
    imagesc(out); %makes the minimum value to the first color in the colormap and the maximum value to the last color.
end



%Task#04%
function [out] = task4(x,y) 
out = [x+y (x+y)^2; x*y sqrt(x+y)];
end

%Task#05%
function [sum] = task5a(n)
if Re < 2000
    flow = 'laminar';
elseif 2000 < Re < 5000
    flow  = 'transitional';
elseif Re > 5000
    flow = 'turbulent';
elseif Ma < 1
    flow = 'sub-sonic';
elseif Ma = 1
    flow = 'sonic'; 
elseif Ma > 1
    flow = 'super-sonic';
else 
    flow = 'not-determined';
end
end

%Task#06%
function [k] = task6a(n)
k = 0;
while (k < n)
    k = k + (1/((k^2)+1));
end
end


function [s] = task6b(n,m)
i = 0;
j = 0;
s = 0;
for i = i:n
    for j = j:m
        s = s + (1/((i+j)^2+1));
    end
end
end

%Task#07%
function [u] = task7(u)
n = numel(u);
c = 1;
d = 1;
for  c = 1:n-1
    for d =  1:n-c
        if (u(d) > u(d+1))
            swap = u(d);
            u(d) = u(d+1);
            u(d+1) = swap;
            
            
        end
    end
end

disp(u);
end

%Task#08%
function [v] = task8(v)
n = numel(v);
i = 1;
for i=1:n/2
    swap = v(i);
    v(i) = v(n+1-i);
    v(n+1-i) = swap;
end
disp(v)
end

%Task#09%
function [sum] = task9()
input = input('enter the value');

u = (input * pi)/180;
n = 12;
sum = 0;
k=0;
while k < n
    sum = sum + ((-1)^k*u^(2*k)/factorial(2*k));
    k++;
end
end