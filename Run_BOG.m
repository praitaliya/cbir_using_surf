global page;
page = 0;

outputFolder = fullfile(tempdir, '17Flowers');
if ~exist(outputFolder, 'dir') 
    disp('Downloading 17-Category Flower Dataset (58 MB)...');
    untar(url, outputFolder);
end

flowerImageSet = imageSet(fullfile(outputFolder,'jpg'));

if exist('savedColorBagOfFeatures.mat','file')
    load('savedColorBagOfFeatures.mat','colorBag');
    load('savedColorBagOfFeatures.mat', 'flowerImageIndex');
else
trainingSet = partition(flowerImageSet, 0.4, 'randomized');
%   % Create a custom bag of features using the 'CustomExtractor' option
colorBag = bagOfFeatures(trainingSet, ...
           'CustomExtractor', @exampleBagOfFeaturesColorExtractor,'VocabularySize', 10000);
flowerImageIndex = indexImages(flowerImageSet, colorBag, 'SaveFeatureLocations', false);
save savedColorBagOfFeature.mat
end

flowerImageIndex.WordFrequencyRange = [0.1 0.9];
[imageIDs, scores] = retrieveImages(im111, flowerImageIndex);
%save imageIDs.mat
%helperDisplayImageMontage(flowerImageSet.ImageLocation(imageIDs))
global displayImages;

    for r = 1:20
        displayImages(r) = image(...
                'Interruptible','on',...
                'Parent', imagesAxeses(r)...
        );
        im111 = read(flowerImageSet,imageIDs(r));
        img11 = double(im111)/256;
        set(displayImages(r), 'CData', img11);
        openAgain= openAgain + 1;
    end
% elseif page<4
%         page = page + 1;
%         for l = 1:20
%             im222 = read(flowerImageSet, imageIDs(r));
%             img22 = double(im222)/256;
%             set(displayImages(l),'CData',img22);
%         end
% end
set(buttonRun,'Visible','on');
% set(buttonNext,'Visible','on');
% set(buttonPrev,'Visible','off');
% if page>1
%     set(buttonPrev,'Visible','on');
% end
% if page==4
%     set(buttonNext,'Visible','off');
% end
