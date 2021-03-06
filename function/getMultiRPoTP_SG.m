function re_imdb = getMultiRPoTP(im_pa, im_ft, gt_pa, gt_ft, list_idx, num, mode, flag)

if nargin == 1
    flag == 'get';
end

if nargin == 6
    mode = 'test';
end


global m_getMultiRPoTP_im_pa;
global m_getMultiRPoTP_im_ft;
global m_getMultiRPoTP_gt_pa;
global m_getMultiRPoTP_gt_ft;
global m_getMultiRPoTP_list_idx;
global m_getMultiRPoTP_num;
global m_getMultiRPoTP_mode;


global g_imdb_start;

global g_flag_endstart;





global g_flag_oneframes










if flag == 'set'
    re_imdb = [];
    m_getMultiRPoTP_im_pa    = im_pa;
    m_getMultiRPoTP_im_ft    = im_ft;
    m_getMultiRPoTP_gt_pa    = gt_pa;
    m_getMultiRPoTP_gt_ft    = gt_ft;
    m_getMultiRPoTP_list_idx = list_idx;
    m_getMultiRPoTP_num      = num;
    m_getMultiRPoTP_mode     = mode;

elseif flag == 'get'
    im_pa      = m_getMultiRPoTP_im_pa;
    im_ft      = m_getMultiRPoTP_im_ft;
    gt_pa      = m_getMultiRPoTP_gt_pa;
    gt_ft      = m_getMultiRPoTP_gt_ft;
    list_idx   = m_getMultiRPoTP_list_idx;
    num        = m_getMultiRPoTP_num;
    mode       = m_getMultiRPoTP_mode;


    if isempty(g_flag_oneframes) ~= 1
        
        global g_flag_oneframes_store

        if isempty(g_flag_oneframes_store) ~= 1
            re_imdb = g_flag_oneframes_store;

            disp('in the flag oneframes')
        else
            imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, list_idx(1), num, mode);

            g_flag_oneframes_store = imdb;

            re_imdb = imdb;

            disp('in the flag oneframes_else')
        end
    else
        len = max(size(list_idx));

        imdb_set = {};
        for i = 1:len
            imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, list_idx(i), num, mode);
            imdb.images.data = int16(imdb.images.data);
            
            imdb_set = {imdb_set{:}, imdb};

        end





        
        if isempty(g_flag_endstart) ~= 1
            re_imdb = mixImdb(imdb_set{:}, g_imdb_start);
    %        re_imdb.images.data = single(re_imdb.images.data);
    %        re_imdb = mixImdb(re_imdb, g_imdb_start);
            disp('mixing the original imdb')
        else
            re_imdb = mixImdb(imdb_set{:});
    %        re_imdb.images.data = single(re_imdb.images.data);
            disp('still in the start')
        end



    %    re_imdb = balanceImdb_plus(re_imdb, 0.4);

        


    %    re_imdb = balanceImdb_bySrc(re_imdb);

        sum(sum(re_imdb.images.labels == 255))
        sum(sum(re_imdb.images.labels == 1))
        disp('number of imdb')

    end





%    re_imdb = balanceImdb_plus(re_imdb,0.4);

%    re_imdb = softImdb(re_imdb);
%    re_imdb = balanceImdb_bySrc(re_imdb);
%    re_imdb = balanceImdb_plus(re_imdb);
else
    im_pa      = m_getMultiRPoTP_im_pa;
    im_ft      = m_getMultiRPoTP_im_ft;
    gt_pa      = m_getMultiRPoTP_gt_pa;
    gt_ft      = m_getMultiRPoTP_gt_ft;
    list_idx   = m_getMultiRPoTP_list_idx;
    num        = m_getMultiRPoTP_num;
    mode       = m_getMultiRPoTP_mode;

    len = max(size(list_idx));

    imdb_set = {};
    for i = 1:len
        imdb = getRPoTP(im_pa, im_ft, gt_pa, gt_ft, list_idx(i), num, mode);
        imdb.images.data = int16(imdb.images.data);
        
        imdb_set = {imdb_set{:}, imdb};

    end




%    re_imdb = mixImdb(imdb_set{:});
%     clear re_imdb.images.labels;
%     re_imdb.images.labels = [];

    
    if isempty(g_flag_endstart) ~= 1
        re_imdb = mixImdb(imdb_set{:}, g_imdb_start);
%        re_imdb.images.data = single(re_imdb.images.data);
        disp('mixing the original imdb')
    else
        disp('still in the start')
    end


    clear re_imdb.images.data;
    re_imdb.images.data = [];

%    re_imdb = balanceImdb_plus(re_imdb, 0.4);

    


%    re_imdb = balanceImdb_bySrc(re_imdb);

    sum(sum(re_imdb.images.labels == 255))
    sum(sum(re_imdb.images.labels == 1))
    disp('number of imdb')





%    re_imdb = balanceImdb_plus(re_imdb,0.4);

%    re_imdb = softImdb(re_imdb);
%    re_imdb = balanceImdb_bySrc(re_imdb);
%    re_imdb = balanceImdb_plus(re_imdb);

end


