img = imread('real_img.jpeg');

img_gray = rgb2gray(img);
img_double = im2double(img_gray);
F = fft2(img_double);
F_shifted = fftshift(F);

F_magnitude = abs(F_shifted);
F_phase = angle(F_shifted);
% Display the original image and its magnitude spectrum
% figure;
% subplot(1, 2, 1);
% imshow(img_double);title('Original Image');
% subplot(1, 2, 2);
% imshow(mat2gray(log(1 + F_magnitude)));
% title('Magnitude Spectrum');

% Design a low-pass filter
[M, N] = size(img_double);
[u, v] = meshgrid(-floor(N/2):floor((N-1)/2), -floor(M/2):floor((M-1)/2));
D = sqrt(u.^2 + v.^2);
D0 = 20;
D1 = 50;
D2 = 80;
H0 = double(D <= D0); % Ideal low-pass filter
H1 = double(D <= D1); % Ideal low-pass filter
H2 = double(D <= D2); % Ideal low-pass filter

% Apply the filter to the shifted Fourier transform
G_shifted0 = F_shifted .* H0;
G_shifted1 = F_shifted .* H1;
G_shifted2 = F_shifted .* H2;

% Shift back and compute the inverse Fourier transform
L0 = ifftshift(G_shifted0);
img_filtered0 = real(ifft2(L0));

L1 = ifftshift(G_shifted1);
img_filtered1 = real(ifft2(L1));

L2 = ifftshift(G_shifted2);
img_filtered2 = real(ifft2(L2));

% figure;
% subplot(1, 3, 1);
% imshow(img_filtered0, []);title('Filtered Image (Low-Pass D0=20)');
% subplot(1, 3, 2);
% imshow(img_filtered1, []);title('Filtered Image (Low-Pass D0=50)');
% subplot(1, 3, 3);
% imshow(img_filtered2, []);title('Filtered Image (Low-Pass D0=80)');


G0 = exp(-(D.^2) / (2 * D0^2));
G1 = exp(-(D.^2) / (2 * D1^2));
G2 = exp(-(D.^2) / (2 * D2^2));
G_shifted_gaussian0 = F_shifted .* G0;
G_shifted_gaussian1 = F_shifted .* G1;
G_shifted_gaussian2 = F_shifted .* G2;

L_gaussian0 = ifftshift(G_shifted_gaussian0);
img_filtered_gaussian0 = real(ifft2(L_gaussian0));

L_gaussian1 = ifftshift(G_shifted_gaussian1);
img_filtered_gaussian1 = real(ifft2(L_gaussian1));

L_gaussian2 = ifftshift(G_shifted_gaussian2);
img_filtered_gaussian2 = real(ifft2(L_gaussian2));

% figure;
% subplot(1, 3, 1);
% imshow(img_filtered_gaussian0, []);title('Filtered Image (Gaussian Low-Pass D0=20)');
% subplot(1, 3, 2);
% imshow(img_filtered_gaussian1, []);title('Filtered Image (Gaussian Low-Pass D0=50)');
% subplot(1, 3, 3);
% imshow(img_filtered_gaussian2, []);title('Filtered Image (Gaussian Low-Pass D0=80)');

% Butterworth low-pass filter for n=2 and n=4

n1 = 2;
n2 = 4;

BLPF01 = 1 ./ (1 + (D ./ D0).^(2*n1));
BLPF02 = 1 ./ (1 + (D ./ D0).^(2*n2));

BLPF11 = 1 ./ (1 + (D ./ D1).^(2*n1));
BLPF12 = 1 ./ (1 + (D ./ D1).^(2*n2));

BLPF21 = 1 ./ (1 + (D ./ D2).^(2*n1));
BLPF22 = 1 ./ (1 + (D ./ D2).^(2*n2));

G_shifted_butterworth01 = F_shifted .* BLPF01;
G_shifted_butterworth02 = F_shifted .* BLPF02;
G_shifted_butterworth11 = F_shifted .* BLPF11;
G_shifted_butterworth12 = F_shifted .* BLPF12;
G_shifted_butterworth21 = F_shifted .* BLPF21;
G_shifted_butterworth22 = F_shifted .* BLPF22;

L_butterworth01 = ifftshift(G_shifted_butterworth01);
img_filtered_butterworth01 = real(ifft2(L_butterworth01));
L_butterworth02 = ifftshift(G_shifted_butterworth02);
img_filtered_butterworth02 = real(ifft2(L_butterworth02));
L_butterworth11 = ifftshift(G_shifted_butterworth11);
img_filtered_butterworth11 = real(ifft2(L_butterworth11));
L_butterworth12 = ifftshift(G_shifted_butterworth12);
img_filtered_butterworth12 = real(ifft2(L_butterworth12));
L_butterworth21 = ifftshift(G_shifted_butterworth21);
img_filtered_butterworth21 = real(ifft2(L_butterworth21));
L_butterworth22 = ifftshift(G_shifted_butterworth22);
img_filtered_butterworth22 = real(ifft2(L_butterworth22));

% figure;
% subplot(2, 3, 1);
% imshow(img_filtered_butterworth01, []);title('Filtered Image (Butterworth Low-Pass D0=20, n=2)');
% subplot(2, 3, 2);
% imshow(img_filtered_butterworth02, []);title('Filtered Image (Butterworth Low-Pass D0=20, n=4)');
% subplot(2, 3, 3);
% imshow(img_filtered_butterworth11, []);title('Filtered Image (Butterworth Low-Pass D0=50, n=2)');
% subplot(2, 3, 4);
% imshow(img_filtered_butterworth12, []);title('Filtered Image (Butterworth Low-Pass D0=50, n=4)');
% subplot(2, 3, 5);
% imshow(img_filtered_butterworth21, []);title('Filtered Image (Butterworth Low-Pass D0=80, n=2)');
% subplot(2, 3, 6);
% imshow(img_filtered_butterworth22, []);title('Filtered Image (Butterworth Low-Pass D0=80, n=4)');

% Ideal High Pass Filter
H_high0 = double(D > D0);
G_shifted_high0 = F_shifted .* H_high0;

L_high0 = ifftshift(G_shifted_high0);
img_filtered_high0 = real(ifft2(L_high0));

H_high1 = double(D > D1);
G_shifted_high1 = F_shifted .* H_high1;

L_high1 = ifftshift(G_shifted_high1);
img_filtered_high1 = real(ifft2(L_high1));

H_high2 = double(D > D2);
G_shifted_high2 = F_shifted .* H_high2;

L_high2 = ifftshift(G_shifted_high2);
img_filtered_high2 = real(ifft2(L_high2));

% figure;
% subplot(1, 3, 1);
% imshow(img_filtered_high0, []);title('Filtered Image (High-Pass D0=20)');
% subplot(1, 3, 2);
% imshow(img_filtered_high1, []);title('Filtered Image (High-Pass D0=50)');
% subplot(1, 3, 3);
% imshow(img_filtered_high2, []);title('Filtered Image (High-Pass D0=80)');

% Gaussian High Pass Filter
G_high0 = 1 - exp(-(D.^2) / (2 * D0^2));
G_shifted_gaussian_high0 = F_shifted .* G_high0;
L_gaussian_high0 = ifftshift(G_shifted_gaussian_high0);
img_filtered_gaussian_high0 = real(ifft2(L_gaussian_high0));

G_high1 = 1 - exp(-(D.^2) / (2 * D1^2));
G_shifted_gaussian_high1 = F_shifted .* G_high1;
L_gaussian_high1 = ifftshift(G_shifted_gaussian_high1);
img_filtered_gaussian_high1 = real(ifft2(L_gaussian_high1));

G_high2 = 1 - exp(-(D.^2) / (2 * D2^2));
G_shifted_gaussian_high2 = F_shifted .* G_high2;
L_gaussian_high2 = ifftshift(G_shifted_gaussian_high2);
img_filtered_gaussian_high2 = real(ifft2(L_gaussian_high2));

% figure;
% subplot(1, 3, 1);
% imshow(img_filtered_gaussian_high0, []);title('Filtered Image (Gaussian High-Pass D0=20)');
% subplot(1, 3, 2);
% imshow(img_filtered_gaussian_high1, []);title('Filtered Image (Gaussian High-Pass D0=50)');
% subplot(1, 3, 3);
% imshow(img_filtered_gaussian_high2, []);title('Filtered Image (Gaussian High-Pass D0=80)');

% Butterworth High Pass Filter
BLPF_high01 = 1 ./ (1 + (D ./ D0).^(2*n1));
BLPF_high02 = 1 ./ (1 + (D ./ D0).^(2*n2));
BLPF_high11 = 1 ./ (1 + (D ./ D1).^(2*n1));
BLPF_high12 = 1 ./ (1 + (D ./ D1).^(2*n2));
BLPF_high21 = 1 ./ (1 + (D ./ D2).^(2*n1));
BLPF_high22 = 1 ./ (1 + (D ./ D2).^(2*n2));

G_shifted_butterworth_high01 = F_shifted .* (1 - BLPF_high01);
G_shifted_butterworth_high02 = F_shifted .* (1 - BLPF_high02);
G_shifted_butterworth_high11 = F_shifted .* (1 - BLPF_high11);
G_shifted_butterworth_high12 = F_shifted .* (1 - BLPF_high12);
G_shifted_butterworth_high21 = F_shifted .* (1 - BLPF_high21);
G_shifted_butterworth_high22 = F_shifted .* (1 - BLPF_high22);

H_butterworth01 = ifftshift(G_shifted_butterworth_high01);
img_filtered_butterworth_high01 = real(ifft2(H_butterworth01));
H_butterworth02 = ifftshift(G_shifted_butterworth_high02);
img_filtered_butterworth_high02 = real(ifft2(H_butterworth02));
H_butterworth11 = ifftshift(G_shifted_butterworth_high11);
img_filtered_butterworth_high11 = real(ifft2(H_butterworth11));
H_butterworth12 = ifftshift(G_shifted_butterworth_high12);
img_filtered_butterworth_high12 = real(ifft2(H_butterworth12));
H_butterworth21 = ifftshift(G_shifted_butterworth_high21);
img_filtered_butterworth_high21 = real(ifft2(H_butterworth21));
H_butterworth22 = ifftshift(G_shifted_butterworth_high22);
img_filtered_butterworth_high22 = real(ifft2(H_butterworth22));

% figure;
% subplot(2, 3, 1);
% imshow(img_filtered_butterworth_high01, []);title('Filtered Image (Butterworth High-Pass D0=20, n=2)');
% subplot(2, 3, 2);
% imshow(img_filtered_butterworth_high02, []);title('Filtered Image (Butterworth High-Pass D0=20, n=4)');
% subplot(2, 3, 3);
% imshow(img_filtered_butterworth_high11, []);title('Filtered Image (Butterworth High-Pass D0=50, n=2)');
% subplot(2, 3, 4);
% imshow(img_filtered_butterworth_high12, []);title('Filtered Image (Butterworth High-Pass D0=50, n=4)');
% subplot(2, 3, 5);
% imshow(img_filtered_butterworth_high21, []);title('Filtered Image (Butterworth High-Pass D0=80, n=2)');
% subplot(2, 3, 6);
% imshow(img_filtered_butterworth_high22, []);title('Filtered Image (Butterworth High-Pass D0=80, n=4)');