%%%%% Script for Testing data of Sapwood and Heartwood 320 bands Images
%%%%% Using the final Network

num_of_sapwood_test_images =66;
num_of_heartwood_test_images=66;

[testImage_320Bands,test_labels_320Bands]=load_test_images_320bands(num_of_sapwood_test_images,num_of_heartwood_test_images);

labelsOfcategories_{1}='sapwood';
labelsOfcategories_{2}='heartwood';
test_labels_320bands=categorical(test_labels_320Bands,0:1,labelsOfcategories_);
numImageCategories = size(categories(test_labels_320bands), 1);

categories(test_labels_320bands)
%%Trained_1000epoch_132SH_3lr_1FC_Net
% load('Trained_1000epoch_132SH_4lr_2FC_Net');

[YTest,score] = classify(Trained_net,testImage_320Bands);

accuracy = sum(YTest(:) == test_labels_320bands(:))/numel(test_labels_320bands(:));
disp(sprintf('The accuracy on %d images is %.2f', size(testImage_320Bands, 4), accuracy))
