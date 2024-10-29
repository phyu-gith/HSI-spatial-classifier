

function [threeBandsImages,labelsOfImages] =loading_testingCuboid_threeBands_SW_HW(f,s,t,num_of_sapwood_images, num_of_heartwood_images)

threeBandsImages=zeros(32,32,3,num_of_sapwood_images+num_of_heartwood_images);

for fileidx=1:num_of_sapwood_images
    threeBandsImages(:,:,:,fileidx)=sapWood(f,s,t,fileidx);
    labelsOfImages(fileidx)=0;
end

for fileidx=1:num_of_heartwood_images
    threeBandsImages(:,:,:,fileidx+num_of_sapwood_images)=heartWood(f,s,t,fileidx);
    labelsOfImages(fileidx+num_of_sapwood_images)=1;
end
return

function sapWoodImage=sapWood(firstB,secondB,thirdB,fileidx)
file_name=sprintf('..\\SWHWData\\testing\\sapwood\\sapwood_to_test\\sapwood_%d.mat',fileidx);
load(file_name,'sub_cuboid');
[r,c,~]=size(sub_cuboid);
sapWoodImage=zeros(r,c,3);
sapWoodImage(:,:,1) = sub_cuboid(:,:,firstB);
sapWoodImage(:,:,2) = sub_cuboid(:,:,secondB);
sapWoodImage(:,:,3) = sub_cuboid(:,:,thirdB);

return

function heartWoodImage=heartWood(firstB,secondB,thirdB,fileidx)
file_name=sprintf('..\\SWHWData\\testing\\heartwood\\heartwood_to_test\\heartwood_%d.mat',fileidx);
load(file_name,'sub_cuboid');
[r,c,~]=size(sub_cuboid);
heartWoodImage=zeros(r,c,3);
heartWoodImage(:,:,1) = sub_cuboid(:,:,firstB);
heartWoodImage(:,:,2) = sub_cuboid(:,:,secondB);
heartWoodImage(:,:,3)= sub_cuboid(:,:,thirdB);

return

