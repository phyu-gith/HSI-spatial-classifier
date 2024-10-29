

function [testImage_320Bands,test_labels_320Bands] = load_test_images_320bands(num_of_sapwood_test_images, num_of_heartwood_test_images)

testImage_320Bands=zeros(32,32,320,num_of_sapwood_test_images+num_of_heartwood_test_images);

for fileidx=1:num_of_sapwood_test_images
   testImage_320Bands(:,:,:,fileidx)=test_sapWood(fileidx);
   test_labels_320Bands(fileidx)=0;
end

for fileidx=1:num_of_heartwood_test_images
   testImage_320Bands(:,:,:,fileidx+num_of_sapwood_test_images)=test_heartWood(fileidx);
   test_labels_320Bands(fileidx+num_of_sapwood_test_images)=1;
end
return

function test_sapWoodImage=test_sapWood(fileidx)
file_name=sprintf('..\\SWHWData\\testing\\sapwood\\sapwood_to_test\\sapwood_%d.mat',fileidx);
load(file_name,'sub_cuboid');
[r,c,~]=size(sub_cuboid);
test_sapWoodImage=sub_cuboid;
return

function test_heartWoodImage=test_heartWood(fileidx)
file_name=sprintf('..\\SWHWData\\testing\\heartwood\\heartwood_to_test\\heartwood_%d.mat',fileidx);
load(file_name,'sub_cuboid');
[r,c,~]=size(sub_cuboid);
test_heartWoodImage=sub_cuboid;
return

