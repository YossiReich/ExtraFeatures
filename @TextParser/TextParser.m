classdef TextParser
    % This class is resposible to parse and store all the data that is
    % given by the text files of the subject
    properties(Access = private)
        CONSTS = Conststants();
        path
        data
    end
    
    methods
        % Constructor
        function tp = TextParser(subjectPath)
            tp.path = subjectPath;
            tp.data = tp.parseFiles();
        end
        % VideoData getter
        function videoData = getVideoData(tp, videoNum)
            videoData = tp.data{videoNum};
        end
    end
    
    methods(Access = private)
        % Parse all text files in the tp.path
        data = parseFiles(tp);
                
        % Get video file path
        extention = findvideoFile(tp, videoNum);
    end
    
end

