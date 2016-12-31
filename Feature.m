classdef Feature < handle
    % This class holds all the data that is gathered from all videos of a
    % subject regarding a specific feature
    properties(Access = private)
        CONSTS = Conststants();
        featureVals
        featureVectors
        videoNum
    end
    
    methods(Access = private)
        function sample = getSampleFromVector(~,vector)
            % TODO: Need to implement!
            sample = mean(vector);
        end
    end
    methods
        function f = Feature()
            f.featureVals = zeros(1,f.CONSTS.NUM_OF_VIDEOS - 1);
            f.featureVectors = cell(1,f.CONSTS.NUM_OF_VIDEOS - 1);
            f.videoNum = 1;
        end
        function f = addNewVector(f,vector)
            if f.videoNum > length(f.featureVectors)
               error('too many samples were added!');
            end
            f.featureVectors{f.videoNum} = vector;
            f.featureVals(f.videoNum) = f.getSampleFromVector(vector);
            f.videoNum = f.videoNum + 1;
        end
        function vals = getFeatureVals(f)
            vals = f.featureVals;
        end
        function vectors = getFeatureVecs(f)
            vectors = f.featureVectors;
        end        
    end
    
end

