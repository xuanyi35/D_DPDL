clear all
close all
clc


addpath('~/projects/matrix/common/');
addpath('./function/');
addpath('./old/');



fg_pa = '../detection/random_epoch/highway_60/';
fg_pa = '../detection/random_epoch/PETS2006_60/';
% fg_pa = '../detection/random_epoch/pedestrains_60/';
% fg_pa = '../detection/random_epoch/office_60/';
fg_ft = 'png';


gt_pa = '~/dataset/dataset2014/dataset/baseline/highway/groundtruth/';
gt_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/groundtruth/';
% gt_pa = '~/dataset/dataset2014/dataset/baseline/office/groundtruth/';
gt_ft = 'png';

im_pa = '~/dataset/dataset2014/dataset/baseline/highway/input/';
im_pa = '~/dataset/dataset2014/dataset/baseline/PETS2006/input/';
% im_pa = '~/dataset/dataset2014/dataset/baseline/pedestrians/input/';
% im_pa = '~/dataset/dataset2014/dataset/baseline/office/input/';
im_ft = 'jpg';





[files_im fullfiles_im] = loadFiles_plus(im_pa, im_ft);
[files_fg fullfiles_fg] = loadFiles_plus(fg_pa, fg_ft);
[files_gt fullfiles_gt] = loadFiles_plus(gt_pa, gt_ft);


idx = 1550;
idx = 720;

% idx = 1000;


im = double(imread(fullfiles_im{idx}));
gt = double(imread(fullfiles_gt{idx}));
fg = double(imread(fullfiles_fg{idx}));



showim = emphImage_byMask(im, fg, [200 101 100], 0.7);

imwrite(uint8(fg),'pets2006_src.png');
imwrite(uint8(showim), 'pets2006_shw.png')

left = 180;
top  = 340;
right = 360;
bottom = 560;


im = im(top:bottom, left:right, :);
gt = gt(top:bottom, left:right, :);
fg = fg(top:bottom, left:right, :);




store_fm = [];

[TP FP FN TN] = evalution_entry(fg,gt);

Re = TP/(TP + FN);
Pr = TP / (TP + FP);
Fm = (2*Pr*Re)/(Pr + Re);

[Re Pr Fm]
store_fm = [store_fm; Re Pr Fm];


path_save = '../detection/recursive/pets2006/';
saveImage(im, path_save, 'srcim.png');
saveImage(gt, path_save, 'gtim.png');
saveImage(fg, path_save, 'srcfgimg.png');



figure(1)
figure(2)



global g_displayMatrixImage
g_displayMatrixImage = 1;

%displayMatrixImage(1,1,3, im, fg, gt)
oldfg = fg;


judge = 0;

for i = 1:50

%     if i < 40
%     % if judge < 3
%     %     judge = judge + 1;
%          fg = bayesRefine(im, fg, 8, 0.6);
%     else
%     %     judge = 0;
%          fg = bayesRefine(im, fg, 4, 1.2);
%     end

 
    fg = bayesRefine(im, fg, 10, 0.6);
   
    [TP FP FN TN] = evalution_entry(fg,gt);

    Re = TP/(TP + FN);
    Pr = TP / (TP + FP);
    Fm = (2*Pr*Re)/(Pr + Re);

    [Re Pr Fm]
    store_fm = [store_fm; Re Pr Fm];

    sum(sum(fg == 255))

    showim = emphImage_byMask(im, fg, [200 101 100], 0.7);

    figure(1)
    displayMatrixImage(i, 2, 3, im, oldfg, showim,  fg, gt, showim)

%    input('pause')

%    input('in the for')
%     input('in the for')

    figure(2)
    plot(1:i + 1, store_fm(:, 3), '-o', 'Color', [0.5 0.5 1], 'LineWidth', 4)
    hold on
    plot(1:i + 1, store_fm(:, 2), '-o', 'Color', [0.5 1 0.5], 'LineWidth', 4)
    hold on
    plot(1:i + 1, store_fm(:, 1), '-o', 'Color', [1 0.5 0.5], 'LineWidth', 4)
    legend('Fm','Pr','Re', 'Location', 'southeast')
    drawnow

    str = sprintf('fg_%04d.png', i);

    saveImage(fg, path_save, str);
end


    figure(2)
    plot(1:i + 1, store_fm(:, 3), '-o', 'Color', [0.5 0.5 1], 'LineWidth', 4)
    hold on
    plot(1:i + 1, store_fm(:, 2), '-o', 'Color', [0.5 1 0.5], 'LineWidth', 4)
    hold on
    plot(1:i + 1, store_fm(:, 1), '-o', 'Color', [1 0.5 0.5], 'LineWidth', 4)
    legend('Fm','Pr','Re', 'Location', 'southeast')
    set (gcf, 'Color',[1 1 1])

    drawnow

F=getframe(gcf);
imwrite(F.cdata,[path_save 'roc.png']);


imwrite(uint8(fg),'pets2006_src_fin.png');
imwrite(uint8(showim), 'pets2006_shw_fin.png')

