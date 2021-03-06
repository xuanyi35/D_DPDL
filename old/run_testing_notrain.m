
run('~/tools/matconvnet-1.0-beta24/matlab/vl_setupnn.m');
addpath('~/projects/imageprocessing/common');
addpath('./function/');
rng(0)

video_result = [];


frames_train_sq = 20;
frames_train_fg = 20;
frames_train_bk = 0;

len_block = 9;
rag_block = 0;
size_block = len_block^2;
frames_border = 1;
peak_border = 2;


global g_block g_epoch g_learningRate;
g_block = len_block;
g_epoch = 40;
g_learningRate = 0.001;




videos =  'baseline/highway';
run_entry_testing_notrain
videos =  'baseline/office';
run_entry_testing_notrain
videos =  'baseline/pedestrians';
run_entry_testing_notrain
videos =  'baseline/PETS2006';
run_entry_testing_notrain




videos =  'badWeather/blizzard'
run_entry_testing_notrain
videos =  'badWeather/skating';
run_entry_testing_notrain
videos =  'badWeather/snowFall';
run_entry_testing_notrain
videos =  'badWeather/wetSnow';
run_entry_testing_notrain






videos =  'cameraJitter/badminton';
run_entry_testing_notrain
videos =  'cameraJitter/boulevard';
run_entry_testing_notrain
videos =  'cameraJitter/sidewalk';
run_entry_testing_notrain
videos =  'cameraJitter/traffic';
run_entry_testing_notrain




videos =  'dynamicBackground/boats';
run_entry_testing_notrain
videos =  'dynamicBackground/canoe';
run_entry_testing_notrain
videos =  'dynamicBackground/fall';
run_entry_testing_notrain
videos =  'dynamicBackground/fountain01';
run_entry_testing_notrain
videos =  'dynamicBackground/fountain02';
run_entry_testing_notrain
videos =  'dynamicBackground/overpass';
run_entry_testing_notrain



videos =  'intermittentObjectMotion/abandonedBox';
run_entry_testing_notrain
videos =  'intermittentObjectMotion/parking';
run_entry_testing_notrain
videos =  'intermittentObjectMotion/sofa';
run_entry_testing_notrain
videos =  'intermittentObjectMotion/streetLight';
run_entry_testing_notrain
videos =  'intermittentObjectMotion/tramstop';
run_entry_testing_notrain
videos =  'intermittentObjectMotion/winterDriveway';
run_entry_testing_notrain




videos =  'lowFramerate/port_0_17fps';
run_entry_testing_notrain
videos =  'lowFramerate/tramCrossroad_1fps';
run_entry_testing_notrain
videos =  'lowFramerate/tunnelExit_0_35fps';
run_entry_testing_notrain
videos =  'lowFramerate/turnpike_0_5fps';
run_entry_testing_notrain




videos =  'nightVideos/bridgeEntry';
run_entry_testing_notrain
videos =  'nightVideos/busyBoulvard';
run_entry_testing_notrain
videos =  'nightVideos/fluidHighway';
run_entry_testing_notrain
videos =  'nightVideos/streetCornerAtNight';
run_entry_testing_notrain
videos =  'nightVideos/tramStation';
run_entry_testing_notrain
videos =  'nightVideos/winterStreet';
run_entry_testing_notrain



videos =  'PTZ/continuousPan';
run_entry_testing_notrain
videos =  'PTZ/intermittentPan';
run_entry_testing_notrain
videos =  'PTZ/twoPositionPTZCam';
run_entry_testing_notrain
videos =  'PTZ/zoomInZoomOut';
run_entry_testing_notrain




videos =  'shadow/backdoor';
run_entry_testing_notrain
videos =  'shadow/bungalows';
run_entry_testing_notrain
videos =  'shadow/busStation';
run_entry_testing_notrain
videos =  'shadow/copyMachine';
run_entry_testing_notrain
videos =  'shadow/cubicle';
run_entry_testing_notrain
videos =  'shadow/peopleInShade';
run_entry_testing_notrain





videos =  'thermal/corridor';
run_entry_testing_notrain
videos =  'thermal/diningRoom';
run_entry_testing_notrain
videos =  'thermal/lakeSide';
run_entry_testing_notrain
videos =  'thermal/library';
run_entry_testing_notrain
videos =  'thermal/park';
run_entry_testing_notrain





videos =  'turbulence/turbulence0';
run_entry_testing_notrain
videos =  'turbulence/turbulence1';
run_entry_testing_notrain
videos =  'turbulence/turbulence2';
run_entry_testing_notrain
videos =  'turbulence/turbulence3';
run_entry_testing_notrain


videos
video_result


