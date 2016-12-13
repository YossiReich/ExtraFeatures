classdef Subject
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(Access = private)
        CONSTS = Conststants();
        path
        textData
        statistics
        excep
    end
    
    methods
        % Constructor
        function sub = Subject(subjectPath, stats, subjectException)
            sub.path = subjectPath;
            sub.textData = TextData(subjectPath);
            sub.statistics = stats;
            sub.excep = subjectException;
        end
        % Running the subject videos and extracting the features according
        % to the given statistics
        features = getFeatures(sub);
        
    end
    
end

