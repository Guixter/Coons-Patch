close all;
clear;

%% Parametres
pas = 0.05;
taille = 10;
arrondi = input('Coefficient d''arrondissement : ');

%% Choix des sommets du cube
N_O_1 = [0 ; 0 ; 0] * taille;
N_E_1 = [0 ; 1 ; 0] * taille;
S_E_1 = [1 ; 1 ; 0] * taille;
S_O_1 = [1 ; 0 ; 0] * taille;

N_O_2 = [0 ; 0 ; 1] * taille;
N_E_2 = [0 ; 1 ; 1] * taille;
S_E_2 = [1 ; 1 ; 1] * taille;
S_O_2 = [1 ; 0 ; 1] * taille;

%% Construction des sommets (ordonnés), pour chaque face
sommets = zeros(3, 4, 6);
sommets(:, :, 1) = [N_O_1, S_O_1, N_E_1, S_E_1];
sommets(:, :, 2) = [N_O_2, S_O_2, N_E_2, S_E_2];
sommets(:, :, 3) = [S_E_2, S_E_1, N_E_2, N_E_1];
sommets(:, :, 4) = [N_O_2, N_O_1, S_O_2, S_O_1];
sommets(:, :, 5) = [S_O_2, S_O_1, S_E_2, S_E_1];
sommets(:, :, 6) = [N_O_2, N_O_1, N_E_2, N_E_1];

sommets_opposes = zeros(3, 4, 6);
sommets_opposes(:, :, 1) = [N_O_2, S_O_2, N_E_2, S_E_2];
sommets_opposes(:, :, 2) = [N_O_1, S_O_1, N_E_1, S_E_1];
sommets_opposes(:, :, 3) = [S_O_2, S_O_1, N_O_2, N_O_1];
sommets_opposes(:, :, 4) = [N_E_2, N_E_1, S_E_2, S_E_1];
sommets_opposes(:, :, 5) = [N_O_2, N_O_1, N_E_2, N_E_1];
sommets_opposes(:, :, 6) = [S_O_2, S_O_1, S_E_2, S_E_1];

%% Construction des aretes
aretes = {};
for i=1:6
	cell_aux = Face(sommets(:, :, i), sommets_opposes(:, :, i), arrondi);
	aretes = [aretes ; cell_aux];
end

%% Affichage des aretes
for i=1:6
	for j=1:4
		x = [];
		y = [];
		z = [];
		for t=0:pas:1
			P = aretes{i, j}(t);
			x = [x, P(1)];
			y = [y, P(2)];
			z = [z, P(3)];
		end
		plot3(x, y, z, 'LineWidth', 2, 'Color', 'black');
		hold on;
	end
end

axis([-5, 15, -5, 15, -5, 15]);
pause();

%% Appliquer le patch de Coons
for i=1:6
	x = [];
	y = [];
	z = [];
	for t=0:pas:1
		for u=0:pas:1
			P = Coons(t, u, aretes(i, :));
			x = [x, P(1)];
			y = [y, P(2)];
			z = [z, P(3)];
		end
	end
	n = length(0:pas:1);
	x = reshape(x, n, n);
	y = reshape(y, n, n);
	z = reshape(z, n, n);

	%% Afficher
	surf(x, y, z);
end
