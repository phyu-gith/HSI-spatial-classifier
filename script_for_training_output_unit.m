%%%%% Script for training data of Sapwood and Heartwood
%%%%% SWHWNet_2FC is updated TWO fully connected Layers Network;
%%%%% In ICME2021 paper, train_output_unit(on only two fully connected
%%%%% layers

num_of_sapwood_images =132;
num_of_heartwood_images=132;
total_num_of_images= num_of_sapwood_images+ num_of_heartwood_images;

for idx=1:50
    simulation_{idx}.firstB  = floor(319*rand(1)+1);
    simulation_{idx}.secondB = floor(319*rand(1)+1);
    simulation_{idx}.thirdB  = floor(319*rand(1)+1);
    
    [threeBandsImagesOfallCuboids,labelsOfImagesOfallCuboids]=loading_cuboids_SW_HW_function(simulation_{idx}.firstB,simulation_{idx}.secondB,simulation_{idx}.thirdB,...
        num_of_sapwood_images,num_of_heartwood_images);
    idxesOfBlock=[1: total_num_of_images]+ total_num_of_images*(idx-1);
    order_threeBandsImages(:,:,:,idxesOfBlock)=threeBandsImagesOfallCuboids;
    order_numerical_labelsOfImages(idxesOfBlock)=labelsOfImagesOfallCuboids;
    
end

%%%% random images and labels
idx=randperm( size(order_threeBandsImages,4));
threeBandsImages=order_threeBandsImages(:,:,:,idx);
numerical_labelsOfImages=order_numerical_labelsOfImages(idx);
labelsOfcategories_{1}='sapwood';
labelsOfcategories_{2}='heartwood';
labelsOfImages=categorical(numerical_labelsOfImages,0:1,labelsOfcategories_);
numImageCategories = size(categories(labelsOfImages), 1);

categories(labelsOfImages)

%%%%%loading Network with two fullyconnected Layers

load('SWHWNet_132_2FC.mat','layers_1');

opts = trainingOptions('sgdm', ...
    'Momentum', 0.9, ...
    'InitialLearnRate', 0.0001, ...%%%0.0001,0.001, two learning rate
    'MaxEpochs', 1000, ...
    'MiniBatchSize', 50, ...
    'Verbose', true);

%%%%%% Train the network with two fullyconnected

Trained_1000epoch_132SH_4lr_2FC_Net = trainNetwork(threeBandsImages,labelsOfImages,layers_1, opts);
save(' Trained_1000epoch_132SH_4lr_2FC_Net ',' Trained_1000epoch_132SH_4lr_2FC_Net ');

[YTrain,score] = classify(Trained_1000epoch_132SH_4lr_2FC_Net,threeBandsImages );

accuracy = sum(YTrain(:) ==labelsOfImages(:))/numel(labelsOfImages(:));
disp(sprintf('The accuracy on %d images is %.2f', size(threeBandsImages, 4), accuracy))
