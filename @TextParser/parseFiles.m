function [ data ] = parseFiles(tp)
% This function parset a single text file and returnes a videoData object

NUM_OF_VIDEOS = tp.CONSTS.NUM_OF_VIDEOS;

data = cell(1, NUM_OF_VIDEOS);

for videoNum = 1:NUM_OF_VIDEOS
    % Create video Data object
    videoData = VideoData();

    % Create video path
    videoData.videoPath = tp.findvideoFile(tp, videoNum);

    % Parse the txt file
    fileName = fullfile(tp.path, [num2str(videoNum) '.txt']);
    rawData = importdata(fileName);
    videoData.numOfFrames = rawData(1);
    videoData.videoRSPoints = reshape(rawData(2:end),[],rawData(1))';
    
    % Add videoData to data array
    data{videoNum} = videoData;
end

end

 