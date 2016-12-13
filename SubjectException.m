classdef SubjectException < handle
    % This class can hold any kind of exception that should be implemented
    % during the algorithem for a specific subject or video
    % The class holds a logical matrix with NUM_OF_EXCEP_TYPES rows and
    % NUM_OF_VIDEOS cols, if a cell is true it means that the exception 
    % should be implemented at the right point.
    % If a new exception should be created, the expection matrix should
    % have new row and the set and isException function should be
    % implemented
    properties(Access = private, Constant = true)
        CONSTS = Conststants();
        NUM_OF_EXCEP_TYPES   = 3
        SKIP_FRAME_EXCEP_IND = 1;
        THRESH_EXCEP_IND     = 2;
        NUM_BOXES_EXCEP_IND  = 3;
    end
    properties(Access = private)
        exceptions              % Matrix with NUM_OF_EXCEP_TYPES rows and NUM_OF_VIDEOS cols
    end
    properties(GetAccess = public, SetAccess = private)
            minNumOfBoxes = 1;      % The minimum number of boxes
            thresh = Threshes(41,21,21);    % The threshes for the boxes
    end
    properties(GetAccess = private)
            videoRunning         % This value should be updates when video is changed
    end
    methods
        
        function se = SubjectException()           
            % Creates the SubjectException object, The c'tor creates the
            % exception matrix
            se.exceptions = false(se.NUM_OF_EXCEP_TYPES,se.CONSTS.NUM_OF_VIDEOS); 
        end
         
        function se = setSkipFrameExcep(se, videoNum)
            % If no params are given, all videos will have exception
            % If videoNum is specified only the given video will have
            % exception
            if nargin==1
                se.exceptions(se.SKIP_FRAME_EXCEP_IND, :) = true;
            else
                se.exceptions(se.SKIP_FRAME_EXCEP_IND, videoNum) = true;
            end
        end
        
        function se = setMinNumBoxesExcepAllVideos(se, minNumOfBoxes, videoNum)
            % If no params are given all videos will have exception and the
            % min number of boxes will be 1
            % If one parameter is given all video will have exception and
            % the min number of boxes will be equl to the given parameter
            % If both params are given, the first one is the minimum and
            % the second is the video number
            switch nargin
                case 1
                    se.exceptions(se.NUM_BOXES_EXCEP_IND, :) = true;
                case 2
                    se.exceptions(se.NUM_BOXES_EXCEP_IND, :) = true;
                    se.minNumOfBoxes = minNumOfBoxes;
                case 3
                    se.exceptions(se.NUM_BOXES_EXCEP_IND, videoNum) = true;
                    se.minNumOfBoxes = minNumOfBoxes;
            end
        end
        
        function se = setThreshExcep(se, threshes, videoNum)
            % If no parameters are given -  all videos will have exception,
            % If only threshes is specfied than all video will have
            %   exception and the given threshes will be used 
            % If also videoNum is specified than only this video will have
            %   exception
            switch nargin
                case 1
                    se.exceptions(se.THRESH_EXCEP_IND, :) = true;
                case 2
                    se.exceptions(se.THRESH_EXCEP_IND, :) = true;
                    se.thresh = threshes;
                case 3
                    se.exceptions(se.NUM_BOXES_EXCEP_IND, videoNum) = true;
                    se.thresh = threshes;
            end
        end
        
        % isExcep functions:
        function boolRes = isStepFramExcep(se)
            if(isempty(se.videoRunning))
                error('No video is running');
            end
            boolRes =  se.exceptions(se.SKIP_FRAME_EXCEP_IND, se.videoRunning);
        end
        
        function boolRes = isNumBoxesExcep(se)
            if(isempty(se.videoRunning))
                error('No video is running');
            end
            boolRes =  se.exceptions(se.NUM_BOXES_EXCEP_IND, se.videoRunning);
        end
        
        function boolRes = isThreshExcep(se)
            if(isempty(se.videoRunning))
                error('No video is running');
            end
            boolRes =  se.exceptions(se.THRESH_EXCEP_IND, se.videoRunning);
        end       
    end
    methods(Hidden = true)
        function dbgObj(se)
            keyboard;
        end
    end
     
end

