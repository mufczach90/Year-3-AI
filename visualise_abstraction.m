% Description: generate a 2D visualisation of the abstraction produced by a
% classifier
%
% Inputs: 
% m: a classifier
% 
% Outputs:
% None
% 
% Notes: 
% You can just assume for now that the classifier has been trained on only
% two predictive features. We'll return to relax this assumption later on.
%
function visualise_abstraction(m)

    figure; % open a new figure window, ready for plotting
    
    % add your code on the lines below...

   %create a meshgrid from the values from minimum training example value to
   % maximum training example value, with a spacing of 0.05 between the values
   


  hundredth = round((max(m.X(:,1)) - min(m.X(:,2))) / 100,3);


[X Y] = meshgrid( min(m.X(:,2)) : hundredth : max(m.X(:,1)));

%turn the meshgrid into 2 columns, one for X values and one for Y values
gridgrid = [X(1:1:end)' Y(1:1:end)'];

%make new predictions by passing the meshgrid values into the knn
%classifier fitted earlier
predictions = m.predict(gridgrid);

%create gscatter with x values and Y values and the new predictions made
%above
gscatter(gridgrid(:,1),gridgrid(:,2), predictions,"rcb",".")

%manipulate the x and y axis labels to jump at 0.2 intervals between the
%values listed
xticks(round(min(m.X(:,1))) : 0.5 :round(max(m.X(:,1))))
yticks(round(min(m.X(:,2))): 0.5 : round(max(m.X(:,2))))
%only show values in the ranges specified
xlim([round(min(m.X(:,1))) round(max(m.X(:,1)))])
ylim([round(min(m.X(:,2))) round(max(m.X(:,2)))])


%WORKS
%xticks(min(m.X(:,1)): 0.5 :max(m.X(:,1)))
%yticks(min(m.X(:,2)): 0.2 : max(m.X(:,2)))
%only show values in the ranges specified
%xlim([min(m.X(:,1)) max(m.X(:,1))])
%ylim([min(m.X(:,2)) max(m.X(:,2))])


    
end