function main_nn()

data = load('CS170_SMALLtestdata__78.txt');

% Removing a column source: https://www.mathworks.com/help/matlab/math/removing-rows-or-columns-from-a-matrix.html

% add a column source: https://www.mathworks.com/matlabcentral/answers/26796-how-do-i-add-a-column-to-a-matrix

% how to normalize data https://www.mathworks.com/help/matlab/ref/double.normalize.html

data_for_normalization = data(:,2:end);
data_class_column = data(:,1);
normalized_data = normalize(data_for_normalization,1);

%Add new column
%Arr = [Arr NewCol];

data_to_pass_in = [data_class_column normalized_data];
feat_search_forward(data_to_pass_in);

end

