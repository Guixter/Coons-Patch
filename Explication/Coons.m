%% Construire une surface par les patches de Coons
% INPUTS :
%  - t, u : les parametres
%  - aretes : un cell array de 4 courbes parametriques : P1-P2-Q1-Q2.
%             Ces courbes doivent se croiser de maniere a former une face.
%
% OUTPUTS :
%  - P : le point de la surface correspondant aux parametres, de taille 3x1.
function P = Coons(t, u, aretes)
	% Obtenir les courbes
	O = aretes{1};
	S = aretes{2};
	E = aretes{3};
	N = aretes{4};
	
	% Obtenir les sommets
	N_O = O(0);
	S_O = O(1);
	N_E = E(0);
	S_E = E(1);
	
	% Calculer les coordonnees du point
	M1 = (1-u) * N(t) + u * S(t);
	M2 = (1-t) * O(u) + t * E(u);
	M3 = (1-t)*(1-u)*N_O + t*(1-u)*N_E + (1-t)*u*S_O + t*u*S_E;

	P = M1+M2-M3;
end
