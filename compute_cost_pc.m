% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	 cost = 0; 
   [n, m] = size(points);
   [NC, m1] = size(centroids);
   for i = 1 : n
       distmin = -1;
       for j = 1 : NC
           dist = norm(points(i, :) - centroids(j, :));
           if (distmin == -1)
              distmin = dist;
          elseif (dist < distmin)
              distmin = dist;
          endif
        endfor
        cost = cost + distmin;
   endfor
endfunction

