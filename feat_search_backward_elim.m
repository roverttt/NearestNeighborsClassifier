function feat_search_backward_elim(data)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    size_data = size(data,2);
    current_set_of_features = [1:size_data];
    for i = 1 : size(data,2)-1
        disp(['On the ',num2str(i), 'th level of the search tree'])
        feature_to_remove_at_this_level = [];
        best_so_far_accuracy = 0;
        for k = 1 : size(data,2)-1
            %if isempty(intersect(current_set_of_features,k))
            disp(['--Considering adding the ', num2str(k),' feature'])
            accuracy = leave_one_out_cross_validation(data,current_set_of_features,k+1);
            if accuracy > best_so_far_accuracy;
                best_so_far_accuracy = accuracy;
                feature_to_remove_at_this_level = k;
            end
            
        end
        disp(['On level ', num2str(i), ' i added feature ', num2str(feature_to_add_at_this_level), ' to current set'])
        
    end

end


