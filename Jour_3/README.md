Rendu Jour 3

Le thème d'aujourd'hui était les fractales. Je trouve ces formes très intéréssantes car se sont des modèles qu'on retrouve dans la nature et dont on se sert pour des modeles mathématiques poussés. De plus, je trouve des formes tres étranges/ psychadéliques voire hypnotisantes, et j'ai tout de suite fait le lien avec Radiohead, qui me procure les memes sensations et le meme ressenti (et aussi car j'adore ce groupe ahah). 

Je suis donc partie sur l'idée d'intégrer un visuel reactif de fractales qui reagit a une chanson, Everything in its right place (chanson que je trouve tres hypnotisnte, parfaite pour ce projet a mon gout).


Ce projet met en scene: un système de cercles fractals (ce n'est pas vraiment des fractales en fait) réagissant en temps réel à la musique,
un réseau de branches fractales (de vraies fractales cette fois) qui croît lentement depuis les coins de l’écran, avec une accumulation visuelle qui est progressive car rien n'est supprimé. L'ensemble est donc synchronisé avec la musique. 


Pour l'interraction avec la musique: 


Le son est analysé en temps réel grâce à une FFT, qui découpe le signal audio en différentes bandes de fréquences:
- Basses (20–140 Hz)
- Médiums (140–2500 Hz)
- Aigus (2500–10000 Hz)
Ainsi ces valeurs influencent directement le comportement visuel.



Pour les cercles : 
Ils générés autour du centre de l’écran sous forme de formes circulaires déformées.

Les féquences jouent les roles :
- Basses: contrôlent le nombre de cercles, et leur rayon max
- Médiums: contrôlent l’épaisseur du trait et rendent les cercles plus ou moins présents visuellement
- Aigus: contrôlent la déformation des cercles

Les cercles ne sont sont donc pas parfaitement réguliers,ils utilisent du bruit de Perlin, ce qui crée des formes plutot fluides et pas aléatoires. Ils ne s'arretent jamais , mais leur evolution devient de plus en plus subtile a mesure du temps, et donc cela forme un gros cercle de plus en plus lumineux, que j'apprecie beaucoup dans l'espect esthetique global de mon oeuvre. 


Pour les branches: 

Depuis les quatre coins de l’écran des branches apparaissent et se développent progressivement vers l’intérieur.


Le principe de chaque branche est qu'elle grandit progressivement et ralentit avec le temps (mais ne s’arrête jamais). Lorsqu'elle a atteint une certaine longueur, elle engendre des branches enfant. Par contre chaque branche n'engendre qu'une seule fois, et possède une profondeur (vers le centre).

Visuellement, les branches proches de la source sont épaisses et 
plus la profondeur augmente, plus les branches deviennent fines. Elles ne dependent pas du son.


Pour le bruit: 

De fines lignes blanches semi opaques apparaissent de manière espacée dans le temps. Elles ajoutent une texture visuelle qui colle tres bien avec la da globale, mais leur apparition est ralentie pour éviter une saturation visuelle.


Pour ce projet, je suis passée par pas mal d'étapes, j'ai tout de suite eu l'idée d'un visuel qui réagirait a Everything, mais j'ai eu du mal a concretiser mon plan de base qui etait de placer un modele fractal sur les montagnes de la pochette d'album, et apres plusieur essais desastreux, j'ai décidé de me ramener a ma premiere idée, qui etait de visualiser deux cercles de base representant un haut parleur d'une enceinte, avec des cercles (des ondes) qui reagiraient au bruit. Et j'ai ajouté a mon idée de base une identité visuelle propre qui me fait beaucup penser au style artistique de Radihead. J'ai adoré travailler sur ce projet car la combinaison de radiohead et des fracales etait vraiment super interessante et je suis vraiment fan de ce groupe donc ecouter la musique toute la journée etait un vrai bonheur :)


J'ai utilisé l'IA et des bouts de codes trouvés sur internet, notamment pour m'aider dans des parties ou je n'arrivais pas a bien coder, plutot sur la partie esthetique, du syle pour que les lignes s'affinent bien sur la profondeur, et aussi pour voir comment on codait tout ce qui est vraiment les parametres/systeme du systeme fractal. 


Pour l'utilisation: 
Il faut placer le fichier audio.mp3
Et profiter !



Merci de votre lecture ! 


