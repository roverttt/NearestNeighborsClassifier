function accuracy= leave_one_out_cross_validation(data,current_set,feature_to_add)

current_set = [current_set, feature_to_add];
if ~isempty(current_set)
    for j = 2 : size(data,2)            %for each column in data after the class column
       for l = 1 : length(current_set)      %for each column number in current set
           if j ~= current_set(l) + 1           %if data column num != current set column num
                data(:,j) = 0;                      %set column values to 0
           end
       end
    end
end

number_correctly_classfied = 0;

 for i = 1 : size(data,1)
    object_to_classify = data(i,2:end); 
    label_object_to_classify = data(i,1);
    
    nearest_neighbor_distance = inf;
    nearest_neighbor_location = inf;
    for k = 1 : size(data,1)
        if k ~= i
             distance = sqrt(sum((object_to_classify - data(k,2:end)).^2));
             if  distance <   nearest_neighbor_distance
                    nearest_neighbor_distance = distance;
                    nearest_neighbor_location = k;
                    nearest_neighbor_label    = data(nearest_neighbor_location,1);
             end
        end        
    end 
            
    if label_object_to_classify == nearest_neighbor_label% ; 
         number_correctly_classfied = number_correctly_classfied + 1;
    end
    
 end 
 accuracy = number_correctly_classfied / size(data,1);
end