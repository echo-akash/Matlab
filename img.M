clear all
close all
clc
% Read in a standard MATLAB gray scale image.
folder = fullfile(matlabroot, '/the specific folder');
baseFileName = 'image.png';
fullFileName = fullfile(folder, baseFileName);
% Get the full filename, with path prepended.
fullFileName = fullfile(folder, baseFileName);
if ~exist(fullFileName, 'file')
  % Didn't find it there.  Check the search path for it.
  fullFileName = baseFileName; % No path this time.
  if ~exist(fullFileName, 'file')
    % Still didn't find it.  Alert user.
    errorMessage = sprintf('Error: %s does not exist.', fullFileName);
    uiwait(warndlg(errorMessage));
    return;
  end
end
grayImage = imread(fullFileName);
% Get the dimensions of the image.  numberOfColorBands should be = 1.
[rows columns numberOfColorBands] = size(grayImage);
% Display the original gray scale image.
subplot(2, 2, 1);
imshow(grayImage, []);
% title('Original Grayscale Image - Spatial Domain', 'FontSize', fontSize);
title('Original Grayscale Image - Spatial Domain');
% Enlarge figure to full screen.
% set(gcf, 'Position', get(0,'Screensize')); 
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
set(gcf,'name','Edge Detection and ','numbertitle','off')
% Take the FFT.
fftImage = fft2(grayImage);
% Shift it and take log so we can see it easier.
centeredFFTImage = log(fftshift(real(fftImage)));
% Display the FFT image.
subplot(2, 2, 2);
imshow(centeredFFTImage, []);
% title('log(FFT Image) - Frequency Domain', 'FontSize', fontSize);
title('log(FFT Image) - Frequency Domain');
% Zero out the corners
window = 30;
fftImage(1:window, 1:window) = 0;
fftImage(end-window:end, 1:window) = 0;
fftImage(1:window, end-window:end) = 0;
fftImage(end-window:end, end-window:end) = 0;
% Display the filtered FFT image.
% Shift it and take log so we can see it easier.
centeredFFTImage = log(fftshift(real(fftImage)));
subplot(2, 2, 3);
imshow(centeredFFTImage, []);
% title('Filtered log(FFT Image) - Frequency Domain', 'FontSize', fontSize);
title('Filtered log(FFT Image) - Frequency Domain');
% Inverse FFT to get high pass filtered image.
output = ifft2(fftImage);
% Display the output.
subplot(2, 2, 4);
imshow(real(output), []);
% title('High Pass Filtered Image - Back in the Spatial Domain', 'FontSize', fontSize);
title('High Pass Filtered Image - Back in the Spatial Domain');
figure;
imhist(real(output))
% calculates the histogram for the intensity image I and displays a plot of the histogram. The number of bins in the histogram is determined by the image type.