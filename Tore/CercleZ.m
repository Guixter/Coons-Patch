%% Courbe parametrique d'un cercle "parallele" au plan z=0
% INPUTS :
%  - t : le parametre de la courbe
%  - centre : le centre du cercle
%  - rayon : rayon du cercle
%  - sens_inverse : sens de parcours inverse ou non (booleen)
%  - angle : l'angle de la rotation
%  - dep : l'angle de depart de la rotation
%
% OUTPUTS :
%  - P : P : le point resultant de l'algorithme de De Casteljau, de taille 3x1.
function P = CercleZ(t, centre, rayon, sens_inverse, angle, dep)
	if (sens_inverse)
		theta = dep + angle*(1-t);
	else
		theta = dep + angle*t;
	end
	
	P = zeros(3, 1);
	P(1) = centre(1) + rayon*sin(theta);
	P(2) = centre(2) - rayon*cos(theta);
	P(3) = centre(3);
end
