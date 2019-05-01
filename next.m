function next(imageIDs)

outputFolder = fullfile(tempdir, '17Flowers');
flowerImageSet = imageSet(fullfile(outputFolder,'jpg'));
global displayImages;


if openAgain==1
    for r = 1:20
        displayImages(r) = image(...
                'Interruptible','on',...
                'Parent', imagesAxeses(r)...
        );
        im111 = read(flowerImageSet,imageIDs(r));
        img11 = double(im111)/256;
        set(displayImages(r), 'CData', img11);
    end
end