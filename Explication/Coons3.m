function P = Coons3(t, u, aretes)
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
	M3 = (1-t)*(1-u)*N_O + t*(1-u)*N_E + (1-t)*u*S_O + t*u*S_E;
	P = M3;
end
