classdef my_ClassificationTree < handle
    
    properties
        
        % Note: we stick with the Matlab naming conventions from fitctree
        
        X % training examples
        Y % training labels
        MinParentSize % minimum parent node size
        MaxNumSplits % maximum number of splits
        
        Verbose % are we printing out debug as we go?
        
        % add any other properties you want on the lines below...
        
        Root % root node of the decision tree
        
        
    end
    
    methods
        
        % constructor: implementing the fitting phase
        
       function obj = my_ClassificationTree(X, Y, MinParentSize, MaxNumSplits, Verbose)
    % set up our training data:
    obj.X = X;
    obj.Y = Y;
    % store the minimum parent node size we're using:
    obj.MinParentSize = MinParentSize;
    % store the maximum number of splits we're using:
    obj.MaxNumSplits = MaxNumSplits;
    
    % are we printing out debug as we go?:
    obj.Verbose = Verbose;
    
    % build the decision tree:
    obj.Root = obj.build_tree(X, Y, 1);
end

function node = build_tree(obj, X, Y, curr_depth)
    % initialize the current node:
    node.IsLeaf = false;
    node.Class = mode(Y);
    
    % check if we have reached the maximum depth or if there are too few examples at this node:
    if curr_depth > obj.MaxNumSplits || size(X,1) <= obj.MinParentSize
        node.IsLeaf = true;
        return;
    end
    
    % find the feature and value to split on:
    [feature, value] = obj.find_best_split(X, Y);
    
    % check if we couldn't find a valid split:
    if feature == 0 || value == 0
        node.IsLeaf = true;
        return;
    end
    
    % split the data into left and right branches:
    X_left = X(X(:,feature) <= value,:);
    Y_left = Y(X(:,feature) <= value,:);
    X_right = X(X(:,feature) > value,:);
    Y_right = Y(X(:,feature) > value,:);
    
    % store the feature and value of the current node:
    node.Feature = feature;
    node.Value = value;
    
    % recursively build the left and right subtrees:
    node.Left = obj.build_tree(X_left, Y_left, curr_depth+1);
    node.Right = obj.build_tree(X_right, Y_right, curr_depth+1);
end

function [best_feature, best_value] = find_best_split(obj, X, Y)
    % initialize the best feature and value to split on:
    best_feature = 0;
    best_value = 0;
    best_impurity = Inf;
    
    % loop through each feature:
    for feature = 1:size(X,2)
        % sort the data by the current feature:
        [X_sorted, indices] = sortrows(X, feature);
        Y_sorted = Y(indices);
        
        % loop through each value in the sorted data:
        for i = 1:size(X_sorted,1)-1
            % if the current value is the same as the previous value, skip it:
            if X_sorted(i,feature) == X_sorted(i+1,feature)
                continue;

                            end
            
            % split the data into two sets based on the current value:
            X_left = X_sorted(1:i,:);
            Y_left = Y_sorted(1:i,:);
            X_right = X_sorted(i+1:end,:);
            Y_right = Y_sorted(i+1:end,:);
            
            % calculate the impurity of the two sets:
            impurity = obj.calc_impurity(Y_left, Y_right);
            
            % if the impurity of the two sets is lower than the current best impurity, 
            % update the best feature and value:
            if impurity < best_impurity
                best_impurity = impurity;
                best_feature = feature;
                best_value = (X_sorted(i,feature) + X_sorted(i+1,feature)) / 2;
            end
        end
    end
end

function predictions = predict(obj, test_examples)
    % get ready to store our predicted class labels:
    predictions = categorical;
    
    % loop through each test example:
    for i = 1:size(test_examples,1)
        
        % initialize the current test example and the current node as the root node:
        curr_example = test_examples(i,:);
        curr_node = obj.Root;
        
        % follow the tree down to a leaf node:
        while ~curr_node.IsLeaf
            % get the feature and value of the current node:
            feature = curr_node.Feature;
            value = curr_node.Value;
            
            % if the current example has a value less than or equal to the current node's value for the given feature, 
            % follow the left branch; otherwise, follow the right branch:
            if curr_example(:,feature) <= value
                curr_node = curr_node.Left;
            else
                curr_node = curr_node.Right;
            end
        end
        
        % store the class label of the current leaf node as the prediction for the current test example:
        predictions(i) = curr_node.Class;
    end
end


function impurity = calc_impurity(obj, Y_left, Y_right)
    % calculate the total impurity of the two sets:
    impurity = obj.weighted_impurity(Y_left) + obj.weighted_impurity(Y_right);
end

function impurity = weighted_impurity(obj, Y)
    % calculate the weighted impurity of a set of labels:
    impurity = 0;
    num_examples = size(Y,1);
    classes = unique(Y);
    for c = 1:numel(classes)
        p = sum(Y == classes(c)) / num_examples;
        impurity = impurity - p * log2(p);
    end
end

    end

    
end