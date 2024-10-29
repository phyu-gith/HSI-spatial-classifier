%%%%% Script for training data of Sapwood and Heartwood to input unit
%%%%% This script could be used to train to Strategy I,
%%%%% This script could be used to train Phase II of Strategy II,
%%%%% This script could be used to train Phase II, and Phase III of S_III
%%%%%%part1%%%%
num_of_sapwood_images =132;
num_of_heartwood_images=132;

[ImagesOf_320Bands,labelsOfImages_320Bands]=loading_cuboids_320bands_trainingData(num_of_sapwood_images,num_of_heartwood_images);

idx=randperm( size(ImagesOf_320Bands,4));
rand_images_320bands=ImagesOf_320Bands(:,:,:,idx);
numerical_labelsOf_320BImages=labelsOfImages_320Bands(idx);
labelsOfcategories_{1}='sapwood';
labelsOfcategories_{2}='heartwood';
rand_labelsOf_320BandsImages=categorical(numerical_labelsOf_320BImages,0:1,labelsOfcategories_);
numImageCategories = size(categories(rand_labelsOf_320BandsImages), 1);

categories(rand_labelsOf_320BandsImages)

%%%% Part 1.1
%%%%%Loading Network with first Convolution layer need to train,or …
%%%%%Loading network with first Conv and two FC 

% load('to_train_strategy_3_44lr.mat');%%%% name could be change
%%%%%Training Option
opts = trainingOptions('sgdm', ...
    'Momentum', 0.9, ...
    'InitialLearnRate', 0.0001, ...%%%0.0001,0.001
    'MaxEpochs',1000 , ...
    'MiniBatchSize', 50, ...
    'Verbose', true);

%%%%%%%%Train the network with one convolutional layer network

Trained_net= trainNetwork(rand_images_320bands,rand_labelsOf_320BandsImages,layers_1, opts);
save('Trained_strategyI_output4and5','Trained_net');

%%%%%%%Test the sapwood, heartwood testing data with Trained first
%%%%%%%%Convolution layer Net;

[YTrain,score] = classify(Trained_net, rand_images_320bands);

accuracy = sum(YTrain(:) == rand_labelsOf_320BandsImages(:))/numel(rand_labelsOf_320BandsImages(:));
disp(sprintf('The accuracy on %d images is %.2f', size(rand_images_320bands, 4), accuracy))
