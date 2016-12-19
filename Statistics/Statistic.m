classdef Statistic < handle
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(Access = private)
        state = 'steadyState';
        featureVector = [];
        featureNum = 1;
    end
    
    methods
        function [] = start(s,numVideoFrames)
            s.featureVector = zeros(1,numVideoFrames);                
        end 
    end
    methods(Access = protected)
        function s = addSample(s, sample)
            if s.featureNum > length(s.featureVector)
                error(['Too many sample were added!! featuerNum = ' ...
                    num2str(s.featureVector) ', length of featureVector = '...
                    num2str(length(s.featureVector))]);
            else
                s.featureVector(1,s.featureNum) = sample;
                s.featureNum = s.featureNum + 1;
            end
        end
        function boolRes = isSteadyState(s)
            if s.state == 'steadyState'
                boolRes = true;
            else
                boolRes = false;
            end
        end
        function [] = setSteadyState(s)
            s.state = 'steadyState';
        end
        function [] = setTestState(s)
            s.state = 'testState';
        end
        function s = resetVectorAndState(s,numVideoFrames)
            s.featureVector = zeros(1,numVideoFrames);
            s.featureNum = 1;
            s.setSteadyState();
        end
        function featureVector = getFeatureVector(s)
            featureVector = s.featureVector;
        end
    end
    methods(Abstract = true)
        [] = step(s, frameData)
        [] = finish(s)
    end
    
    
end

