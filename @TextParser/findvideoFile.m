function [ videoFile ] = findvideoFile(tp, videoNum)
% Find the extention of the video file in tp.path

endings = {'mp4','MP4','mov','MOV', 'avi','AVI'};
found = false;
%addpath(genpath(tp.path));
 
for i = 1:size(endings,2)
    fullPath = fullfile(tp.path, [num2str(videoNum) '.' endings{i}]);
    if exist(fullPath,'file')
        found = true;
        break;
    end
end
 
if not(found)
    error('Video file was not found!');
end

videoFile = fullPath;
end


