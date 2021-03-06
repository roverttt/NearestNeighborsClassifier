function feat_search_forward(data)
 
current_set_of_features = [1:size(data,2)-1]; % Initialize an full set
best_accuracy_of_any_set = 0;
accuracy_of_level_before_this = 0;
best_set_of_features = [];

for i = 1 : size(data,2)-1 
    %disp(['On the ',num2str(i),'th level of the search tree'])
    feature_to_remove_at_this_level = 0;
    best_so_far_accuracy    = 0;    
    
     for k = 1 : size(data,2)-1 
       if ~isempty(intersect(current_set_of_features,k)) % Only consider removing, if not already removed.
        %disp(['--Considering adding the ', num2str(k),' feature'])
        
        % Converting a list to a printable string
        % https://www.mathworks.com/matlabcentral/answers/341189-how-to-automatically-sprintf-an-array-elements
        
        accuracy = 100*leave_one_out_cross_validation(data,current_set_of_features,k,false);
        current_set_of_features_new = current_set_of_features(current_set_of_features ~= k);
        stringToPrint1 = sprintf('%d,',[current_set_of_features_new]);
        stringToPrint1 = stringToPrint1(1:end-1);
        stringToPrint2 = sprintf('Using feature(s) {%s} accuracy is %s%%', stringToPrint1, num2str(accuracy,3));
        disp(stringToPrint2);
        if accuracy > best_so_far_accuracy 
            best_so_far_accuracy = accuracy;
            feature_to_remove_at_this_level = k;            
        end        
      end
     end
    
    % How to delete an element from a vector
    % https://www.mathworks.com/matlabcentral/answers/48938-delete-element-from-vector
    % If you want to get rid of all cases where a is exactly equal to 3
    % b = a(a~=3);
    
    current_set_of_features = current_set_of_features(current_set_of_features ~= feature_to_remove_at_this_level);
    stringToPrint3 = sprintf('%d,',[current_set_of_features]);
    stringToPrint3 = stringToPrint3(1:end-1);
    stringToPrint4 = sprintf('Feature set {%s} was best, accuracy is %s%%', stringToPrint3, num2str(best_so_far_accuracy,3));
    disp(stringToPrint4);
    if accuracy_of_level_before_this > best_so_far_accuracy
        disp(['(Warning, Accuracy has decreased! Continuing search in case of local maxima)']);
    end
    accuracy_of_level_before_this = best_so_far_accuracy;
    
    if best_so_far_accuracy > best_accuracy_of_any_set 
        best_accuracy_of_any_set = best_so_far_accuracy;
        best_set_of_features = current_set_of_features;
    end
    
end 

% How to format a string in matlab: https://www.mathworks.com/help/matlab/ref/disp.html

stringToPrint = sprintf('%d ', best_set_of_features);

stringToPrint = sprintf('Finished search!! The best feature subset is %s, which has an accuracy of %s%%', ...
    stringToPrint, num2str(best_accuracy_of_any_set,3));
disp(stringToPrint);

end

