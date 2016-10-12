function P = Coons1(t, u, aretes)
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

	P = M1;
end
