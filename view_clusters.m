% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
  % pentru reprezentare folosesc un vector de culori
  colors = 'rgbcmyk';
  [n, m] = size(points);
  [NC, m1] = size(centroids); 
  for i = 1 : n
    distmin = -1;
    centroid = -1;
    for j = 1 : NC
      dist = norm(points(i, :) - centroids(j, :));
       if (distmin == -1 && centroid == -1)
          distmin = dist;
          centroid = j;
       elseif (dist < distmin)
          distmin = dist;
          centroid = j;
       endif
     endfor
     % dupa ce am aflat distanta minima fata de centroizi, reprezint punctul
     scatter3(points(i, 1), points(i, 2), points(i, 3), colors(centroid), 'filled');
     hold on;
    endfor
endfunction

