PART 1

1a. Write a program to binarize a gray-level image based on the assumption that the image has a bimodal histogram. You are to implement a method that assumes that both the foreground and background regions of the image represent a Gaussian distribution and the optimal threshold to binarize the image is the average of the means of the two Gaussians. Your code should report both the binarized image and the optimal threshold value. Assume that foreground takes a value of 1 and the background a value of 0 in the binary image. Also assume that foreground objects are darker than background objects in the input gray-level image. 


1b. Write to program to perform morphological smoothing of the resultant binarized image. Include both Open-Close and Close-Open smoothing operations using a windowing function that is a 3 x 3 window and a 5 x 5 window. The input to your code would be a binary image and the output would be a smoothed version that eliminates small regions and fills holes of larger regions. 


1c. Write a program to perform blobcoloring based on a 8-connected neighborhood (3 x 3 window). The input to your code should be a binary image from the previous step and the output should be a count of total objects in the image as well as the labeled image where each object is “colored” starting with the value of 1 and the background taking a value of 0. Assume that objects in the binary image take a value of 1 while the background takes a value of 0. In addition, your code should also report the area and centroid of each object in the binary image. 

1d. Write a main program to read in the following gray-level images (cells-1.tif, cells-2.tif, and cells-3.tif) and threshold the image to generate a binary image using the function developed in part 1a. Next, use morphological operations to eliminate small regions and fill holes in larger regions. Finally, use the blobcoloring function developed in part 1c to count the number of cells in the image and report on their statistics. Ignore cells smaller than 15 pixels in area and generate a report of the remaining cells (Cell Number, Area, Location, Total Count). In addition, display the original input image, the binary image, the smoothed image, and the final cell labeled image. The final image should use a distinct color to represent each uniquely labeled cell.



PART 2 

2a. Write a function to compute the histogram of the original image and perform histogram equalization. Show the original image, its histogram, the equalized image and its histogram. 

2b. Write a function that allows for histogram shaping of input image. Specifically, the shaping operations enabled include a triangle shaped distribution and a Gaussian distribution. Bothdistributions should be centered at 128. The Gaussian distribution will utilize a user-defined standard deviation while the triangle shaped distribution should cover the domain of 0 to 255. For each input image, show the original image, its histogram, user defined shaping histogram, the shaped image and its histogram. 

2c. Rerun the main program implemented in 1d while using the histogram shaped images as input (equalized, triangle shaped, and Gaussian shaped). Compare obtained results to those in 1d and comment.

