Year 3 AI Module Files
This repository contains files for my Year 3 AI module, all written in MATLAB.

Files Included
1. moons.csv - Moons Dataset
This dataset is used for various machine learning tasks within the module.

2. my_1CWK50 - Live Script Coursework Task
This script likely represents a specific coursework task or assignment for the module.

3. my_ClassificationKNN
This file contains my own implementation of k-Nearest Neighbors (k-NN) classification. It includes properties to store training data and hyperparameters, as well as methods for constructing and making predictions using the k-NN algorithm.

4. my_ClassificationTree
This file contains my own implementation of decision tree-based classification. It includes properties for storing training data and hyperparameters, along with methods for constructing a decision tree and making predictions. The decision tree is constructed with a specified minimum parent node size and a maximum number of splits, using entropy-based impurity as the splitting criterion.

5. my_fitcknn
my_fitcknn is a convenient wrapper function for creating an instance of the my_ClassificationKNN class. It accepts training examples and labels as inputs, along with optional parameters for configuring the k-NN model, such as the number of nearest neighbors ('NumNeighbors') and verbose mode ('Verbose'). The function simplifies the process of creating and configuring k-NN classification models.

6. my_fitctree
my_fitctree provides a user-friendly interface for creating an instance of the my_ClassificationTree class for decision tree-based classification. It accepts training examples and labels as inputs, along with optional parameters for configuring the decision tree, such as the minimum parent node size ('MinParentSize'), maximum number of splits ('MaxNumSplits'), and verbose mode ('Verbose'). This function streamlines the creation and customization of decision tree classification models.

7. soft_voting
The soft_voting function combines predictions from two models using weighted averaging. It takes predictions from two models (predictions1 and predictions2) and a vector of weights (weights) specifying the influence of each model's prediction. The function checks input compatibility, performs weighted averaging, and rounds the result to the nearest integer. This function is useful for aggregating predictions from multiple models while controlling the influence of each model.

8. visualise_abstraction
visualise_abstraction is designed to visualize a 2D abstraction produced by a classifier. Assuming that the classifier m has been trained on two predictive features, the function generates a meshgrid covering the feature space, makes predictions on this grid using the classifier, and displays the results as a scatter plot with different colors for different predicted classes. It also adjusts the axis labels and limits for improved visualization, providing insights into how the classifier partitions the feature space.