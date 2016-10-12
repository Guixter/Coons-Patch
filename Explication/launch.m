close all;
clear;

%% Parametres
pas = 0.05;

%% Construire les courbes
sommets = [[0;0;1], [0.5;0;3], [0.7;0;2], [1;0;1]];
O = (@(t) Bezier(t, sommets));
sommets = [[1;0;1], [1;0.7;2], [1.3;0.5;2], [1;1;3]];
S = (@(t) Bezier(t, sommets));
sommets = [[0;1;2], [0.3;1;4], [0.7;1;2], [1;1;3]];
E = (@(t) Bezier(t, sommets));
sommets = [[0;0;1], [0;0.5;0], [0.3;0.7;1], [0;1;2]];
N = (@(t) Bezier(t, sommets));

aretes = {O,S,E,N};

% Afficher les aretes
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

%% Afficher la 1ère surface
x = [];
y = [];
z = [];
for t=0:pas:1
	for u=0:pas:1
		P = Coons1(t, u, aretes);
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

pause();
hold off;

% Afficher les aretes
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

%% Afficher la 2ème surface
x = [];
y = [];
z = [];
for t=0:pas:1
	for u=0:pas:1
		P = Coons2(t, u, aretes);
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

pause();
hold off;

% Afficher les aretes
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

%% Afficher la 3ème surface
x = [];
y = [];
z = [];
for t=0:pas:1
	for u=0:pas:1
		P = Coons3(t, u, aretes);
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

pause();
hold off;

% Afficher les aretes
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

%% Afficher le patch de Coons
x = [];
y = [];
z = [];
for t=0:pas:1
	for u=0:pas:1
		P = Coons(t, u, aretes);
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
