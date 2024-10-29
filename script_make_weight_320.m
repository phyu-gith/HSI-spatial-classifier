%%%% scripts for making weights of first convolution layer for … 
 %%%% image 32*32*320…
%%% w be the weight of first convolution layer of the net with…
%%% image 32*32*3

for ii=1:32
win=w(:,:,:,ii);
wout=repmat(win,1,1,107);
wout=wout(:,:,1:320);
wout_total(:,:,:,ii)=wout;
end

%%% then placed wout_total into the new weight of first Conv…
%%% eg: layers_1(2).Weights=wout_total;
