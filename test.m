%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 获得光栅刺激下神经元集群响应的PSTH，研究基于第一个spike延时的信息编码
% 黑白光栅图，刺激频率100Hz，光栅持续15帧，灰屏持续15帧，光栅共15种，每种重复30刺激

clear
close all
clc

%% 基本路径设置
% animal_id = 15;  animal_name = strcat('OT_', num2str(animal_id))  ;
animal_name = '20180726';
date_info = '400um';
exp_name = '';
base = 'F:\pigeon-data\';
base_path = strcat(base, animal_name, '\', date_info, '\');
% base_path = strcat(base, animal_name, '\', date_info, '\', exp_name, '\');
% 
matrix_path = 'D:\Data\stim_matrix\';                % 刺激矩阵路径
 
  


%% 基本参数设置
all_chan_ser =  1 :32  ;
all_chan_nums = length(all_chan_ser);

%% 获得光栅刺激下神经元响应的PSTH
stim_frq_ser = [100 50 25 30 60 120 160];
reps_nums = 80;          % PSTH多次重复试验的次数
grating_resting = 15;      % 每个刺激帧显示15个基础帧
 
%     载入神经元响应数据
%     FileName = strcat('old_on_off_dete.nev');  %%%old_on_off数据路径
    FileName = strcat('old_on_off_dete.nev');  %%%color_on_off数据路径
     FullFileName = strcat(base_path, FileName);   %%%old_on_off路径
%      FullFileName = 'F:\pigeon-data\20180205\600um\Simple_gray_test\B_white_black001.nev'  ;  
    
    aini=136;
[SPIKEData, PathFile,PVCSRand] = getSpikeDatal(FullFileName);%SPIKEData{1,1：16}:发放时刻：N*1
% [SPIKEData]=raw_spk(FullFileName,aini);
%SPIKEData{2,1：16}:每个通道的spike波形：N*48
%SPIKEData{2,1：16}:每个通道的阈值
%SPIKEData{4,1：16}:对应的通道标号
% % jtemp = find(cell2mat(SPIKEData(4,:)) == aini);
% %     nr_129_tmp1 = SPIKEData{1,jtemp};
% %      nr_129_tmp2 = nr_129_tmp1(1:1:end);
% %  nr_129 = cat(1,nr_129_tmp2, 2*nr_129_tmp2(end)-nr_129_tmp2(end-1));

chan_set =  cell2mat(SPIKEData(4,:)) ;
% chan_set = self_f_pca(chan_set,0.9);
% spike_wave = cell2mat(SPIKEData(2,:)) ;

chan_len = length(chan_set)-1;
% for i=all_chan_ser 
%     figure(i )
%     pos = [];
%     spike_wave = cell2mat(SPIKEData(2,i)) ;
%     spike_wave = spike_wave' ;
%     [row,col] = size(spike_wave );
% %     total_col = 1:col;
%     max_col = max(spike_wave);
%     min_col = min(spike_wave);
%     max_val = max(max(spike_wave));
%     min_val = min(min(spike_wave));
%     thres_up = 2/3* max_val ;  
%     thres_down = 2/3* min_val ;  
%     total_col = find(max_col<thres_up & min_col>thres_down);
%     
%  %     spike_wave = spike_wave' ;
% %     spike_wave = spike_wave(:,1:1000);
% %     spike_wave = self_f_pca( spike_wave,0.90);
% 
%     plot(spike_wave(:,total_col),'k')
% end

% for i=all_chan_ser
%     figure(i)
% %     hold
%     spike_wave = cell2mat(SPIKEData(2,i)) ;
% %     
%     spike_wave = self_f_pca(spike_wave,0.9);
%     spike_wave = spike_wave'  ;
%     plot(spike_wave ,'k')
% end




for i=1:chan_len
    figure(i)
%     hold
    spike_wave = cell2mat(SPIKEData(2,i)) ;
    plot(spike_wave','k')
end
 
    
    
 
        
    
    
    
    
    
