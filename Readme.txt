Task #1: Work with matrices
Enter the following code at the MATLAB prompt:
A=ones(16,16);
A=A*255;
B=zeros(16,16);
C=[A B;B A];
colormap(gray);image(C)
Using the help command of MATLAB if necessary, write comments next to this code, so
as to explain in detail what it does. Also, if necessary, experiment a little, to understand the
reasons for each line. For example, omit line 2 to see what happens. Then, to obtain the same
results without line 2 you will need to use imagesc(C) instead of image(C). Also try omitting
the colormap function.
By the same process as in line 4 of the above code, use matrix C as a building block to build
a matrix D of dimensions 128 × 128. Note that matrix D should still have a chessboard-like
pattern.
The function image() plots the matrix in the bracket as if it were an image. To convert the
matrix to one of the standard image file formats you must use the imwrite function as shown
in help imwrite using a .tif extension.

Task #2: Reading and writing images
MATLAB can read most image formats. The commands below will read the image into a
matrix A.
A = imread(’peppers.png’);
If you would like to see how big your image is, we can use the size command (without a
semi-colon):
[m,n,k] = size(A)
For a color image, we expect k=3. To show your image, we the imshow() or imagesc() command.
If you press the Data Cursor button at the top of your figure, you can examine pixel
values by clicking on the image. Notice each pixel is a 3-dimensional vector with values in
the range [0,255]. These 3 numbers tell us the amount of Red-Green-Blue (RGB).
So a color image is really 3 grayscale images. Just for fun, we can display the individual
RGB components of the image.
subplot(131); imagesc(A(:,:,1)); title(’R’);
subplot(132); imagesc(A(:,:,2)); title(’G’);
subplot(133); imagesc(A(:,:,3)); title(’B’);
OR
figure, imshow ((A(:,:,1)); title(’R’);
figure, imshow ((A(:,:,2)); title(’G’);
figure, imshow ((A(:,:,3)); title(’B’);
Now just to mess with our image A, let’s make a new image B that is a lot more blue by
tripling the B component. The standard image format is uint8 (8-bit integer), which is not
well-suited to arithmetic and may give you errors if you try mathematical operations. So a
common trick when we do image processing is to cast our image matrix to double format
before we do our math. Then we cast back to uint8 format at the end, before displaying the
image.
B = double(A);
Bth(:,:,3) = 3*B(:,:,3);
Bu = uint8(Bth);
figure, imshow(Bu);
figure, imshow(Bth , []); //see the difference of adding []
To save your new blue image, use the imwrite command. Get help about imwrite command by writing help imwrite or doc imwrite in Matlab command prompt.

Task #3: Write your first function
We can do a lot through the MATLAB command line, but sometimes we want to write a full program. MATLAB program are called m-files and with the extension .m.
From the MATLAB menu at top, select File->New->Function. A blank text file should appear. Type the following code into the file.
function [out] = mystery (in)
[m,n,k] = size(in);
out = in(2:m,:,2) - in(1:m-1,:,2);
imagesc(out);
Now from the menu at top, select Save and save as “mystery.m‘". Now go back to the
MATLAB workspace and run your function on your image A by typing:
B = mystery (A);
What does this function do?
Skim MATLAB Tutorial
Ed Overman has written a very nice introduction to the MATLAB Image Processing toolbox
at: https://people.math.osu.edu/overman.2/matlab.pdf

Task #4: Working with matrices
Write a MATLAB function that produces a 2 x 2 matrix defined as,
function [out] = fun(x,y)
where out: 2x2 output matrix
x,y: two input numbers

Task #5: Control flow
Functions can use decision constructs, like if ... end, if ... else ... end, or if ... elseif ... else ...
end, as well as the switch ... select structure.
Write a function that classifies a flow according to the values of its Reynolds (Re) and
Mach (Ma) numbers, such that if Re < 2000, the flow is laminar; if 2000 < Re < 5000, the flow
is transitional; if Re > 5000, the flow is turbulent; if Ma < 1, the flow is sub-sonic, if Ma = 1,
the flow is sonic; and, if Ma > 1, the flow is super-sonic.
function [flow] = classify_flow(Re,Ma)
where flow: output flow value
Re: input Reynolds value
Ma: input Mach value

Task #6: Repetition
MATLAB provides with the while ... end and the for ... end structures for creating
programming loops. Programming loops can be used to calculate summations or products.
Write a function to calculate the summation,
Using nested for ... end loops calculate double summations.

Task #7: Sort a vector
Write a function that orders a vector in increasing order.
function [v] = sort_vector(u)
where v: output vector
u: input vector

Task #8: Swap a vector
Write a function to swap the order of the elements of a vector. Thus, in a vector v of n
elements, v1 is swapped with vn, v2 is swapped with vn-1, and so on. (HINT! use built-in
mod function to check even, or odd vector lengths).
function [v] = swap_vector(u)
where v: output vector
u: input vector

Task #9: Compute cosine
Write a MATLAB program using a while loop to calculate cos(x) accurate to 6 digits after the
decimal point using the following infinite series:
Prompt the user to enter an angle A in degrees and display cos(A). Test the program for
-30o, 0o, 30o, 120 o, 210 o, and 300 o. (HINT! use built-in factorial function, and radians =
degrees x pi/180)
