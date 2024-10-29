

function [trainImage_320Bands,train_labels_320Bands] = loading_cuboids_320bands_trainingData(num_of_sapwood_train_images, num_of_heartwood_train_images)

trainImage_320Bands=zeros(32,32,320,num_of_sapwood_train_images+num_of_heartwood_train_images);

for fileidx=1:num_of_sapwood_train_images
   trainImage_320Bands(:,:,:,fileidx)=sapWood(fileidx);
   train_labels_320Bands(fileidx)=0;
end

for fileidx=1:num_of_heartwood_train_images
   trainImage_320Bands(:,:,:,fileidx+num_of_sapwood_train_images)=heartWood(fileidx);
   train_labels_320Bands(fileidx+num_of_sapwood_train_images)=1;
end
return

function train_sapWoodImage=sapWood(fileidx)
file_name=sprintf('..\\SWHWData\\training\\sapwood\\sapwood_to_train\\sapwood_%d.mat',fileidx);
load(file_name,'sub_cuboid');
[r,c,~]=size(sub_cuboid);
train_sapWoodImage=sub_cuboid;
return

function train_heartWoodImage=heartWood(fileidx)
file_name=sprintf('..\\SWHWData\\training\\heartwood\\heartwood_to_train\\heartwood_%d.mat',fileidx);
load(file_name,'sub_cuboid');
[r,c,~]=size(sub_cuboid);
train_heartWoodImage=sub_cuboid;
return

