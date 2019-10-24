clear all
close all
clc


run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')

addpath('~/projects/matrix/common/');
addpath('./function/')

addpath('./old/');

rng(0)


% im_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/input/';
% im_ft = 'jpg';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_ft = 'jpg';





% gt_pa = '~/dataset/dataset2014/dataset/dynamicBackground/fountain01/groundtruth/';
% gt_ft = 'png';

gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_ft = 'png';





size_block = 9;
rag_block = 0;

% imdb = getRPoSP(im_pa, im_ft, gt_pa, gt_ft, 1630, 9);
% imdb = getImdb_test(im_pa, im_ft, gt_pa, gt_ft, 1140, 81, 0);


% bgs_train(imdb,'net_test');
% bgs_train(imdb,'../network/net_test/');



net_pa = '../network/net_loop/net-epoch-1000.mat'


net = load(net_pa);
net = net.net;


[files fullfiles] = loadFiles_plus(im_pa, im_ft);

frames = max(size(files));


storage_fm = [];
storage_all = [];

figure
for i = 500:frames
    imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, i, 81);

    [fgim gtim] = getFgImg(net, imdb);


    [TP FP FN TN] = evalution_entry(fgim,gtim);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);
    [Re Pr Fm]
    storage_all = [storage_all ; Re Pr Fm];

    storage_fm = [storage_fm; i Fm];

    displayMatrixImage(1,1,2,fgim,gtim)

    str = sprintf('re%06d',i);
    str = [str '.png'];
    saveImage(fgim, '../result/', str);
end






% imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, 1630, 81);
% 
% [fgim gtim] = getFgImg(net, imdb);
% 
% 
% [TP FP FN TN] = evalution_entry(fgim,gtim);
% 
% Re = TP/(TP + FN);
% Pr = TP / (TP + FP);
% Fm = (2*Pr*Re)/(Pr + Re);
% Fm
% 
% figure
% displayMatrixImage(1,1,2,fgim,gtim)
% 
% str = sprintf('re%06d',1630);
% str = [str '.png'];
% saveImage(fgim, './result/', str);
