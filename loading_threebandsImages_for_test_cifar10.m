

% function [threeBandsImages,labelsOfImages] =loading_cuboids_SW_HW_function(f,s,t,num_of_sapwood_images, num_of_heartwood_images)
function [threeBandsImages] =loading_threebandsImages_for_test_cifar10(f,s,t,num_of_sapwood_images, num_of_heartwood_images)

threeBandsImages=zeros(32,32,3,num_of_sapwood_images+num_of_heartwood_images);

for fileidx=1:num_of_sapwood_images
    threeBandsImages(:,:,:,fileidx)=sapWood(f,s,t,fileidx);
%     labelsOfImages(fileidx)=0;
end

for fileidx=1:num_of_heartwood_images
    threeBandsImages(:,:,:,fileidx+num_of_sapwood_images)=heartWood(f,s,t,fileidx);
%     labelsOfImages(fileidx+num_of_sapwood_images)=1;
end
return

function sapWoodImage=sapWood(firstB,secondB,thirdB,fileidx)
file_name=sprintf('..\\SWHWData\\training\\sapwood\\sapwood_to_train\\sapwood_%d.mat',fileidx);
load(file_name,'sub_cuboid');
[r,c,~]=size(sub_cuboid);
sapWoodImage=zeros(r,c,3);
sapWoodImage(:,:,1) = sub_cuboid(:,:,firstB);
sapWoodImage(:,:,2) = sub_cuboid(:,:,secondB);
sapWoodImage(:,:,3) = sub_cuboid(:,:,thirdB);

return

function heartWoodImage=heartWood(firstB,secondB,thirdB,fileidx)
file_name=sprintf('..\\SWHWData\\training\\heartwood\\heartwood_to_train\\heartwood_%d.mat',fileidx);
load(file_name,'sub_cuboid');
[r,c,~]=size(sub_cuboid);
heartWoodImage=zeros(r,c,3);
heartWoodImage(:,:,1) = sub_cuboid(:,:,firstB);
heartWoodImage(:,:,2) = sub_cuboid(:,:,secondB);
heartWoodImage(:,:,3)= sub_cuboid(:,:,thirdB);

return

