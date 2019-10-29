% reads cluster count and points from input files 
function [NC points] = read_input_data(file_params, file_points)
  NC = load(file_params);
  points = dlmread(file_points, ' ', 5, 0);
endfunction

