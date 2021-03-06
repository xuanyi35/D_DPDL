clear all
close all
clc

addpath('./function/');
addpath('./function/frames_selection/');
addpath('./function/imdb_difference/');
addpath('./function/bayesian/');
addpath('../common/');
addpath('../common_c/');

 

run('~/libs/matconvnet-1.0-beta25/matlab/vl_setupnn.m')





clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/cameraJitter/boulevard/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/boulevard/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/cameraJitter/boulevard_20fs/';
net_pa = '~/projects/matrix/network/iterative/cameraJitter/boulevard_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/sidewalk/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/cameraJitter/sidewalk_20fs/';
net_pa = '~/projects/matrix/network/iterative/cameraJitter/sidewalk_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);




clear all
close all
clc


im_pa = '~/dataset/dataset2014/dataset/cameraJitter/traffic/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/traffic/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/cameraJitter/traffic_20fs/';
net_pa = '~/projects/matrix/network/iterative/cameraJitter/traffic_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);



clear all
close all
clc

im_pa = '~/dataset/dataset2014/dataset/cameraJitter/badminton/input/';
im_ft = 'jpg';

gt_pa = '~/dataset/dataset2014/dataset/cameraJitter/badminton/groundtruth/';
gt_ft = 'png';

fg_pa = '~/projects/matrix/detection/iterative/cameraJitter/badminton_20fs/';
net_pa = '~/projects/matrix/network/iterative/cameraJitter/badminton_20fs/';

iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, 1);


