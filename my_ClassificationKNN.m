classdef my_ClassificationKNN < handle
        
    properties
        
        % Note: we stick with the Matlab naming conventions from fitcknn
        
        X % training examples
        Y % training labels
        NumNeighbors % number of nearest neighbours to consider
        
        Verbose % are we printing out debug as we go?
    end
    
    methods
        
        % constructor: implementing the fitting phase
        
        function obj = my_ClassificationKNN(X, Y, NumNeighbors, Verbose)
            
            % set up our training data:
            obj.X = X;
            obj.Y = Y;
            % store the number of nearest neighbours we're using:
            obj.NumNeighbors = NumNeighbors;
            
            % are we printing out debug as we go?:
            obj.Verbose = Verbose;
        end
        
        % the prediction phase:
        
        function predictions = predict(obj, test_examples)
            
            % get ready to store our predicted class labels:
            predictions = categorical;
            
            % over to you for the rest... 
            
            % add your code on the lines below...

            %get number of test examples
            num_testExamples = size(test_examples, 1);

            %iterate over test examples
            for i =1 : num_testExamples
            
            %compute euclidean distance
            distance = sqrt(sum((obj.X - test_examples(i,:)).^2 , 2));

            %find the indices nearest neighbor(s) of x, with 
            %amount of neighbours being the value given in the
            %nearest neighbour hyperparameter

            [~, indices] = sort(distance);
            nearest_neighbors = indices (1:obj.NumNeighbors);

            %predict label by majority class of k nearest neighbors

            labels = obj.Y(nearest_neighbors);
            label = mode(labels);
            
            
            % add the predicted label to the array of predictions
        predictions(i) = label;
            end
            
            
        end
        
    end
    
end
