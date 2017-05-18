# multimedia-hw4
CS3570 Introduction to Multimedia Homework #4 Due: 11:59pm, 2017/05/19 
1. Bézier curve (50%) 
 Launch the sample MATLAB script (drawAndFillPolygon.m) provided by TA to select some control points, 
which coarsely approximate the object shape. After that, you will get a list of control points in ctrlPointList. 
 Compute Bézier curve discussed in slide #13~#15. 
 Compare difference between scaling a bitmap and scaling a vector graphic. 
 
(a) Compute the Bézier curve from the sampled control points 
(every group contains 4 points, 3rdorder curve) to form the object shape using interpolation strategy. 
Show and store the results (4 images) using different sampling rate and levels of detail. 
 
(b) Using (sampling rate = High, levels of detail = High) in (a) to do scaling (2 images) 
I. Scale the bitmap result (object shape formed by Bézier curves) by 4 times (width *4, height *4) using Nearest-neighbor interpolation. 
II. Scale the sampled control points by 4 times. Compute Bézier curve again to form the new object shape by these scaled control points. 
(c) In the report: 
I. Describe how you implement the Bézier curve. 
II. Discuss the results between different sampling rates and different levels of detail. 
III. Compare results in (b) and discuss it. 
 
2. 3D Models (50%) 
 Launch the sample MATLAB script (makeRGBCube.m) to get an incomplete cube.
 Launch the sample MATLAB script (readOBJFile.m) to load the al7KC.obj file. 
 
(a) Modify the code by adding the missing triangle to plot a complete RGB color cube. Save the 3D figure as your result. 
(b) Generate an HSV color cylinder by using triangular surface approximation. 
(Cylinder center should be at (0, 0, 0). Radius of the cylinder is 1. Height of the cylinder should be 1). 
Save the 3D figure as your result. (c) Load al7KC.obj and shift this object’s center to (0, 0, 0). 
Add your HSV cylinder in (2b) into world space and shift the cylinder center to (0, 2.5, -2.5). Save the 3D figure as your result. 
(d) Use (2c) result to add lighting. Adding different light sources (position light and directional light) 
(e) Adjusting different ambient strength ka, diffuse strength kd, specular strength ks. 
I. (ka , kd , ks) = (1.0, 0.0, 0.0) 
II. (ka , kd , ks) = (0.1, 1.0, 0.0) 
III. (ka , kd , ks) = (0.1, 0.1, 1.0) 
IV. (ka , kd , ks) = (0.1, 0.8, 1.0) 
(f) In the report:
I. Show the screenshot of (2a) (2b) and discuss how to build these models. 
II. Show the screenshot of (2c) and discuss how to implement the transformation. 
III. Show the screenshot of (2d) and discuss the difference of different kind of light. 
IV. Show the screenshot of (2e) and discuss the difference from the results. 
 
Note:  You may refer to Matlab function light, lighting, material for (2d) and (2e)  Reference site. 
 
Reminder 
 You cannot use Matlab build-in function “cylinder”. 
 Your code should work correctly and generated results (display or output files) must be consistent to your results in report. 
 In report, should contain at least all the results. 
mentioned in the problem, how you implement the methods, the discussion to the output results, and reference. 
 Pack “[YourID]_report.pdf”, the output result images, and codes in “HW4_[YourID].zip”. 
Your package should also contain a README file about how to execute your program. 
 Any absolute path is not allowed. 
