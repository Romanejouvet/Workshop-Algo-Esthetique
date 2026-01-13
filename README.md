# Workshop-Algo-Esthetique
Rendu Jour 2:


Projet de groupe avec Alexandre Bonnet, Alexandre Grosdidier, Lain , Romane Jouvet


Pour ce projet, l’objectif était d’explorer le concept des automates cellulaires à travers une interprétation libre.
Nous avons tout de suite accroché a l'idée de faire un projet musical, car nous somme tous les 4 de grands fan de musique !
On a donc combiné une génération sonore avec une visualisation graphique réactive. 


Principe général

L’application est divisée en deux parties :

D'un coté une interface musicale, avec: une séléction de notes (12 demi-tons), un bouton START/STOP,un automate cellulaire 1D appliqué aux notes, et une génération sonore. 

De l'autre coté une visualisation du type GAme of life, un automate cellulaire 2D, un affichage animé. 


Les deux automates sont interconnectés, ainsi les notes générées influencent directement le comportement et l’apparence de l’automate visuel.





Principes des automates cellulaires:

Pour l'automate musical (1D)

Chaque cellule représente une note (12 notes au total). À chaque pas de temps (défini par le BPM), des règles sont appliquées :
interaction avec les voisins gauche/droite, apparition/disparition de notes, limitation du nombre de notes actives, génération d’accords ou de notes seules.
Les notes actives sont jouées via SoundCipher.


Pour l'automatre visuel (2D)


On a des grille de cellules vivantes / mortes, avec des règles classiques (naissance, survie, mort). Les notes actives créent des lignes vivantes dans la grille.




Pour l'organisation du code: 

Sketch principal:
- Initialisation de la fenêtre
- Gestion du draw() et des interactions souris
- Lien entre interface musicale et Game of Life


GameOfLife: 
- Automate cellulaire 2D
- Logique de mise à jour
- Affichage graphique
- Réaction aux notes musicales


NoteGrid: 
- Gestion du son avec SoundCipher
- Lecture de notes et d’accords
- Règles de l’automate musical


MusicUI:
- Interface utilisateur
- Bouton START / STOP
- Gestion du BPM
- Interaction souris


Nous avons utilisé l'IA pour nous aider à régler quelques soucis, notamment quand on devait mettre en commun tous nos codes mais qu'il y avait des soucis d'exécution. ALexandre Grosdidier s'est occupé majoritairement de la partie graphique, et nous trois de celle musicale, meme si a la fin on a tous touché a tout pour finir le projet dans les temps et pour obtenir un rendu pas trop mal!


Soucis rencontrés: on a eu des petits soucis notamment au niveau de l'esthetique musicale, en effet on voulait que les notes jouées gardent un minimum de cohérence musicale (que ca sonne bien un minimum) et on a eu beaucoup de soucis pour garder une certaine cohérence tout en gardant un code fonctionnel, mais on a quand meme reussi a la fin a avoir quelque chose de pas trop mal (avec l'utilisation de quintes et de tierces et de septièmes), meme si ca ne sonne pas top a l'oreille ahah 



Pour lancer le projet: 

Il faut installer la bibliothèque SoundCipher ! Puis ouvrir le dossier du projet dans Processing et sélectionner des notes avant de START pour commencer. 


Merci de votre lecture ! 