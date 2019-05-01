global page;
page = 0;

%url = 'http://www.robots.ox.ac.uk/~vgg/data/flowers/17/17flowers.tgz';
tempdir = 'F:\Desktop_30012016\Project_Sem8\outputFolder';
outputFolder = fullfile(tempdir);
%if ~exist(outputFolder, 'dir') 
%    disp('D1ownloading 17-Category Flower Dataset (58 MB)...');
%    untar(url, outputFolder);
%end 

flowerImageSet = imageSet(fullfile(outputFolder));

numImages = numel(flowerImageSet);
emptyEntry = struct('image',[],'thumbnail',[]);
imageCollection = repmat(emptyEntry,[1 numImages]);
thumbnailSize = 300;
for i = 1:numel(imageCollection)
    imageCollection(i).image = read(flowerImageSet,i);
    % Convert color images to gray scale
    if size(imageCollection(i).image,3)==3
        imageCollection(i).image = rgb2gray(imageCollection(i).image);
    end
    % Store scaled versions of images for display

    imageCollection(i).thumbnail = imresize(imageCollection(i).image,...
         [thumbnailSize,thumbnailSize]);
end
for l = 1:numel(imageCollection)
    % detect SURF feature points
    imageCollection(l).points = detectSURFFeatures(imageCollection(l).image,...
        'MetricThreshold',100,'NumOctaves',3,'NumScaleLevels',6);
    % extract SURF descriptors
    [imageCollection(l).featureVectors,imageCollection(l).validPoints] = ...
        extractFeatures(imageCollection(l).image,imageCollection(l).points);
    
    % Save the number of features in each image for indexing
    imageCollection(l).featureCount = size(imageCollection(l).featureVectors,1);
end
featureDataset = double(vertcat(imageCollection.featureVectors));

% instantiate a kd tree
imageFeatureKDTree = KDTreeSearcher(featureDataset);
im11=rgb2gray(im111);
query.wholeImage = im11;
query.points = detectSURFFeatures(query.wholeImage,'MetricThreshold',10);
% Extract SURF descriptors
 [query.featureVectors,query.points] = ...
     extractFeatures(query.wholeImage,query.points);
[matches, distance] = knnsearch(imageFeatureKDTree,query.featureVectors,'K',2,'IncludeTies',false);
[sortedResult, rank] = sort(matches);
%disp(matches);
%disp(rank);
u = unique(sortedResult);
global displayImages;
if page==0 && openAgain==1
    page = page + 1;
    r = 1;
        displayImages(r) = image(...
                'Interruptible','on',...
                'Parent', imagesAxeses(r)...
        );
        im111 = read(flowerImageSet, unique(u(r)));
        img11 = double(im111)/256;
        set(displayImages(r), 'CData', img11);
        disp(unique(u(r)));
    
end
    %dis(tance = zeros(2500, 1);

run = run + 1; 
set(buttonRun,'Visible','on');
