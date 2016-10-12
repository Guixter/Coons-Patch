%% Algorithme de De Casteljau pour une courbe de Bezier parametrique
% INPUTS :
%  - t : le parametre
%  - pts : le polygone de controle, de taille 3xn
%
% OUTPUTS :
%  - P : le point resultant de l'algorithme de De Casteljau, de taille 3x1.
function P = Bezier(t, pts)
	n = size(pts, 2);

	while (n > 1)
		% Calculer la couche de points suivante
		for i=1:n-1
			pts(:, i) = (1-t) * pts(:, i) + t * pts(:, i+1);
		end
		n = n - 1;
	end

	P = pts(:, 1);
end
