close all;
clear;

%% Parametres
pas = 0.05;

%% Construction de la face laterale d'un cylindre
pts = [[0 ; -1 ; 0], [10 ; -1 ; 0]];
N = (@(t) Bezier(t, pts));
S = N;
O = (@(t) CercleX(t, [0, 0, 0], 1, false, 2*pi, 0));
E = (@(t) CercleX(t, [10, 0, 0], 1, false, 2*pi, 0));
aretes = {O,S,E,N};

% Affichage des aretes
for i=1:4
	x = [];
	y = [];
	z = [];
	for t=0:pas:1
		P = aretes{i}(t);
		x = [x, P(1)];
		y = [y, P(2)];
		z = [z, P(3)];
	end
	plot3(x, y, z, 'LineWidth', 2, 'Color', 'black');
	hold on;
end

pause();

% Appliquer le patch de Coons
x = [];
y = [];
z = [];
for t=0:pas:1
	for u=0:pas:1
		P = Coons(t, u, aretes(:));
		x = [x, P(1)];
		y = [y, P(2)];
		z = [z, P(3)];
	end
end
n = length(0:pas:1);
x = reshape(x, n, n);
y = reshape(y, n, n);
z = reshape(z, n, n);

% Afficher
surf(x, y, z);

pause();
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Construction de la face laterale d'un cylindre deforme
pts = [[0 ; -1 ; 0], [2 ; -1 ; 0], [6 ; 0 ; 0], [10 ; -1 ; 0]];
N = (@(t) Bezier(t, pts));
S = N;
O = (@(t) CercleX(t, [0, 0, 0], 1, false, 2*pi, 0));
E = (@(t) CercleX(t, [10, 0, 0], 1, false, 2*pi, 0));
aretes = {O,S,E,N};

% Affichage des aretes
for i=1:4
	x = [];
	y = [];
	z = [];
	for t=0:pas:1
		P = aretes{i}(t);
		x = [x, P(1)];
		y = [y, P(2)];
		z = [z, P(3)];
	end
	plot3(x, y, z, 'LineWidth', 2, 'Color', 'black');
	hold on;
end

pause();

% Appliquer le patch de Coons
x = [];
y = [];
z = [];
for t=0:pas:1
	for u=0:pas:1
		P = Coons(t, u, aretes(:));
		x = [x, P(1)];
		y = [y, P(2)];
		z = [z, P(3)];
	end
end
n = length(0:pas:1);
x = reshape(x, n, n);
y = reshape(y, n, n);
z = reshape(z, n, n);

% Afficher
surf(x, y, z);

pause();
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Construction de la face laterale d'un cylindre-cone
pts = [[0 ; -2 ; 0], [10 ; -1 ; 0]];
N = (@(t) Bezier(t, pts));
S = N;
O = (@(t) CercleX(t, [0, 0, 0], 2, false, 2*pi, 0));
E = (@(t) CercleX(t, [10, 0, 0], 1, false, 2*pi, 0));
aretes = {O,S,E,N};

% Affichage des aretes
for i=1:4
	x = [];
	y = [];
	z = [];
	for t=0:pas:1
		P = aretes{i}(t);
		x = [x, P(1)];
		y = [y, P(2)];
		z = [z, P(3)];
	end
	plot3(x, y, z, 'LineWidth', 2, 'Color', 'black');
	hold on;
end

pause();

% Appliquer le patch de Coons
x = [];
y = [];
z = [];
for t=0:pas:1
	for u=0:pas:1
		P = Coons(t, u, aretes(:));
		x = [x, P(1)];
		y = [y, P(2)];
		z = [z, P(3)];
	end
end
n = length(0:pas:1);
x = reshape(x, n, n);
y = reshape(y, n, n);
z = reshape(z, n, n);

% Afficher
surf(x, y, z);

pause();
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Construction d'un quart de tore
O = (@(t) CercleX(t, [0, -5, 0], 1, false, pi, 0));
E = (@(t) CercleX(t, [0, 5,  0], 1, true, pi, 0));
N = (@(t) CercleZ(t, [0, 0,  0], 6, false, pi, 0));
S = (@(t) CercleZ(t, [0, 0,  0], 4, false, pi, 0));

aretes = {O,S,E,N};

% Affichage des aretes
for i=1:4
	x = [];
	y = [];
	z = [];
	for t=0:pas:1
		P = aretes{i}(t);
		x = [x, P(1)];
		y = [y, P(2)];
		z = [z, P(3)];
	end
	plot3(x, y, z, 'LineWidth', 2, 'Color', 'black');
	hold on;
end

pause();

% Appliquer le patch de Coons
x = [];
y = [];
z = [];
for t=0:pas:1
	for u=0:pas:1
		P = Coons(t, u, aretes(:));
		x = [x, P(1)];
		y = [y, P(2)];
		z = [z, P(3)];
	end
end
n = length(0:pas:1);
x = reshape(x, n, n);
y = reshape(y, n, n);
z = reshape(z, n, n);

% Afficher
surf(x, y, z);

pause();
hold off;

%% Construction d'un tore
aretes = {};

O = (@(t) CercleX(t, [0, -5, 0], 1, false, pi, 0));
E = (@(t) CercleX(t, [0, 5,  0], 1, true, pi, 0));
N = (@(t) CercleZ(t, [0, 0,  0], 6, false, pi, 0));
S = (@(t) CercleZ(t, [0, 0,  0], 4, false, pi, 0));
aretes = [aretes; {O,S,E,N}];

O = (@(t) CercleX(t, [0, 5, 0], 1, true, pi, 0));
E = (@(t) CercleX(t, [0, -5,  0], 1, false, pi, 0));
N = (@(t) CercleZ(t, [0, 0,  0], 6, false, pi, pi));
S = (@(t) CercleZ(t, [0, 0,  0], 4, false, pi, pi));
aretes = [aretes; {O,S,E,N}];

O = (@(t) CercleX(t, [0, 5, 0], 1, true, pi, pi));
E = (@(t) CercleX(t, [0, -5,  0], 1, false, pi, pi));
N = (@(t) CercleZ(t, [0, 0,  0], 6, false, pi, 0));
S = (@(t) CercleZ(t, [0, 0,  0], 4, false, pi, 0));
aretes = [aretes; {O,S,E,N}];

O = (@(t) CercleX(t, [0, 5, 0], 1, false, pi, pi));
E = (@(t) CercleX(t, [0, -5,  0], 1, true, pi, pi));
N = (@(t) CercleZ(t, [0, 0,  0], 6, false, pi, pi));
S = (@(t) CercleZ(t, [0, 0,  0], 4, false, pi, pi));
aretes = [aretes; {O,S,E,N}];

% Affichage des aretes
for i=1:4
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

axis([-6, 6, -6, 6, -6, 6]);
pause();

% Appliquer le patch de Coons
for i=1:4
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

	% Afficher
	surf(x, y, z);
end
