# Filtering in Image Processing (Spatial Domain & Frequency Domain)

## Project Overview
This project demonstrates various filtering techniques in image processing, both in the spatial domain and frequency domain. The code is implemented in MATLAB and covers the following operations:
- Reading and displaying images
- Converting images to grayscale and double precision
- Adding diffeerent types of noise (Gaussian, Salt & Pepper)
- Applying different filters in the spatial domain and frequency domain

## Requirements
- MATLAB with Image Processing Toolbox
- VS Code or any code editor for MATLAB scripts

## Structure
The project is organized into three main sections:
1. Spatial Domain Filtering
2. Frequency Domain Filtering
3. Results and Analysis

## Spatial Domain Filtering
In this section, we apply various filters directly to the pixel values of the image. The operations include:
- Mean Filter: A simple averaging filter that smooths the image by replacing each pixel value with
the average of its neighbors.
- Median Filter: A non-linear filter that replaces each pixel value with the median of its neighbors, which is effective in removing salt-and-pepper noise.
- Gaussian Filter: A filter that uses a Gaussian function to weight the neighboring pixels, providing a smoother result while preserving edges better than the mean filter.
- Laplacian Filter: A second-order derivative filter that highlights regions of rapid intensity change, often used for edge detection.
- Sobel Filter: A first-order derivative filter that emphasizes edges in both horizontal and vertical directions and then combines them to produce the final edge map.

## Frequency Domain Filtering
In this section, we transform the image into the frequency domain using the Fourier Transform and apply filters in that domain. The operations include:
Will look later


# Results and Analysis
After applying the various filters, we will analyze the results by comparing the original image with the filtered images. We will evaluate the effectiveness of each filter in terms of noise reduction, edge preservation, Effect of Kernel Size and Cutoff Frequency, Ringing Artifacts, Computational Considerations. We will also discuss the advantages and disadvantages of spatial domain filtering versus frequency domain filtering in different scenarios.

# Conclusion
This project provides a comprehensive overview of filtering techniques in image processing, demonstrating both spatial and frequency domain approaches. By understanding the strengths and limitations of each method, we can make informed decisions about which filtering technique to use for specific applications in computer vision and image analysis.

# References
1. Gonzalez, R. C., & Woods, R. E. (2018). Digital Image Processing (4th ed.). Pearson.
2. Pratt, W. K. (2007). Digital Image Processing: PIKS Inside (4th ed.). Wiley-Interscience.
3. MATLAB Documentation: Image Processing Toolbox. https://www.mathworks.com/products/image.html

# Acknowledgments
We would like to thank the developers of MATLAB and the Image Processing Toolbox for providing powerful tools that enable us to perform complex image processing tasks with ease. We also appreciate the contributions of the computer vision and image analysis community for their research and insights that have informed our understanding of filtering techniques in both spatial and frequency domains.


