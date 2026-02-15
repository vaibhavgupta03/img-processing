# Image Processing Repository

This repository contains MATLAB for demonstrating various image processing techniques, including grayscale conversion, noise addition, and image filtering operations.

## Overview

This project showcases fundamental image processing operations commonly used in computer vision and image analysis. The code demonstrates how to:
- Load and process images
- Convert images to different formats (grayscale, double precision)
- Add different types of noise to images (Gaussian, Salt & Pepper)
- Apply various filtering techniques (Mean filter, Median filter)

## Requirements

- MATLAB with Image Processing Toolbox
- VS Code or any code editor for MATLAB scripts

## Code Explanation (code.m)

The code is written in MATLAB and performs the following operations step by step:

### 1. Reading and Displaying the Image

```
matlab
img = imread('real_img.jpeg');
imshow(img);
```

This section reads the original color image [real_img.jpeg](real_img.jpeg) from the disk and displays it. The image is stored as a matrix in the variable `img`.

### 2. Converting to Grayscale

```
matlab
gray_img = rgb2gray(img);
imshow(gray_img);
imwrite(gray_img,'gray_img.png')
```

The `rgb2gray()` function converts the RGB color image to a grayscale image. This is done by eliminating the hue and saturation information while retaining the luminance. The grayscale image is then saved as `gray_img.png`.

**Output:** [gray_img.png](gray_img.png)

### 3. Converting to Double Precision

```
matlab
double_img = im2double(gray_img);
imshow(double_img)
imwrite(double_img,'double_img.png')
```

The `im2double()` function converts the image from its default data type (usually uint8) to double precision (floating-point values between 0 and 1). This is necessary for many image processing operations to ensure accurate mathematical computations.

**Output:** [double_img.png](double_img.png)

### 4. Adding Gaussian Noise

```
matlab
sigma = 20;
sigma_normalised = sigma/255;
variance = sigma_normalised^2;
gauss_img = imnoise(double_img,"gaussian",0,variance);
imshow(gauss_img)
imwrite(gauss_img,"gauss_img.png")
```

Gaussian noise is added to the image with:
- Standard deviation (sigma) = 20
- Mean = 0
- Variance = (20/255)² ≈ 0.006

This creates a noisy image where pixel values are randomly distributed around their original values following a normal (Gaussian) distribution.

**Output:** [gauss_img.png](gauss_img.png)

### 5. Adding Salt & Pepper Noise

```
matlab
sns_img = imnoise(gauss_img,"salt & pepper",0.05);
imshow(sns_img)
imwrite(sns_img,'salt&pepper_img.png')
```

Salt & pepper noise is added to the already noisy Gaussian image. This type of noise appears as randomly occurring white and black pixels:
- Noise density = 0.05 (5% of pixels are affected)
- Both "salt" (white) and "pepper" (black) pixels are added

**Output:** [salt&pepper_img.png](salt&pepper_img.png)

### 6. Mean Filter (Average Filter)

The mean filter is a smoothing filter that replaces each pixel with the average of its neighboring pixels. It uses convolution to blur the image and reduce noise.

#### 3x3 Mean Filter

```
matlab
kernel3 = ones(3,3)/9;
mean_3 = imfilter(sns_img, kernel3);
imshow(mean_3);
imwrite(mean_3,"mean_3.png")
```

A 3x3 kernel (all values = 1/9) is created and applied to the noisy image. This is the smallest mean filter that considers 8 neighbors plus the center pixel.

**Output:** [mean_3.png](mean_3.png)

#### 5x5 Mean Filter

```
matlab
kernel5 = ones(5,5)/25;
mean_5 = imfilter(sns_img, kernel5);
imshow(mean_5);
imwrite(mean_5,"mean_5.png")
```

A 5x5 kernel (all values = 1/25) provides more smoothing than the 3x3 filter but may blur details more.

**Output:** [mean_5.png](mean_5.png)

#### 7x7 Mean Filter

```
matlab
kernel7 = ones(7,7)/49;
mean_7 = imfilter(sns_img, kernel7);
imshow(mean_7);
imwrite(mean_7,"mean_7.png")
```

A 7x7 kernel provides the most smoothing among the mean filters demonstrated, but also results in the most blurring of image details.

**Output:** [mean_7.png](mean_7.png)

### 7. Median Filter

The median filter is a non-linear filter that replaces each pixel with the median value of its neighboring pixels. It is particularly effective at removing salt & pepper noise while preserving edges.

#### 3x3 Median Filter

```
matlab
median_3 = medfilt2(sns_img,[3,3]);
imshow(median_3);
imwrite(median_3,"median_3.png")
```

A 3x3 median filter processes each pixel by considering a 3x3 neighborhood and replacing the center pixel with the median value.

**Output:** [median_3.png](median_3.png)

#### 5x5 Median Filter

```
matlab
median_5 = medfilt2(sns_img,[5,5]);
imshow(median_5);
imwrite(median_5,"median_5.png")
```

A 5x5 median filter provides more noise reduction but may start to blur fine details.

**Output:** [median_5.png](median_5.png)

#### 7x7 Median Filter

```
matlab
median_7 = medfilt2(sns_img,[7,7]);
imshow(median_7);
imwrite(median_7,"median_7.png")
```

A 7x7 median filter provides the strongest noise reduction among the median filters, but may cause more blur.

**Output:** [median_7.png](median_7.png)


## Key Observations

1. **Mean Filter**: Works well for Gaussian noise but tends to blur edges and fine details. Larger kernel sizes provide more smoothing but more blur.

2. **Median Filter**: Particularly effective for salt & pepper noise as it preserves edges better than mean filtering. It removes isolated noise pixels while maintaining sharp edges.

3. **Noise Comparison**: The combination of Gaussian and salt & pepper noise represents a challenging scenario, demonstrating the effectiveness of different filtering approaches.

## Running the Code

To run this code:
1. Ensure you have MATLAB with the Image Processing Toolbox
2. Place all files in the same directory
3. Open MATLAB and navigate to the directory
4. Run the command: `code`

The generated images will be saved in the same directory.
