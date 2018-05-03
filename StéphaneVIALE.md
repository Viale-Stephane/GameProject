* 21/12/2017 : j'ai créé le projet et les fichiers pour annoncer notre avancement dans notre projet. début d'apprentissage du java        graphics.

* 10/01/2018 : abandon du java comme langage et passage sur du processing,programmation du mouvement du personnage et recherche l'intégration de sprite pour le mouvement du personnage.

* 17/01/2018 : utilisation du processing pour coder une applet permettant de contrôler les hitbox des différents éléments du jeu.
* 24/01/2018 : programmation de l'interaction entre les murs/plafonds avec le personnage.

* 19/02/2018 : amelioration du système de saut et implémentation des différents sprites du personnage.
* 05/03/2018 : finition de l'applet de création de niveaux.

* 05/04/2018 : ça fait un mois mais j'ai pas rien fait j'ai juste oublié ce fichier xd,

`1. changement de l'applet :

``* possibilité de placer tous les blocs, les piques, et ce, dans tout les sens.``

``* ajout de la possibilité d'ajouter des bonus (bonusDoubleJump,bonusTP,bonusDash,bonusGravitySwap,BonusnoClip).``

``* bouton fonctionnant comme une gomme (affecte empty aux cases vides)``

``* choix de la position du hero sur le niveau.``

``* blocs de fin de niveau ayant de fonction, la première, comme son nom l'indique de passer à autre niveau, peu importe lequel. La seconde, si voulu de passer à travers un mur pour aller de l'autre côté (donc aller d'à gauche à et inversement instantanément sans passer par le milieu).``

``* possibilité de naviguer d'un niveau à l'autre directement dans l'éditeur.``

``* bouton pour réinitialiser un niveau.``

``* choix pour changer la couleur du background d'un niveau en RGB.``
`

`2. changement du jeu : 
``* amelioration du système de déplacement pour qu'il soit très lisse (encore quelques problèmes)``

``* changement de l'implémentation des sprites (maintenant s'implemente avec des .gif)``

``* animation de bonus intégrées``

``* programmations de trois bonus :
```* doubleJump(animations fonctionnelles)```

```* TP(problème d'animations)```

```* dash      (problème d'animations)```
``
                                    
``* programmation du changement de niveau fonctionnelle``

``* mort fonctionnelle``

``* changement d'animation en fonction du bonus fonctionnelle``

``* passage d'un côté à l'autre avec la case end fonctionnelle``

``* animations de tout les bonus``

``* positions de hitbox de tous les bonus``
`
                                 
                                 
 * 07/04/2018 : programmation du bonus gravitySwap, correction d'un bug empechant d'aller à droite au début d'un niveau ou après avoir pris un bonus
             
 * 15/04/2018 : installation d'unix sur la raspberry, branchement de l'écran et installation logicielle de processing
 
 * 18/04/2018 :
 
 `* correction d'un bug qui faisait que le jeu était trois fois plus lent sur raspberry que sur un ordinateur classique (problème de puissance de la raspberry, elle faisait trois fois moins vite des tours de boucles en gros).` 

`* Ajout sur l'applet de la porte de fin de niveau, du bonus Piece qui est un token ramassé (ou non) dans les niveaux dans le bus d'être comptabilisé dans le score pour avoir le plus de points possible.`
 
 `* Changement des couleurs sur l'applet pour que les cases de bonus soient associées aux bons bonus.`
 
* 19/04/2018 : Implémentation du bonusPoints dans le jeu

* 01/05/2018 : 
`* Branchement du joystick et des boutons sur la raspberry PI(+ fonctionnement logiciel de ces derniers pour le jeu)`

`* Amélioration du visuel du bonusGravitySwap (plus de reset à chaque tour de boucle quand on active le bonus et que l'on est à l'envers mais un reset seulement quand on passe du sol au plafond)`

`* Implémentation du fonctionnement de l'animation du bonusDash`

* 02/05/2018:

`* Programmation du fonctionnement de la musique pour le jeu `

`* Programmation sur l'éditeur du choix de la musique pour chaque niveaux `

`* Fin de l'amélioration de l'animation du bonusDash, animation inclue et collision de l'animation avec le mur`

* 03/05/2018:

`* Programmation d'une fonction permettant de rentrer un pseudo dans le jeu `
`* Implémentation des SFX "death", "Gswap", "jump", "powerup", "TP" `
*
