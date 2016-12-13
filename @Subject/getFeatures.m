function [ features ] = getFeatures(sub)
% This method uses the subject video and data and returns the calculated
% features

NUM_OF_VIDEOS = sub.CONSTS.NUM_OF_VIDEOS;

%% Run videos

% Create videoRunner object
videoRunner = VideoRunner(sub.statistics);

% Go over the videos
for videoNum = 1:NUM_OF_VIDEOS
    
    % Get the video data
    videoData = sub.textData.getVideoData(videoNum);
    videoData.excep = sub.excep{videoNum};
    
    % Prepare statistic object for new video
    sub.statistics.start(videoData.numOfFrames);
    
    % Set videoRunner and run the video
    videoRunner.setVideoRunner(videoData);
    videoRunner.runVideo();       
end

%% Get features

features = sub.statistics.finishTestState();
end

