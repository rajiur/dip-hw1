
HOW TO RUN PROGRAMS
---------------------------------------------------------------------

Problem 1a:	hw1_1a(imagefilename)
example:	hw1_1a('cells-1.png');
		hw1_1a('cells-2_n.tif');

Problem 1b:	hw1_1b(imagefilename, openWindowSize, closeWindowSize)
example:	hw1_1b('cells-1.png',3,3);
		hw1_1b('cells-2_n.tif',5,3);

Problem 1c:	hw1_1c(imagefilename)
example:	hw1_1c('cells-1.png');
		hw1_1c('cells-2_n.tif');

Problem 1d:	main
		main
----------------------------------------------------------------------

Problem 2a:	hw1_2a(imagefilename)
example:	hw1_2a('cells-1.png');
		hw1_2a('cells-2_n.tif');

Problem 2b:	hw1_2b(imagefilename, shapetype [i.e. flat|gaussian|triangular'] )
example:	hw1_2b('cells-1.png','equalized');
		hw1_2b('cells-2_n.tif','gaussian');

Problem 2c:	hw1_2c(imagefilename, shapetype [i.e. flat|gaussian|triangular'], 
				openWindowSize, closeWindowSize)
example:	hw1_2c('cells-1.png','equalized',3,3);
		hw1_2c('cells-2_n.tif','triangular',5,3);




MY FUNCTIONS
----------------------------------------------------------------------
•	mybinarize (image, peakStepLength, peakStepHeight, histSmoothSize) – Calculates histogram, histogram smoothing, threshold and binary image from image. 

•	myhist (image) – Calculates histogram of a grayscale image.

•	myhistsmoothing (histogram, histSmoothSize) – Performs smoothing of a histogram by input smoothing window size.

•	mythresh (histogram, peakStepLength, peakStepHeight) – Calculates threshold. peakStepLength and peakStepHeight are utilized to get peaks in assumed Gaussian distributions.

•	mysmoothing (image, openWindowSize, closeWindowSize, type) – Performs morphological operations on the image on the type ‘open-clos’ or ‘clos-open’. The openWindowSize & closeWindowSize are input for open/close window sizes 3x3 or 5x5.

•	myerode (binaryimage, erodeWindowSize) – Erosion

•	mydilate (binaryimage, dilateWindowSize) – Dilation

•	myclose (binaryimage, closeWindowSize) – Close operation

•	myopen (binaryimage, openWindowSize) – Open operation

•	mylabel (image) – Labels the blobs.

•	mycentroid (binaryimage, labelimage, labeltable) – Creates centroid in the binary image from labelimage and labeltable.

•	mylabel2rgb (labelimage, labelcount) – Creates colored blobs from labeled image.

•	myhisteq (image) – Performs histogram equalization of image.

•	myhisteqtriag (image) – Performs histogram shaping based on a triangle shaped distribution.

•	myhisteqgaussian (image, mu, sigma) – Performs histogram shaping based on a Gaussian distribution.







		