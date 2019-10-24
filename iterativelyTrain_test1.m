function [] = iterativelyTrain(im_pa, im_ft, gt_pa, gt_ft, fg_pa, net_pa, nums_iterative, bay_range, bay_rate)

if nargin == 6
    nums_iterative = 5;
%    bay_range = 3;
%    bay_rate = 0.8;
    bay_range = 4;
    bay_rate = 0.7;
    bay_deep = 3;
end

if nargin == 7
    bay_range = 4;
    bay_rate = 0.7;
    bay_deep = 3;
end


% actually, no need for this
src_idx = 0;

radius = 25;
fg_ft = 'png';

num_bay = 3;

pa_name = extractPathName_byResult(fg_pa);
pa_name



for i = 1:nums_iterative

    global g_iteration_count
    g_iteration_count = i;
    if i == 1

        judge_frames = 0;
        border_frames = 50;
        idx = [];

        
%        [idx rat] = selectBalFrame(gt_pa, gt_ft);

        while judge_frames == 0


            % select a groundtruth to start training
            [idx rat] = selectBalFrame(gt_pa, gt_ft);
%            idx = [];

    %         [idx rat] = selectPeakBalFrame(gt_pa, gt_ft)
    % 
    %         idx = [];
            idxes = getFgPeakFrames_rand(gt_pa, gt_ft, 1, border_frames);
    %        [idxes temp_rates] = selectFgRand(gt_pa, fg_ft, 4);

             idxes = [];


            idxsq = getSqFrames(gt_pa, gt_ft, 1);
            idxsq = [];
    % 
    %          idx = [idxes; idxsq];

            idx = [idx; idxes; idxsq]
            judge_frames = 1;

            if max(size(idx)) ~= 3
                border_frames = round(border_frames/2 + 0.5);
                disp('the border is too large');
            elseif max(size(unique(idx))) ~= max(size(idx))
                border_frames = border_frames - 1;
                border_frames = max([border_frames 1]);
                disp('there is repetition');
            else
                judge_frames = 1;
                break;
            end
        end
% 

         src_idx = idx
 
         imdb = getMultiRPoTP_SG(im_pa, im_ft, gt_pa, gt_ft, idx, radius^2, 'train', 'set');
         imdb = getMultiRPoTP_SG([], [], [], [], [], [], [],'get');

         allnum = max(size(imdb.images.labels));
         saverate = [sum(imdb.images.labels == 255) / allnum   sum(imdb.images.labels == 1) / allnum];
         txtWrite(saverate, sprintf('%s_iteration_%02d_rates.txt', pa_name, i));

         global g_imdb_start;
%         g_imdb_start = imdb;
         g_imdb_start = [];

         clear imdb.images.data;
         imdb.images.data = [];

         disp('the g_imdb_start is initialized')


         % start training the network with one groundtruth
         if exist([fg_pa sprintf('iteration_%02d_net2fg/', i)]) == 0
             iterativelyTrain_start;
         else
             disp('skip iterativelyTrain_start');
         end
 




         % detect the foreground image
         if exist([fg_pa sprintf('iteration_%02d_fg2bay/', i)]) == 0
             iterativelyTrain_start_net2fg;
         else
             disp('skip iterativelyTrain_start_net2fg')
         end
 
 
         % refine the foreground image by Bayesian model
         if exist([net_pa sprintf('iteration_%02d/', i + 1)]) ==0
             iterativelyTrain_start_fg2bay;
         else
             disp('skip iterativelyTrain_start_fg2bay');
         end

         global g_flag_endstart
         g_flag_endstart = 1;
    else
%        global g_diff_list
%        g_diff_list = [];

        % retrain the network after Bayesian refinement
        if exist([fg_pa sprintf('iteration_%02d_net2fg/', i)]) ==0
            iterativelyTrain_bay2net;
        else
            disp(['skip iterativelyTrain_bay2net' sprintf(' iteration = %02d', i)]);
        end

        % detect the foreground image
        if exist([fg_pa sprintf('iteration_%02d_fg2bay/', i)]) == 0
            iterativelyTrain_net2fg;
        else
            disp(['skip iterativelyTrain_net2fg' sprintf(' iteration = %02d', i)]);
        end

        % refine the foreground by Bayesian model
        if exist([net_pa sprintf('iteration_%02d/', i + 1)]) ==0
            iterativelyTrain_fg2bay;
        else
            disp(['skip iterativelyTrain_fg2bay' sprintf(' iteration = %02d', i)]);
        end
    end
end

