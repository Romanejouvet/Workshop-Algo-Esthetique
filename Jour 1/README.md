# Workshop-Algo-Esthetique


Pour ce projet, je souhaitais représenter un brin d’ADN, car je trouve cette forme très esthétique et qu’elle colle très bien avec le thème art et sciences. 

Je suis donc partie dans l’idée de faire ce brin. Seulement, je n’ai pas réussi a représenter ce que je voulais et je me suis retrouvée avec la forme des brins latéraux. J’ai ces formes tres agréables a regarder, alors je les ai laissé, j’en ai fait deux avec dans l’idée de mettre mon brin d’ADN au milieu. 

J’ai donc au final ces trois brins, avec l’ADN au milieu et des sortes d’helices mas avec les points non reliés qui tournes sur les bords. L’animation repose uniquement sur des fonctions trigo sans 3D réelle mais avec une illusion de profondeur. 


Explication du code: 

Le principe général: le dessin se fait du haut vers le bas. A chaque position verticale y, on calcule un angle de rotation, et deux positions horizontales. La profondeur est simulée en faisant varier l’épaisseur des traits. 


La fonction draw_middle_helix(cx) dessine l’hélice centrale. Cx définit la position horizontale de l’hélice. Une boucle parcourt la hauteur de l’écran, et deux points sont calculés avec cos et sin. Les points successifs sont reliés, et l’épaisseur varie pour simuler la profondeur. 

La fonction draw_side_helix(cx, rev) dessine une hélice latérale.  Les sens de rotation sont inversés, mais c’est la meme logique sinon. 


Je me suis aidée d’internet au début pour voir comment était codée une hélice de base, et aussi lorsque j’avais des soucis que je ne parvenais pas a régler (principalement car au debut l’animation était statique, car l’angle ne dépendait que de y.)



Merci de votre lecture et a demain :)

