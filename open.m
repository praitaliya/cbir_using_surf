global chosenImageName;
global im111;
global filename;
global pathname;
openAgain = 0;
run = 0;
if openAgain>0
    clear all;
    close all;
    clear matches;
end
if run>0
    clear all;
    close all;
    clear matches;
end

pathname='C:\Users\Prashu\Desktop\finger';

[filename, pathname]=uigetfile( ...
         {'*.jpg'; '*.bmp'; '*.gif'; '*.tif'; '*.png'; '*.*'},...
         'Choose an image.',pathname);

if isequal([filename pathname],[0,0])
    return;
end

chosenImageName = [pathname, filename];
im111 = imread(chosenImageName);
%imfinfo(im111);
%img111(:,:,4) = [];
%img11 = repamt(img111, [1 1 3]);

img11 = double(im111)/256;
%im12=rgb2gray(im111);

%points = detectSURFFeatures(im12,'MetricThreshold',10);
%subplot(1,2,1);
%imshow(im12);
%subplot(1,2,2);
%imshow(im12);hold on;
%title('Surf Features');
%plot(points.selectStrongest(20));
set(chosenImg, 'CData', img11);
set(buttonRun,'Visible','on');
% set(buttonNext,'Visible','off');
% set(buttonPrev,'Visible','off');
set(chosenImg,'Visible','on');

openAgain = openAgain + 1;