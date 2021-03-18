function feat_search_forward(data)
 
current_set_of_features = []; % Initialize an empty set
best_accuracy_of_any_set = 0;
best_set_of_features = [];
for i = 1 : size(data,2)-1 
    disp(['On the ',num2str(i),'th level of the search tree'])
    feature_to_add_at_this_level = 0;
    best_so_far_accuracy    = 0;    
    
     for k = 1 : size(data,2)-1 
       if isempty(intersect(current_set_of_features,k)) % Only consider adding, if not already added.
        disp(['--Considering adding the ', num2str(k),' feature'])
        
        % Converting a list to a printable string
        % https://www.mathworks.com/matlabcentral/answers/341189-how-to-automatically-sprintf-an-array-elements
        
        accuracy = leave_one_out_cross_validation(data,current_set_of_features,k);
        stringToPrint1 = sprintf('%d ',[current_set_of_features, k]);
        stringToPrint2 = sprintf('accuracy of set: %s = %d', stringToPrint1, accuracy);
        disp(stringToPrint2);
        if accuracy > best_so_far_accuracy 
            best_so_far_accuracy = accuracy;
            feature_to_add_at_this_level = k;            
        end        
      end
     end
    
    current_set_of_features(i) =  feature_to_add_at_this_level;
    disp(['On level ', num2str(i),' i added feature ', num2str(feature_to_add_at_this_level), ' to current set'])
    disp(['Accuracy on this level = ', num2str(best_so_far_accuracy)]);
    
    if best_so_far_accuracy > best_accuracy_of_any_set 
        best_accuracy_of_any_set = best_so_far_accuracy;
        best_set_of_features = current_set_of_features;
    end
    
end 

% How to format a string in matlab: https://www.mathworks.com/help/matlab/ref/disp.html

stringToPrint = sprintf('%d ', best_set_of_features);
stringToPrint = sprintf('best accuracy found with set: %s with an accuracy of %d', ...
    stringToPrint, best_accuracy_of_any_set);
disp(stringToPrint);

end

