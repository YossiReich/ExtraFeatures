classdef Threshes
    %UNTITLED15 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(GetAccess = public, SetAccess = private)
        pair = 15;
        leftEye = 21;
        rightEye = 21;
    end
    
    methods
        function t = Threshes(pair, left, right)
            if nargin ~= 0
                t.pair = pair;
                t.leftEye = left;
                t.rightEye = right;
            end
        end
    end
    
end

