class Hero {
  protected int heroPos1, heroPos2, heroPos3, heroPos4, heroPos5, heroPos6, heroPos7, heroPos8, heroPos9, heroPos10, heroPos11, heroPos12, heroPos13, heroPos14, heroPos15, heroPos16, heroPos17, heroPos18;
  protected float x, y, previousX=0, previousY=0, actualX, actualY;
  public float vitX=8, vitY=2, mvt=0;
  public int nbMort=0;
  private int i=0, j=0, nbMontee=0, nbDescente=0, timeDeath, timeAnimP1, timeAnimP2, nbDashAnim=0;
  public boolean saut=false, jumping=false, droite=false, gauche=false, reset=true, firstChute=true, VIE=true, VIEHasBeenFalse=false, TPActivationP1=false, TPActivationP2=false, DashActivation=false;
  public char lastMove='A';


  public void resetDessin() {//fonction permettant de réactualiser la position du hero

    for (int i=0; i<128*38; i++) {
      if (hitboxLvl[levelNumber][i].endsWith("hero")) { 
        heroPos1=i;//en bas à droite
        heroPos2=i-1;
        heroPos3=i-2;
        heroPos4=i-3;
        heroPos5=i-4;
        heroPos6=i-5;
        heroPos7=i-128;
        heroPos8=i-129;
        heroPos9=i-130;
        heroPos10=i-131;
        heroPos11=i-132;
        heroPos12=i-133;
        heroPos13=i-256;
        heroPos14=i-257;
        heroPos15=i-258;
        heroPos16=i-259;
        heroPos17=i-260;
        heroPos18=i-261;//en haut à gauche
        x=(heroPos18%128)*8;
        y=(heroPos18/128)*16;
        previousX=x;
        previousY=y;
      }
    }
  }

  public void dessin() {//fonction dessinant le personnage
    if (reset==true) {
      resetDessin();
      reset=false;
    }
    //rect((heroPos1%128)*8, (heroPos1/128)*16, 8, 16);
    animation();//appelle la fonction où toutes les animations possible du personnage sont détaillées en fonction de son bonus, son orientation,s'il bouge ou non, s'il saute etc..
  }

  public void animation() {
    if (VIEHasBeenFalse==false) {//si jamais le hero est en vie / vient de revenir à la vie
      if (keyPressed==true && (key==DROITE ||lastMove==DROITE) && jumping==false) {//si on appuie sur la touche droite et que l'on ne saute pas
        if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {//si le bonus est le double saut
          image(heroGreenR, x, y);//met l'image du hero quand il a le bonus de double saut
        } else if (bonusNoClip.noClip==true) {//bonus non existant
          image(heroBlackR, x, y);
        } else if (bonusTP.bonusTP==true && bonusTP.trigTP==false && TPActivationP1==false && TPActivationP2==false) {//si le bonus est le tp et qu'il n'est pas activé
          image(heroPurpleR, x, y);//met l'image du hero quand il a le bonus du tp
        } else if (TPActivationP1==true ||TPActivationP2==true) {// ne met pas d'image quand on active le tp
        } else if (bonusDash.dash==true && bonusDash.trigDash==false && DashActivation==false) {//si le bonus est le dash et qu'il n'est pas activé
          image(heroRedR, x, y);//met l'image du hero quand il a le bonus de dash
        } else if (DashActivation==true) {//ne met pas d'image quand on active le dash
        } else if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==false) {//si le bonus est l'inversion de gravité et qu'il n'est pas activé
          image(heroVeridianR, x, y);//met l'image du hero quand il a le bonus d'inversion de gravité non activé
        } else if (bonusGravitySwap.trigGSwap==true) {//si le bonus d'inversion de gravité est activé
          image(heroGSwapR, x, y);//met l'image du hero quand il a le bonus d'inversion de gravité activé
        } else {
          image(heroBlueR, x, y);//sinon met l'image du hero quand il se déplace sur la droite et n'a rien de particulier
        }
      } else if (keyPressed==true && (key==GAUCHE || lastMove==GAUCHE) && jumping==false) {//si on appuie sur la touche de gauche et que l'on ne saute pas même principe qu'au dessus mais à gauche
        if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
          image(heroGreenL, x, y);
        } else if (bonusNoClip.noClip==true) {
          image(heroBlackL, x, y);
        } else if (bonusTP.bonusTP==true && TPActivationP1==false && TPActivationP2==false) {
          image(heroPurpleL, x, y);
        } else if (TPActivationP1==true ||TPActivationP2==true) {
        } else if (bonusDash.dash==true && bonusDash.trigDash==false && DashActivation==false) {
          image(heroRedL, x, y);
        } else if (DashActivation==true) {
        } else if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==false) {
          image(heroVeridianL, x, y);
        } else if (bonusGravitySwap.trigGSwap==true) {
          image(heroGSwapL, x, y);
        } else {
          image(heroBlueL, x, y);
        }
      } else if (lastMove==GAUCHE && jumping==false) {//si le dernier mouvement est à gauche, et que l'on appuie pas à gauche, toutes les prochaines opérations sont des images idle sur la gauche
        if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {//si on a le bonus de double saut
          image(heroIdleGreenL, x, y);//affiche l'image du hero quand il a le bonus de double saut
        } else if (bonusNoClip.noClip==true) {//bonus non fonctionnel
          image(heroIdleBlackL, x, y);
        } else if (bonusTP.bonusTP==true && TPActivationP1==false && TPActivationP2==false) {//si on a le bonus de tp sans qu'il soit activé
          image(heroIdlePurpleL, x, y);//met l'image du hero quand il a le bonus de tp
        } else if (TPActivationP1==true || TPActivationP2==true) {//si on a le bonus de tp activé ne fait rien
        } else if (bonusDash.dash==true && bonusDash.trigDash==false && DashActivation==false) {//si on a le bonus de dash sans qu'il soit activé
          image(heroIdleRedL, x, y);//met l'image du hero quand il a le bonus de dash
        } else if (DashActivation==true) {//si on a le bonus de dash activé, ne fait rien
        } else if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==false) {//si on a le bonus d'inversion de gravité qui n'est pas activé
          image(heroIdleVeridianL, x, y);//met l'image du hero quand il le bonus d'inversion de gravité non activé
        } else if (bonusGravitySwap.trigGSwap==true) {//si le bonus d'inversion de gravité est activé
          image(heroIdleGSwapL, x, y);//met l'image du hero quand il a le bonus d'inversion de gravité activé
        } else {
          image(heroIdleBlueL, x, y);// sinon met l'image du hero quand il n'a aucun bonus
        }
      } else if ( jumping==false || (jumping==false && lastMove=='A')) { // de même quand on a pas encore bougé/ quand on bouge sur la droite
        if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
          image(heroIdleGreenR, x, y);
        } else if (bonusNoClip.noClip==true) {
          image(heroIdleBlackR, x, y);
        } else if (bonusTP.bonusTP==true && TPActivationP1==false && TPActivationP2==false) {
          image(heroIdlePurpleR, x, y);
        } else if (TPActivationP1==true ||TPActivationP2==true) {
        } else if (bonusDash.dash==true && bonusDash.trigDash==false && DashActivation==false) {
          image(heroIdleRedR, x, y);
        } else if (DashActivation==true) {
        } else if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==false) {
          image(heroIdleVeridianR, x, y);
        } else if (bonusGravitySwap.trigGSwap==true) {
          image(heroIdleGSwapR, x, y);
        } else {
          image(heroIdleBlueR, x, y);
        }
      } 
      if (key==DROITE ||lastMove==DROITE) {//si on appuie sur la droite, ou que l'on a appuyé sur la droite
        if (TPActivationP1==true) {//et que le tp a été activé
          image(heroTPR1, actualX, actualY);//met l'animation de la première partie du tp
        } else if (TPActivationP2==true) {
          image(heroTPR2, x, y);//met l'animation de la seconde partie du tp
        }
        if (DashActivation==true) {//si le dash a été activé
          image(heroDashR, x, y);//met l'animation du dash
        }
      } else if (key==GAUCHE ||lastMove==GAUCHE) {//si on appuie sur la gauche, ou que l'on a appuyé sur la gauche
        if (TPActivationP1==true) {//et que le tp a été activé
          image(heroTPL1, actualX, actualY);//met l'animation de la première partie du tp
        } else if (TPActivationP2==true) {
          image(heroTPL2, x, y);//met l'animation de la seconde partie du tp
        } else if (DashActivation==true) {//si le dash a été activé
          image(heroDashL, x, y);//met l'animation du dash
        }
      }
      if ((jumping==true && lastMove==DROITE)||( lastMove=='A' && jumping==true)) {//si on saute vers la droite, ou que l'on saute sans avoir fait de mouvement(gauche ou droite) depuis le début du niveau
        if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
          image(heroJumpGreenR, x, y);
        } else if (bonusNoClip.noClip==true) {
          image(heroJumpBlackR, x, y);
        } else if (bonusTP.bonusTP==true && TPActivationP1==false && TPActivationP2==false) {
          image(heroJumpPurpleR, x, y);
        } else if (TPActivationP1==true ||TPActivationP2==true) {
        } else if (bonusDash.dash==true && DashActivation==false) {
          image(heroJumpRedR, x, y);
        } else if (DashActivation==true) {
        } else if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==false) {
          image(heroJumpVeridianR, x, y);
        } else if (bonusGravitySwap.trigGSwap==true) {
          image(heroJumpGSwapR, x, y);
        } else {
          image(heroJumpBlueR, x, y);
        }
      }
      if (jumping==true && lastMove==GAUCHE) {//si on saute vers la gauche
        if (bonusDoubleJump.doubleJump==true || bonusDoubleJump.doubleJumpOn==true) {
          image(heroJumpGreenL, x, y);
        } else if (bonusNoClip.noClip==true) {
          image(heroJumpBlackL, x, y);
        } else if (bonusTP.bonusTP==true && TPActivationP1==false && TPActivationP2==false) {
          image(heroJumpPurpleL, x, y);
        } else if (TPActivationP1==true ||TPActivationP2==true) {
        } else if (bonusDash.dash==true && DashActivation==false) {
          image(heroJumpRedL, x, y);
        } else if (DashActivation==true) {
        } else if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==false) {
          image(heroJumpVeridianL, x, y);
        } else if (bonusGravitySwap.trigGSwap==true) {
          image(heroJumpGSwapL, x, y);
        } else {
          image(heroJumpBlueL, x, y);
        }
      }
    } else {//sinon on est mort met l'image de mort en fonction du bonus
      if (bonusDoubleJump.doubleJump==true ||bonusDoubleJump.doubleJumpOn==true) {
        image(heroDeadGreen, actualX, actualY);
      } else if (bonusNoClip.noClip==true) {
        image(heroDeadBlack, actualX, actualY);
      } else if (bonusTP.bonusTP==true) {
        image(heroDeadPurple, actualX, actualY);
      } else if (bonusDash.dash==true) {
        image(heroDeadRed, actualX, actualY);
      } else if (bonusGravitySwap.GSwap==true) {
        image(heroDeadVeridian, actualX, actualY);
      } else {
        image(heroDeadBlue, actualX, actualY);
      }
    }
  }


  public void mvtGauche() {//déplace d'une case vers la gauche dans la matrice du niveau
    try {//si il n'y a pas de mur à gauche
      if (((!hitboxLvl[levelNumber][hero.heroPos6-1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos12-1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos18-1].startsWith("wall"))||(bonusNoClip.trigNoClip==true &&(hitboxLvl[levelNumber][hero.heroPos18-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos17-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos16-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos15-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos14-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos13-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos12-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos11-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos10-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos9-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos8-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos6-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos5-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos4-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos3-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos2-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos1-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7-1].startsWith("wallNoClip"))))) {
        if (hero.gauche==true && x>previousX-8) {//mvt d'une case
          x-=vitX;
          hero.heroHitboxGauche(1);
          hero.lastMove=GAUCHE;
          hero.previousX=hero.x;
        }
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {//récupère les exceptions pour ne pas avoir de problème d'essayer de lire une valeur d'un tableau dont la clef est plus grande que la length du tableau
      ArrayIndexException();
    }
  }

  public void mvtDroite() {//déplace d'une case vers la droite dans la matrice du niveau
    try {//si il n'y a pas de mur à droite
      if ( ((!hitboxLvl[levelNumber][hero.heroPos1+1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos13+1].startsWith("wall"))||(bonusNoClip.trigNoClip==true &&(hitboxLvl[levelNumber][hero.heroPos18+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos17+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos16+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos15+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos14+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos13+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos12+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos11+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos10+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos9+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos8+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos6+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos5+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos4+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos3+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos2+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos1+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wallNoClip"))))) {
        if (hero.droite==true && x<previousX+8) {//mvt d'une case
          x+=vitX;
          hero.heroHitboxDroite(1);
          hero.lastMove=DROITE;
          hero.previousX=hero.x;
        }
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {//récupère les exceptions pour ne pas avoir de problème d'essayer de lire une valeur d'un tableau dont la clef est plus grande que la length du tableau
      ArrayIndexException();
    }
  }

  public void heroHitbox() {//place la hitbox du hero sur la matrice
    if (hitboxLvl[levelNumber][heroPos1]=="end"+str(levelNumber)) {//si la case où l'on va placer une case du hero est une case end
      hitboxLvl[levelNumber][hero.heroPos1]="end"+str(levelNumber);//on laisse la case end (notamment pour les cases end qui mène de la droite à la gauche du niveau)
    } else if (hitboxLvl[levelNumber][heroPos1].startsWith("wallNoClip")) {//bonus non fonctionnel
      hitboxLvl[levelNumber][heroPos1]="wallNoCliphero";
    } else {//sinon place une case hero à cette place
      hitboxLvl[levelNumber][hero.heroPos1]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos2]=="end"+str(levelNumber)) {// de même pour les 17 autres cases
      hitboxLvl[levelNumber][hero.heroPos2]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos2].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos2]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos3]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos3]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos3].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos3]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos4]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos4]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos4].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos4]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos5]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos5]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos5].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos5]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos6]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos6]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos6].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos5]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos6]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos7]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos7]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos7].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos7]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos7]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos8]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos8]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos8].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos8]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos8]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos9]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos9]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos9].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos9]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos9]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos10]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos10]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos10].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos10]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos10]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos11]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos11]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos11].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos11]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos11]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos12]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos12]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos12].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos12]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos12]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos13]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos13]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos13].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][hero.heroPos13]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos13]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos14]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos14]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos14].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos14]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos14]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos15]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos15]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos15].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos15]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos15]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos16]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos16]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos16].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos16]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos16]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos17]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos17]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos17].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos17]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos17]="hero";
    }
    if (hitboxLvl[levelNumber][hero.heroPos18]=="end"+str(levelNumber)) {
      hitboxLvl[levelNumber][hero.heroPos18]="end"+str(levelNumber);
    } else if (hitboxLvl[levelNumber][heroPos18].startsWith("wallNoClip")) {
      hitboxLvl[levelNumber][heroPos18]="wallNoCliphero";
    } else {
      hitboxLvl[levelNumber][hero.heroPos18]="hero";
    }
  }
  //-------------------------début-fonction-du-bonusNoClip-non-fonctionnel--------------------------------------------------------------------------------------------//
  public void wallNoClipheroDelete() {
    for (int i=1; i<128*38-1; i++) {
      if (hitboxLvl[levelNumber][i].equals("wallNoCliphero") && (!hitboxLvl[levelNumber][i+1].equals("wallNoCliphero") || !hitboxLvl[levelNumber][i+1].equals("hero") || !hitboxLvl[levelNumber][i-1].equals("wallNoCliphero") || !hitboxLvl[levelNumber][i-1].equals("hero"))) {
        hitboxLvl[levelNumber][i]="wallNoClip";
      }
    }
  }
  //-----------------------------fin-fonction-du-bonusNoClip-non-fonctionnel----------------------------------------------------------------------------------------//
  public void heroHitboxGauche(int nbDeplacement) {//déplace la hitbox vers la gauche de nbDeplacement tant qu'il n'y a pas de mur à nbDeplacement case par rapport au hero
    try {
      while ((bonusNoClip.trigNoClip==false &&(hitboxLvl[levelNumber][hero.heroPos18-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos17-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos16-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos15-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos14-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos13-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos12-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos11-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos10-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos9-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos8-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos7-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos6-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos5-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos4-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos3-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos2-nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos1-nbDeplacement].startsWith("wall")))||(bonusNoClip.trigNoClip==true && ((!hitboxLvl[levelNumber][heroPos18-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos18-nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos17-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos17-nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos16-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos16-nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos15-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos15-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos14-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos14-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos13-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos13-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos12-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos12-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos11-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos11-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos10-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos10-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos9-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos9-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos8-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos8-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos7-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos7-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos6-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos6-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos5-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos5-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos4-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos4-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos3-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos3-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos2-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos2-nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos1-nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos1-nbDeplacement].startsWith("wall") )))) {

        nbDeplacement--;//réduit de 1 nbDeplacement tant qu'il n'y a pas de mur
      }
      hero.heroPos1-=nbDeplacement;
      hero.heroPos2-=nbDeplacement;
      hero.heroPos3-=nbDeplacement;
      hero.heroPos4-=nbDeplacement;
      hero.heroPos5-=nbDeplacement;
      hero.heroPos6-=nbDeplacement;
      hero.heroPos7-=nbDeplacement;
      hero.heroPos8-=nbDeplacement;
      hero.heroPos9-=nbDeplacement;
      hero.heroPos10-=nbDeplacement;
      hero.heroPos11-=nbDeplacement;
      hero.heroPos12-=nbDeplacement;
      hero.heroPos13-=nbDeplacement;
      hero.heroPos14-=nbDeplacement;
      hero.heroPos15-=nbDeplacement;
      hero.heroPos16-=nbDeplacement;
      hero.heroPos17-=nbDeplacement;
      hero.heroPos18-=nbDeplacement;
      contactSpike();
      contactBonusDoubleJump();
      contactBonusDash();
      contactBonusTP();
      contactBonusGSwap();
      contactBonusPoints();
      contactBonusNoClip();
      //---------------------------------------------Code non necessaire car le bonusNoClip ne fonctionne pas----------------------------------------------------------//
      if (!hitboxLvl[levelNumber][heroPos1+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos1+nbDeplacement]="empty";
      }
      if (!hitboxLvl[levelNumber][heroPos2+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos2+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos3+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos3+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos4+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos4+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos5+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos5+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos6+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos6+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos7+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos7+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos8+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos8+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos9+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos9+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos10+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos10+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos11+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos11+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos12+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos12+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos13+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos13+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos14+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos14+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos15+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos15+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos16+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos16+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos17+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos17+nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos18+nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos18+nbDeplacement]="empty";
      }
      //------------------------------fin code non nécessaire car le bonusNoClip ne fonctionne pas----------------------------------------//
      heroHitbox();
    }
    catch(ArrayIndexOutOfBoundsException e) {// récupère toutes les exceptions pour éviter les problèmes de clef plus grande que la length de la matrice/clef négative
      ArrayIndexException();
    }
  }
  public void heroHitboxDroite(int nbDeplacement) {//déplace la hitbox vers la droite (miroir de heroHitboxGauche)
    try {
      while ((bonusNoClip.trigNoClip==false &&(hitboxLvl[levelNumber][hero.heroPos18+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos17+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos16+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos15+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos14+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos13+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos12+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos11+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos10+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos9+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos8+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos7+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos6+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos5+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos4+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos3+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos2+nbDeplacement].startsWith("wall") || hitboxLvl[levelNumber][heroPos1+nbDeplacement].startsWith("wall")))||(bonusNoClip.trigNoClip==true && ((!hitboxLvl[levelNumber][heroPos18+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos18+nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos17+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos17+nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos16+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos16+nbDeplacement].startsWith("wall") ) || (!hitboxLvl[levelNumber][heroPos15+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos15+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos14+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos14+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos13+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos13+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos12+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos12+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos11+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos11+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos10+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos10+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos9+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos9+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos8+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos8+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos7+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos7+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos6+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos6+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos5+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos5+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos4+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos4+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos3+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos3+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos2+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos2+nbDeplacement].startsWith("wall") )|| (!hitboxLvl[levelNumber][heroPos1+nbDeplacement].startsWith("wallNoClip") && hitboxLvl[levelNumber][heroPos1+nbDeplacement].startsWith("wall") )))) {
        nbDeplacement--;
      }
      hero.heroPos1+=nbDeplacement;
      hero.heroPos2+=nbDeplacement;
      hero.heroPos3+=nbDeplacement;
      hero.heroPos4+=nbDeplacement;
      hero.heroPos5+=nbDeplacement;
      hero.heroPos6+=nbDeplacement;
      hero.heroPos7+=nbDeplacement;
      hero.heroPos8+=nbDeplacement;
      hero.heroPos9+=nbDeplacement;
      hero.heroPos10+=nbDeplacement;
      hero.heroPos11+=nbDeplacement;
      hero.heroPos12+=nbDeplacement;
      hero.heroPos13+=nbDeplacement;
      hero.heroPos14+=nbDeplacement;
      hero.heroPos15+=nbDeplacement;
      hero.heroPos16+=nbDeplacement;
      hero.heroPos17+=nbDeplacement;
      hero.heroPos18+=nbDeplacement;
      contactSpike();
      contactBonusDoubleJump();
      contactBonusDash();
      contactBonusTP();
      contactBonusGSwap();
      contactBonusPoints();
      contactBonusNoClip();
      //--------------------------------------------code non fonctionnel car bonusNoClip ne fonctionne pas---------------------------------------------------//
      if (!hitboxLvl[levelNumber][heroPos1-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos1-nbDeplacement]="empty";
      }
      if (!hitboxLvl[levelNumber][heroPos2-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos2-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos3-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos3-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos4-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos4-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos5-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos5-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos6-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos6-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos7-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos7-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos8-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos8-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos9-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos9-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos10-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos10-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos11-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos11-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos12-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos12-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos13-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos13-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos14-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos14-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos15-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos15-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos16-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos16-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos17-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos17-nbDeplacement]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos18-nbDeplacement].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos18-nbDeplacement]="empty";
      }
      //--------------------------------------------code non fonctionnel car bonusNoClip ne fonctionne pas---------------------------------------------------//
      heroHitbox();
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
  }
  public void heroHitboxHaut() {//déplace la hitbox vers le haut
    try {
      hero.heroPos1-=128;
      hero.heroPos2-=128;
      hero.heroPos3-=128;
      hero.heroPos4-=128;
      hero.heroPos5-=128;
      hero.heroPos6-=128;
      hero.heroPos7-=128;
      hero.heroPos8-=128;
      hero.heroPos9-=128;
      hero.heroPos10-=128;
      hero.heroPos11-=128;
      hero.heroPos12-=128;
      hero.heroPos13-=128;
      hero.heroPos14-=128;
      hero.heroPos15-=128;
      hero.heroPos16-=128;
      hero.heroPos17-=128;
      hero.heroPos18-=128;
      contactBonusDoubleJump();
      contactBonusTP();
      contactBonusDash();
      contactBonusNoClip();
      contactBonusGSwap();
      contactBonusPoints();
      contactSpike();
      //--------------------------------------------code non fonctionnel car bonusNoClip ne fonctionne pas---------------------------------------------------//
      if (!hitboxLvl[levelNumber][heroPos1+128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos1+128]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos2+128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos2+128]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos3+128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos3+128]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos4+128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos4+128]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos5+128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos5+128]="empty";
      }    
      if (!hitboxLvl[levelNumber][heroPos6+128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][hero.heroPos6+128]="empty";
      }
      //--------------------------------------------code non fonctionnel car bonusNoClip ne fonctionne pas---------------------------------------------------//
      heroHitbox();
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
  }
  public void heroHitboxChute() {//déplace la hitbox vers le bas(miroir de heroHitboxHaut)
    try {
      hero.heroPos1+=128;
      hero.heroPos2+=128;
      hero.heroPos3+=128;
      hero.heroPos4+=128;
      hero.heroPos5+=128;
      hero.heroPos6+=128;
      hero.heroPos7+=128;
      hero.heroPos8+=128;
      hero.heroPos9+=128;
      hero.heroPos10+=128;
      hero.heroPos11+=128;
      hero.heroPos12+=128;
      hero.heroPos13+=128;
      hero.heroPos14+=128;
      hero.heroPos15+=128;
      hero.heroPos16+=128;
      hero.heroPos17+=128;
      hero.heroPos18+=128;
      contactBonusDoubleJump();
      contactBonusTP();
      contactBonusDash();    
      contactBonusNoClip();
      contactBonusGSwap();
      contactBonusPoints();
      contactSpike();
      //--------------------------------------------code non fonctionnel car bonusNoClip ne fonctionne pas---------------------------------------------------//
      if (!hitboxLvl[levelNumber][hero.heroPos18-128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][heroPos18-128]="empty";
      }    
      if (!hitboxLvl[levelNumber][hero.heroPos17-128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][heroPos17-128]="empty";
      }    
      if (!hitboxLvl[levelNumber][hero.heroPos16-128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][heroPos16-128]="empty";
      }    
      if (!hitboxLvl[levelNumber][hero.heroPos15-128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][heroPos15-128]="empty";
      }    
      if (!hitboxLvl[levelNumber][hero.heroPos14-128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][heroPos14-128]="empty";
      }    
      if (!hitboxLvl[levelNumber][hero.heroPos13-128].startsWith("wallNoClip")) {
        hitboxLvl[levelNumber][heroPos13-128]="empty";
      }
      //--------------------------------------------code non fonctionnel car bonusNoClip ne fonctionne pas---------------------------------------------------//
      heroHitbox();
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
  }


  public void distanceSol() {//calcul la distance entre les pieds du hero et le sol
    while (bonusGravitySwap.trigGSwap==false && nbMontee==0 && heroPos1+nbDescente*128<128*37 && bonusGravitySwap.trigGSwap==false && !hitboxLvl[levelNumber][hero.heroPos1+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos2+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos3+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos4+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos5+(nbDescente*128)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos6+(nbDescente*128)].startsWith("wall")) {
      nbDescente++;
    }
    if (hero.saut==true && nbMontee==0 && nbDescente==0 && bonusGravitySwap.trigGSwap==true) {
      nbDescente=6;
    }
    if ((nbDescente==0 && bonusGravitySwap.trigGSwap==false)) {// si on touche le sol, on peut sauter
      jumping=false;
    }
    if (bonusGravitySwap.trigGSwap==false) {
      jumping=true;
    }
  }
  public void confirmPosition() {//fonction pour que le hero ne 'saute/tombe' pas pour rien
    try {
      if (hitboxLvl[levelNumber][heroPos1+128].startsWith("wall") || hitboxLvl[levelNumber][heroPos2+128].startsWith("wall") || hitboxLvl[levelNumber][heroPos3+128].startsWith("wall") ||hitboxLvl[levelNumber][heroPos4+128].startsWith("wall") || hitboxLvl[levelNumber][heroPos5+128].startsWith("wall") ||hitboxLvl[levelNumber][heroPos6+128].startsWith("wall")) {
        nbMontee=0;
        nbDescente=0;
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
  }
  public void mvtHaut() {//calcul de la distance entre les pieds du hero et le sol, pendant un saut
    if (hero.saut==true && nbMontee==0 && nbDescente==0 && bonusGravitySwap.trigGSwap==false) {
      nbMontee=6;
    }
    try {
      while (bonusGravitySwap.trigGSwap==true && nbDescente==0 && !hitboxLvl[levelNumber][hero.heroPos18-(128*nbMontee)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos17-(128*nbMontee)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos16-(128*nbMontee)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos15-(128*nbMontee)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos14-(128*nbMontee)].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos13-(128*nbMontee)].startsWith("wall") && saut==false && bonusDoubleJump.trigDoubleJump==false) {
        nbMontee++;
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
    if (bonusDoubleJump.trigDoubleJump==true) {//si on saute en l'air relance le fonctionnement du saut à 0
      nbMontee=6;
      nbDescente=0;
    }
    if (nbMontee==0 && nbDescente==0 && bonusGravitySwap.trigGSwap==true) {//Si on ne monte pas ni ne descend, pas on touche le sol donc on ne saute pas
      jumping=false;
    }
    if (bonusGravitySwap.trigGSwap==true) {
      jumping=true;
    }
  }

  public void descente() {//fonction permettant de créer une gravité dans le jeu
    try {
      if (mvt<6 && i<6 &&  bonusDash.trigDash==false && bonusTP.trigTP==false && TPActivationP1==false && TPActivationP2==false && !hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall")) {
        if (firstChute==true) {
          vitY=0;
          firstChute=false;
          mvt=nbDescente;
        }
        y+=vitY;
        vitY+=0.31;        
        i++;
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
    try {
      if ( mvt>=6 && i<6 && bonusDash.trigDash==false && bonusTP.trigTP==false && TPActivationP1==false && TPActivationP2==false && !hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall")) {
        y+=8;
        i+=3;
        firstChute=false;
      } else if (i>=6 && nbMontee==0 && nbDescente>0) {
        if (bonusGravitySwap.trigGSwap==true) {
          hero.saut=false;
        }
        nbDescente--;
        i=0;
        heroHitboxChute();
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
    if (bonusGravitySwap.trigGSwap==false && heroPos1+nbDescente*128<128*37 &&  (hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall"))) {
      jumping=false;
      resetDessin();
      nbDescente=0;
      firstChute=true;
      if (bonusDoubleJump.doubleJumpOn==true) {
        bonusDoubleJump.doubleJump=true;
      }
    } else {
      if (bonusGravitySwap.trigGSwap==false) {
        jumping=true;
      }
    }
  }
  public void montee() {//créer un saut impacté par la gravité
    try {
      if (nbMontee>0 && j<6 && bonusDash.trigDash==false && bonusTP.trigTP==false && TPActivationP1==false && TPActivationP2==false  && !hitboxLvl[levelNumber][hero.heroPos18-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos17-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos16-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos15-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos14-128].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos13-128].startsWith("wall")) {
        if (nbMontee==6) {
          if (j==0) {
            vitY=7;
          }
          y-=vitY;
          vitY-=0.5;
        } else if ((nbMontee>1 && nbMontee<6)) {
          if (j==0 && nbMontee==5) {
            vitY=3.1;
          }
          y-=vitY;
          vitY-=0.1;
        }
        j++;
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
    if (j==6 && nbDescente==0) {
      if (bonusGravitySwap.trigGSwap==false) {
        hero.saut=false;
      }
      if (bonusDoubleJump.trigDoubleJump==true) {
        bonusDoubleJump.trigDoubleJump=false;
        bonusDoubleJump.doubleJump=false;
      }
      if (nbMontee>1) {
        hero.heroHitboxHaut();
      }
      nbMontee--;
      j=0;
    }
    try {
      if ( heroPos18-nbDescente*128>0 &&  (hitboxLvl[levelNumber][hero.heroPos18-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos17-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos16-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos15-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos14-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos13-128].startsWith("wall"))) {
        resetDessin();
        jumping=false;
        nbMontee=0;
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }
  }


  public void dash() {//fonction du fonctionnement et du timing de l'animation du dash
    if (bonusDash.dash==true && bonusDash.canDash==false && hero.jumping==false) {//si on touche le sol quand on a le bonus dash, on peut dash à nouveau
      bonusDash.canDash=true;
    }
    if (bonusDash.trigDash==true) {//si on active le dash
      if (nbDashAnim<12) {
        hero.contactEnd();
        bonusDash.canDash=false;
        if (lastMove==GAUCHE) {//dash à gauche
          heroHitboxGauche(2);
        }
        if (lastMove==DROITE || lastMove=='A' && VIEHasBeenFalse==false) {//dash à droite
          heroHitboxDroite(2);
          lastMove=DROITE;
        }
        DashActivation=true;
        timeAnimP1=millis();
        nbDashAnim++;
        resetDessin();
      } else {
        nbDashAnim=0;
        bonusDash.trigDash=false;
      }
    }
    if (bonusDash.dash==true && DashActivation==true && (millis()-timeAnimP1)%450>=300) {//temps de l'animation 300ms
      DashActivation=false;
      heroDashL.stop();//reset du gif à gauche
      heroDashR.stop();//reset du gif à droite
      heroDashL.play();//lancement du gif à gauche
      heroDashR.play();//lancement du gif à droite
    }
    if (bonusDash.dash==false && DashActivation==true) {
      DashActivation=false;
      heroDashL.stop();
      heroDashR.stop();
    }
  }

  public void TP() {//fonction du tp
    if (bonusTP.bonusTP==true && bonusTP.canTP==false && hero.jumping==false) {//si on touche le sol avec le bonus tp permet de tp à nouveau
      bonusTP.canTP=true;
    }
    if (bonusTP.trigTP==true) {//si on active le tp
      actualX=x;
      actualY=y;
      hero.contactEnd();
      bonusTP.canTP=false;
      if (lastMove==GAUCHE) {//tp à gauche
        heroHitboxGauche(16);
      }
      if (lastMove==DROITE) {//tp à droite
        heroHitboxDroite(16);
      }
      TPActivationP1=true;
      bonusTP.trigTP=false;
      heroTPR1.play();
      heroTPL1.play();
      timeAnimP1=millis();
    }
    if (TPActivationP1==true && (millis()-timeAnimP1)%400>=300) {//temps de la première animation du tp 300ms
      TPActivationP1=false;
      TPActivationP2=true;
      heroTPR1.stop();
      heroTPL1.stop();
      heroTPR2.play();
      heroTPL2.play();
      timeAnimP2=millis();
    }
    if (bonusTP.bonusTP==true && TPActivationP2==true && (millis()-timeAnimP2)%400>=300) {//temps de la seconde animation du tp 300ms
      TPActivationP2=false;
      heroTPR2.stop();
      heroTPL2.stop();
    }
    if (bonusTP.bonusTP==false && (TPActivationP1==true || TPActivationP2==true)) {
      TPActivationP2=false;
      TPActivationP1=false;
      heroTPR1.stop();
      heroTPR2.stop();
      heroTPL1.stop();
      heroTPL2.stop();
    }

    if (bonusTP.trigTP==true || (TPActivationP1==true || TPActivationP2==true)) {//replace l'image du hero à sa position
      resetDessin();
    }
  }
  //----------------------------fonction non fonctionnelle bonusNoClip---------------------------------//
  public void NoClip() {
    if (bonusNoClip.trigNoClip==true) {
    }
  }
  //---------------------------------------------------------------------------------------------------//

  public void recommencer() {//fonction qui reset toutes les variables quand on est mort
    if (VIE==false) {
      VIE=true;
      nbMort++;
      VIEHasBeenFalse=true;   
      lastMove='A';
      jumping=false;
      gauche=false;
      droite=false;
      actualX=x;
      actualY=y;
      bonusGravitySwap.trigGSwap=false;
      bonusGravitySwap.timeActivationGSwap=false;
      bonusPoints.nbPoints-=bonusPoints.nbPointsLvl;
      bonusPoints.nbPointsLvl=0;
      animation();
      String actualLevel="lvl"+str(levelNumber+1);
      hitboxLvl[levelNumber]=loadStrings("data/levels/lvlsHitbox/"+actualLevel+".txt");
      //println("Vous êtes mort.");
      resetDessin();
      mvtInterfaceANDdeath.trigger();
      timeDeath=millis();
      println("aaaa");
    }
    if (VIEHasBeenFalse==true && (millis()-timeDeath)%500>=400) {//400ms le temps de l'animation de la mort
      VIEHasBeenFalse=false;
      nbMontee=0;
      nbDescente=0;
      bonusDoubleJump.trigDoubleJump=false;
      hero.saut=false;
      bonusDoubleJump.doubleJump=false;
      bonusDoubleJump.doubleJumpOn=false;
      bonusDash.dash=false;
      bonusTP.bonusTP=false;
      bonusTP.trigTP=false;
      bonusNoClip.noClip=false;
      bonusGravitySwap.GSwap=false;
    }
  }

  public void contactSpike() {//fonction si on touche les piques, nous tue
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("spike") || hitboxLvl[levelNumber][heroPos17].startsWith("spike") || hitboxLvl[levelNumber][heroPos16].startsWith("spike") || hitboxLvl[levelNumber][heroPos15].startsWith("spike") || hitboxLvl[levelNumber][heroPos14].startsWith("spike") || hitboxLvl[levelNumber][heroPos13].startsWith("spike") || hitboxLvl[levelNumber][heroPos12].startsWith("spike") || hitboxLvl[levelNumber][heroPos11].startsWith("spike") || hitboxLvl[levelNumber][heroPos10].startsWith("spike") || hitboxLvl[levelNumber][heroPos9].startsWith("spike") || hitboxLvl[levelNumber][heroPos8].startsWith("spike") || hitboxLvl[levelNumber][heroPos7].startsWith("spike") || hitboxLvl[levelNumber][heroPos6].startsWith("spike") || hitboxLvl[levelNumber][heroPos5].startsWith("spike") || hitboxLvl[levelNumber][heroPos4].startsWith("spike") || hitboxLvl[levelNumber][heroPos3].startsWith("spike") || hitboxLvl[levelNumber][heroPos2].startsWith("spike") || hitboxLvl[levelNumber][heroPos1].startsWith("spike")) {
      VIE=false;
    }
  }
  public void contactBonusDoubleJump() {//fonction si on touche un bonusDoubleJump, désactive les autres bonus et active celui-ci
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BJump") || hitboxLvl[levelNumber][heroPos17].startsWith("BJump") || hitboxLvl[levelNumber][heroPos16].startsWith("BJump") || hitboxLvl[levelNumber][heroPos15].startsWith("BJump") || hitboxLvl[levelNumber][heroPos14].startsWith("BJump") || hitboxLvl[levelNumber][heroPos13].startsWith("BJump") || hitboxLvl[levelNumber][heroPos12].startsWith("BJump") || hitboxLvl[levelNumber][heroPos11].startsWith("BJump") || hitboxLvl[levelNumber][heroPos10].startsWith("BJump") || hitboxLvl[levelNumber][heroPos9].startsWith("BJump") || hitboxLvl[levelNumber][heroPos8].startsWith("BJump") || hitboxLvl[levelNumber][heroPos7].startsWith("BJump") || hitboxLvl[levelNumber][heroPos6].startsWith("BJump") || hitboxLvl[levelNumber][heroPos5].startsWith("BJump") || hitboxLvl[levelNumber][heroPos4].startsWith("BJump") ||  hitboxLvl[levelNumber][heroPos3].startsWith("BJump") || hitboxLvl[levelNumber][heroPos2].startsWith("BJump") || hitboxLvl[levelNumber][heroPos1].startsWith("BJump")) {
      bonusDoubleJump.doubleJump=true;
      bonusDoubleJump.doubleJumpOn=true;
      bonusDash.dash=false;
      bonusDash.canDash=false;
      bonusTP.bonusTP=false;
      bonusTP.canTP=false;
      bonusNoClip.noClip=false;
      bonusDoubleJump.x=2000;
      bonusDoubleJump.y=2000;
      bonusGravitySwap.GSwap=false;
      bonusGravitySwap.trigGSwap=false;
      bonusGravitySwap.timeActivationGSwap=false;
      validationInterfaceANDpowerup.trigger();//son du bonus
    }
  }
  public void contactBonusDash() {//fonction si on touche un bonusDash, désactive les autres bonus et active celui-ci
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BDash") || hitboxLvl[levelNumber][heroPos17].startsWith("BDash") || hitboxLvl[levelNumber][heroPos16].startsWith("BDash") || hitboxLvl[levelNumber][heroPos15].startsWith("BDash") || hitboxLvl[levelNumber][heroPos14].startsWith("BDash") || hitboxLvl[levelNumber][heroPos13].startsWith("BDash") || hitboxLvl[levelNumber][heroPos12].startsWith("BDash") || hitboxLvl[levelNumber][heroPos11].startsWith("BDash") || hitboxLvl[levelNumber][heroPos10].startsWith("BDash") || hitboxLvl[levelNumber][heroPos9].startsWith("BDash") || hitboxLvl[levelNumber][heroPos8].startsWith("BDash") || hitboxLvl[levelNumber][heroPos7].startsWith("BDash") || hitboxLvl[levelNumber][heroPos6].startsWith("BDash") || hitboxLvl[levelNumber][heroPos5].startsWith("BDash") || hitboxLvl[levelNumber][heroPos4].startsWith("BDash") || hitboxLvl[levelNumber][heroPos3].startsWith("BDash") || hitboxLvl[levelNumber][heroPos2].startsWith("BDash") || hitboxLvl[levelNumber][heroPos1].startsWith("BDash")) {
      bonusDash.dash=true;      
      sound.loadBonusSFX();
      bonusDash.x=2000;
      bonusDash.y=2000;
      bonusDash.canDash=true;
      bonusTP.bonusTP=false;
      bonusTP.canTP=false;
      bonusDoubleJump.doubleJump=false;
      bonusDoubleJump.doubleJumpOn=false;
      bonusNoClip.noClip=false;
      bonusGravitySwap.GSwap=false;
      bonusGravitySwap.trigGSwap=false;
      bonusGravitySwap.timeActivationGSwap=false;
      validationInterfaceANDpowerup.trigger();//son du bonus
    }
  }
  public void contactBonusTP() {//fonction si on touche un bonusTP, désactive les autres bonus et active celui-ci
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BTP") || hitboxLvl[levelNumber][heroPos17].startsWith("BTP") || hitboxLvl[levelNumber][heroPos16].startsWith("BTP") || hitboxLvl[levelNumber][heroPos15].startsWith("BTP") || hitboxLvl[levelNumber][heroPos14].startsWith("BTP") || hitboxLvl[levelNumber][heroPos13].startsWith("BTP") || hitboxLvl[levelNumber][heroPos12].startsWith("BTP") || hitboxLvl[levelNumber][heroPos11].startsWith("BTP") || hitboxLvl[levelNumber][heroPos10].startsWith("BTP") || hitboxLvl[levelNumber][heroPos9].startsWith("BTP") || hitboxLvl[levelNumber][heroPos8].startsWith("BTP") || hitboxLvl[levelNumber][heroPos7].startsWith("BTP") || hitboxLvl[levelNumber][heroPos6].startsWith("BTP") || hitboxLvl[levelNumber][heroPos5].startsWith("BTP") || hitboxLvl[levelNumber][heroPos4].startsWith("BTP") || hitboxLvl[levelNumber][heroPos3].startsWith("BTP") || hitboxLvl[levelNumber][heroPos2].startsWith("BTP") || hitboxLvl[levelNumber][heroPos1].startsWith("BTP")) {
      bonusTP.bonusTP=true;
      sound.loadBonusSFX();
      bonusTP.x=2000;
      bonusTP.y=2000;
      bonusTP.canTP=true;
      bonusDash.dash=false;
      bonusDash.canDash=false;
      bonusDoubleJump.doubleJump=false;
      bonusDoubleJump.doubleJumpOn=false;
      bonusNoClip.noClip=false;
      bonusGravitySwap.GSwap=false;
      bonusGravitySwap.trigGSwap=false;
      bonusGravitySwap.timeActivationGSwap=false;
      validationInterfaceANDpowerup.trigger();//son
    }
  }
  //-----------------------------fonction pour le bonusNoClip non fonctionnel---------------------------------------------//
  public void contactBonusNoClip() {
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos17].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos16].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos15].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos14].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos13].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos12].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos11].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos10].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos9].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos8].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos7].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos6].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos5].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos4].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos3].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos2].startsWith("BnoClip") || hitboxLvl[levelNumber][heroPos1].startsWith("BnoClip")) {
      bonusNoClip.x=2000;
      bonusNoClip.y=2000;
      bonusNoClip.noClip=true;
      bonusTP.bonusTP=false;
      bonusTP.canTP=false;
      bonusDash.dash=false;
      bonusDash.canDash=false;
      bonusDoubleJump.doubleJump=false;
      bonusDoubleJump.doubleJumpOn=false;
      bonusGravitySwap.GSwap=false;
      bonusGravitySwap.trigGSwap=false;
      bonusGravitySwap.timeActivationGSwap=false;
      validationInterfaceANDpowerup.trigger();
    }
  }
  //-----------------------------------------------------------------------------------------------------------------------//

  public void contactBonusGSwap() {//fonction si on touche un bonus d'inversion de gravité, désactive les autres bonus et active celui-ci
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos17].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos16].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos15].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos14].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos13].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos12].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos11].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos10].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos9].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos8].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos7].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos6].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos5].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos4].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos3].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos2].startsWith("BGSwap") || hitboxLvl[levelNumber][heroPos1].startsWith("BGSwap")) {
      bonusGravitySwap.GSwap=true;
      sound.loadBonusSFX();
      bonusGravitySwap.x=2000;
      bonusGravitySwap.y=2000;
      bonusNoClip.noClip=false;
      bonusTP.bonusTP=false;
      bonusTP.canTP=false;
      bonusDash.dash=false;
      bonusDash.canDash=false;
      bonusDoubleJump.doubleJump=false;
      bonusDoubleJump.doubleJumpOn=false;
      validationInterfaceANDpowerup.trigger();
    }
  }
  public void contactBonusPoints() {//fonction qui rajoute 1 au score quand on touche un bonus points
    if (hitboxLvl[levelNumber][hero.heroPos18].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos17].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos16].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos15].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos14].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos13].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos12].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos11].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos10].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos9].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos8].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos7].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos6].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos5].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos4].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos3].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos2].startsWith("BPoints") || hitboxLvl[levelNumber][heroPos1].startsWith("BPoints")) {
      bonusPoints.x=2000;
      bonusPoints.y=2000;
      bonusPoints.nbPoints++;
      bonusPoints.nbPointsLvl++;
      validationInterfaceANDpowerup.trigger();
    }
  }

  public void contactEnd() {//fonction travaillant avec les cases end de la matrices
    int actualLevelNumber=levelNumber;
    try {// si le "end" est celui qui permet d'aller dans le niveau courant et que l'on y passe par la gauche nous amène à droite
      if (lastMove==GAUCHE && (hitboxLvl[levelNumber][hero.heroPos18-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos17-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos16-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos15-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos14-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos13-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos12-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos7-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos6-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos5-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos4-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos3-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos2-1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos1-1].equals("end"+levelNumber))) {
        heroHitboxDroite(120);
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      heroHitboxDroite(120);
    }
    try {//si le "end" est celui qui permet d'aller dans le niveau courant et que l'on y passe par la droite, nous y amène par la gauche
      if (lastMove==DROITE && (hitboxLvl[levelNumber][hero.heroPos18+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos17+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos16+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos15+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos14+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos13+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos12+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos7+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos6+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos5+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos4+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos3+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos2+1].equals("end"+levelNumber) || hitboxLvl[levelNumber][heroPos1+1].equals("end"+levelNumber))) {
        heroHitboxGauche(120);
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      heroHitboxGauche(120);
    }
    if (lastMove==GAUCHE) {//si l'on vient par la gauche et qu'il y a une porte end nous envoie au niveau de la case "end" en question+1, car on finit le niveau de numéro "end"
      if (hitboxLvl[levelNumber][hero.heroPos18-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos18-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos17-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos17-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos16-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos16-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos15-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos15-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos14-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos14-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos13-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos13-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos12-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos12-1].substring(3));
      }
      if (hitboxLvl[levelNumber][hero.heroPos7-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos7-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos6-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos6-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos5-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos5-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos4-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos4-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos3-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos3-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos2-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos2-1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos1-1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos1-1].substring(3));
      }
    } else  if (lastMove==DROITE) {//de même par la droite
      if (hitboxLvl[levelNumber][hero.heroPos18+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos18+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos17+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos17+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos16+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos16+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos15+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos15+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos14+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos14+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos13+1].startsWith("end")) {      
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos13+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos12+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos12+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos7+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos6+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos6+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos5+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos5+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos4+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos4+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos3+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos3+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos2+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos2+1].substring(3));
      } 
      if (hitboxLvl[levelNumber][hero.heroPos1+1].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos1+1].substring(3));
      }
    }
    try {
      if (hitboxLvl[levelNumber][heroPos1+128].startsWith("end")) {//de même par le haut ou le bas
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos1+128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos2+128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos2+128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos3+128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos3+128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos4+128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos4+128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos5+128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos5+128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos6+128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos6+128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos13-128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos13-128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos14-128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos14-128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos15-128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos15-128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos16-128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos16-128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos17-128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos17-128].substring(3));
      } else if (hitboxLvl[levelNumber][heroPos18-128].startsWith("end")) {
        levelNumber=Integer.parseInt(hitboxLvl[levelNumber][hero.heroPos18-128].substring(3));
      }
    }
    catch(ArrayIndexOutOfBoundsException e) {
      ArrayIndexException();
    }

    if (actualLevelNumber!=levelNumber) {//si il y a une différence avec le numéro du niveau courant le numéro du niveau global
      nextLevel();//lance cette fonction qui amène vers le niveau global
    }
  }
  void nextLevel() {//fonction qui désactive tous les mouvements et bonus et qui nous envoie au niveau suivant
    sound.firstMusic=false;
    reset=true;
    lastMove='A';
    jumping=false;
    saut=false;
    firstChute=false;
    nbMontee=0;
    nbDescente=0;
    bonusPoints.nbPointsLvl=0;
    bonusDoubleJump.doubleJump=false;
    bonusDoubleJump.doubleJumpOn=false;
    bonusDash.dash=false;
    bonusTP.bonusTP=false;
    bonusTP.trigTP=false;
    bonusNoClip.noClip=false;
    bonusGravitySwap.trigGSwap=false;
    bonusGravitySwap.GSwap=false;
    String actualLevel="lvl"+str(levelNumber+1);
    hitboxLvl[levelNumber]=loadStrings("data/levels/lvlsHitbox/"+actualLevel+".txt");
    sound.musicChange();
  }
  void ArrayIndexException() {//fonction qui nous tue si on sort de la matrice et que la case en question n'était pas une case end(car dans un catch qui avant testait si la case était un end)
    VIE=false;
    nbDescente=0;
    nbMontee=0;
    lastMove='A';
    jumping=false;
    gauche=false;
    droite=false;
    nbMontee=0;
    nbDescente=0;
    bonusDoubleJump.doubleJump=false;
    bonusDoubleJump.doubleJumpOn=false;
    bonusDash.dash=false;
    bonusTP.bonusTP=false;
    bonusTP.trigTP=false;
    bonusNoClip.noClip=false;
    bonusGravitySwap.trigGSwap=false;
    bonusGravitySwap.GSwap=false;
    bonusGravitySwap.timeActivationGSwap=false;
  }
  void musicnullPointerException(){
    
  }
}
