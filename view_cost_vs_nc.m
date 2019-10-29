function view_cost_vs_nc(file_points)
  points = dlmread(file_points, ' ', 5, 0);
  x = [];
  y = [];
  for NC = 1 : 10
   centroids = clustering_pc(points, NC);
   cost = compute_cost_pc(points, centroids);
   x = [x, NC];
   y = [y, cost];
  endfor
  plot(x, y)
end

