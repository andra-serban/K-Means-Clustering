% computes the NC centroids corresponding to the given points using K-Means
function centroids  = clustering_pc(points, NC)
  [n, m] = size(points);
  centroids = zeros(NC, 3);
  number_of_points = ones(NC, 1);
  coordonate_centroids = centroids;
  % incarc matricea centroids cu coordonate random din matricea points
  vector_random = randperm(n,NC);
  for i = 1 : NC
      centroids(i, :) = points(vector_random(i), :);
  endfor 
  while (true)
  % calculez distanta de la fiecare punct la fiecare centroid
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
        % adun coordonate punctelor aflate la distanta minima fata de controid
        coordonate_centroids(centroid, :) = coordonate_centroids(centroid, :) + points(i, :);
        number_of_points(centroid) = number_of_points(centroid) + 1;
      endfor
      for i = 1 : NC
        coordonate_centroids(i, :) = coordonate_centroids(i, :) / (number_of_points(i));
      endfor
      % verific daca se mai modifica cooronate centroizilor
      if (centroids == coordonate_centroids)
       break;
      else 
       centroids = coordonate_centroids;
       number_of_points = ones(NC, 1);
      endif
    endwhile    
endfunction
