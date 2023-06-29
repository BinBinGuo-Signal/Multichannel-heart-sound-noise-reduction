fid=fopen([str1 str2]);
m=textscan(fid,'%f %f  %f %f %f %f %f %f %f %f %f %f %f ');
fclose(fid);
% 将cell转换为矩阵
for k=1:13
    d_x(:,k)=m{:,k};
end
clear m;
%将各卡对应的通道数据依次连接起来
for CardInd=0:7
    Card(CardInd+1,1).data=d_x(find(d_x(:,1)==CardInd),:);
    sz(CardInd+1,:)=[CardInd size(Card(CardInd+1,1).data)];
    %表示各卡采集的数据长度、通道数量
end
clear d;

sz;   %显示各卡采集的数据长度、通道数量

TimeLength=sz(1,2)/fs;     %所采集信号的时间长度，单位秒

ra=1:sz(1,2);    % 样本点数
N = length(ra);
%上述程序获得了Card数据存储空间
Card = cell2mat(struct2cell(Card));
Card(:,1:13:92) = [];  % 获取只包含信号的矩阵