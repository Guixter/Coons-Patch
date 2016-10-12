%% Construire une face d'un cube arrondi
% INPUTS :
%  - sommets : matrice 3*4 representant les sommets de la face
%  - sommets_opposes : matrice 3*4 representant les sommets de la face opposee
%  - arrondi : un coefficient d'arrondissement
%
% OUTPUTS :
%  - aretes : un cell array de taille 1*4 representant chaque arete de la face
function aretes = Face(sommets, sommets_opposes, arrondi)
    % Recuperation des sommets
    N_O = sommets(:, 1);
    S_O = sommets(:, 2);
    N_E = sommets(:, 3);
    S_E = sommets(:, 4);
    
    % Recuperation des sommets opposes
    N_O_opp = sommets_opposes(:, 1);
    S_O_opp = sommets_opposes(:, 2);
    N_E_opp = sommets_opposes(:, 3);
    S_E_opp = sommets_opposes(:, 4);
    
    % Ajout de barycentres, pour arrondir les aretes
    c1 = 1.6;
    c2 = - 0.5 * arrondi;
    c = 0.5 / (c1+c2);
    barycentre_O = c*(c1*N_O + c1*S_O + c2*N_E_opp + c2*S_E_opp);
    barycentre_S = c*(c1*S_O + c1*S_E + c2*N_O_opp + c2*N_E_opp);
    barycentre_E = c*(c1*S_E + c1*N_E + c2*N_O_opp + c2*S_O_opp);
    barycentre_N = c*(c1*N_O + c1*N_E + c2*S_E_opp + c2*S_O_opp);

    % Construction des courbes
    points_arete = [N_O, barycentre_O, S_O];
    O = (@(t) Bezier(t, points_arete));
    points_arete = [S_O, barycentre_S, S_E];
    S = (@(t) Bezier(t, points_arete));
    points_arete = [N_E, barycentre_E, S_E];
    E = (@(t) Bezier(t, points_arete));
    points_arete = [N_O, barycentre_N, N_E];
    N = (@(t) Bezier(t, points_arete));

    % Contruction des aretes de la face
    aretes = {O, S, E, N};
end
