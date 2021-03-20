function main_nn()

% Removing a column source: https://www.mathworks.com/help/matlab/math/removing-rows-or-columns-from-a-matrix.html

% add a column source: https://www.mathworks.com/matlabcentral/answers/26796-how-do-i-add-a-column-to-a-matrix

% how to normalize data https://www.mathworks.com/help/matlab/ref/double.normalize.html


disp(['Welcome to Trevor Cappons Feature Selection Algorithm.']);
disp(['Type in the name of the file to test :']);
inputfilename = input('','s');
data = load(inputfilename);

data_for_normalization = data(:,2:end);

disp(['Type the number of the algorithm you want to run.']);
disp(['     1) Forward Selection']);
disp(['     2) Backward Elimination']);

% How to get input from the user
% https://www.mathworks.com/help/matlab/ref/input.html

% input a number
% x = input(prompt)
% input a string
% str = input(prompt,'s')
usr_input = input('');

string1 = sprintf('This dataset has %d features (not including the class attribute), with %d instances.', ...
    size(data,2)-1, size(data,1));

disp(string1);
disp(['Please wait while I normalize the data…']);
data_class_column = data(:,1);
normalized_data = normalize(data_for_normalization,1);
disp(['Done!'])
data_to_pass_in = [data_class_column normalized_data];
if(usr_input == 1)
    feat_search_forward(data_to_pass_in);
elseif(usr_input == 2)
    feat_search_backward_elim(data_to_pass_in);
end
%Add new column
%Arr = [Arr NewCol];

end

