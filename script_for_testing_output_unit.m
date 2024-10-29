%%%%% Script for Testing data of Sapwood and Heartwood 3bands Images for
%%%%% two fully connected layer net
%%%%% 
for idx=1:50
% idx=1
    num_of_sapwood_images =132;
    num_of_heartwood_images=132;
    total_num_of_images= num_of_sapwood_images+ num_of_heartwood_images;
    simulation_{idx}.firstB  = floor(319*rand(1)+1);
    simulation_{idx}.secondB = floor(319*rand(1)+1);
    simulation_{idx}.thirdB  = floor(319*rand(1)+1);
    
    [threeBandsImagesOfallCuboids,labelsOfImagesOfallCuboids]=loading_testingCuboid_threeBands_SW_HW(simulation_{idx}.firstB,simulation_{idx}.secondB,simulation_{idx}.thirdB,...
        num_of_sapwood_images,num_of_heartwood_images);
               
    idxesOfBlock=[1: total_num_of_images]+ total_num_of_images*(idx-1);
    order_threeBandsImages(:,:,:,idxesOfBlock)=threeBandsImagesOfallCuboids;
    order_numerical_labelsOfImages(idxesOfBlock)=labelsOfImagesOfallCuboids;
  
end

threeBands_TestImages=order_threeBandsImages;

labelsOfcategories_{1}='sapwood';
labelsOfcategories_{2}='heartwood';

labelsOf_TestImages=categorical(order_numerical_labelsOfImages,0:1,labelsOfcategories_);

numImageCategories = size(categories(labelsOf_TestImages), 1);

categories(labelsOf_TestImages)


%%%% Testing Process %%%%%
%%%%%Loading Network with Trained first Convolution layer Net

load('Trained_strategy_3_444lr');
%%%%%%%%Test the sapwood, heartwood testing data with Trained first
%%%%%%%%Convolution layer Net;

[YTest,score] = classify(Trained_strategy_3_444lr,threeBands_TestImages );

accuracy = sum(YTest(:) ==labelsOf_TestImages(:))/numel(labelsOf_TestImages(:));
disp(sprintf('The accuracy on %d images is %.2f', size(threeBands_TestImages, 4), accuracy))
