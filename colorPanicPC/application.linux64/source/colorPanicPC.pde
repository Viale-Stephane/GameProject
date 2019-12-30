//----------------------BEGIN-IMPORT-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import gifAnimation.*;

import java.io.*;
import java.lang.*;
//----------------------END-IMPORT--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//--------BEGIN-CREATION-GLOBAL-VARIABLES------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//
char GAUCHE='q', DROITE='d', HAUT='z', JUMP=' ', BAS='s', ACTION='j', PAUSE='p' ;
PImage heroJumpBlueR, heroJumpBlueL, heroJumpGreenR, heroJumpGreenL, heroJumpBlackR, heroJumpBlackL, heroJumpPurpleR, heroJumpPurpleL, heroJumpRedR, heroJumpRedL, heroJumpVeridianR, heroJumpVeridianL, heroJumpGSwapR, heroJumpGSwapL;
PImage heroIdleBlueL, heroIdleBlueR, heroIdleGreenL, heroIdleGreenR, heroIdleBlackL, heroIdleBlackR, heroIdlePurpleL, heroIdlePurpleR, heroIdleRedL, heroIdleRedR, heroIdleVeridianL, heroIdleVeridianR, heroIdleGSwapL, heroIdleGSwapR;
PImage menuPNG, menuEmpty, timer, deathPNG, coin;
PImage[] lvl=new PImage[9999];
String [][]hitboxLvl=new String[9999][];
PFont font, arial;

int levelNumber=0, initialTime=0;
int second=0, minute=0, hour=0, millisPaused=0, timeStopped, millis;

AudioPlayer actualMusic, musicBurn, musicColorPanic, musicJourneyBegin, musicNewPower, musicRetroRide, musicRise, musicTheLastBattle, musicTheOne, musicValk;//chargement de seulement 5 variables pour le son sinon ce que j'imagine

AudioSample gswap;
AudioSample dash;
AudioSample jump;//et GSwap
AudioSample TP;//et dash
AudioSample powerup;
AudioSample death;
AudioSample validationInterface;
AudioSample mvtInterface;


Hero hero=new Hero();
BonusDoubleJump bonusDoubleJump=new BonusDoubleJump();
BonusDash bonusDash=new BonusDash();
BonusNoClip bonusNoClip=new BonusNoClip();
BonusTP bonusTP=new BonusTP();
BonusGravitySwap bonusGravitySwap= new BonusGravitySwap();
BonusPoints bonusPoints= new BonusPoints();
Sound sound=new Sound();
Interface interfaces=new Interface();
Script script=new Script();

Minim minim;

Gif heroBlueR, heroBlueL, heroGreenR, heroGreenL, heroBlackR, heroBlackL, heroPurpleR, heroPurpleL, heroRedR, heroRedL, heroVeridianR, heroVeridianL, heroGSwapL, heroGSwapR;
Gif powerupN, powerupR, powerupB, powerupG, powerupP, powerupV, powerupPoints;
Gif heroDashR, heroDashL;
Gif heroTPR1, heroTPL1, heroTPR2, heroTPL2;
Gif heroDeadBlue, heroDeadGreen, heroDeadBlack, heroDeadPurple, heroDeadRed, heroDeadVeridian;
Gif menu;

//---------------------------END-CREATION-GLOBAL-VARIABLES----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------//

void setup() {
  size(1024, 600);
  menuPNG =loadImage("data/menu.png");
  menuEmpty=loadImage("data/menuEmpty.png");
  image(menuEmpty,0,0);

  //----------------------BEGIN-GIF-DEFINITION----------------------------------------------------------------------------//
  heroBlueR = new Gif(this, "data/BOB_SPRITE/BOBWALK_B_R.gif");
  heroBlueR.play();
  heroBlueL = new Gif(this, "data/BOB_SPRITE/BOBWALK_B_L.gif");
  heroBlueL.play();
  heroGreenR = new Gif(this, "data/BOB_SPRITE/BOBWALK_G_R.gif");
  heroGreenR.play();
  heroGreenL = new Gif(this, "data/BOB_SPRITE/BOBWALK_G_L.gif");
  heroGreenL.play();
  heroBlackR = new Gif(this, "data/BOB_SPRITE/BOBWALK_N_R.gif");
  heroBlackR.play();
  heroBlackL= new Gif(this, "data/BOB_SPRITE/BOBWALK_N_L.gif");
  heroBlackL.play();
  heroPurpleR= new Gif(this, "data/BOB_SPRITE/BOBWALK_P_R.gif");
  heroPurpleR.play();
  heroPurpleL= new Gif(this, "data/BOB_SPRITE/BOBWALK_P_L.gif");
  heroPurpleL.play();
  heroRedR= new Gif(this, "data/BOB_SPRITE/BOBWALK_R_R.gif");
  heroRedR.play();
  heroRedL= new Gif(this, "data/BOB_SPRITE/BOBWALK_R_L.gif");
  heroRedL.play();
  heroVeridianR= new Gif(this, "data/BOB_SPRITE/BOBWALK_V_R.gif");
  heroVeridianR.play();
  heroVeridianL= new Gif(this, "data/BOB_SPRITE/BOBWALK_V_L.gif");
  heroVeridianL.play();
  heroDashR=new Gif(this, "data/BOB_SPRITE/BOBDASH/BOBDASH_R.gif");
  heroDashR.play();
  heroDashL=new Gif(this, "data/BOB_SPRITE/BOBDASH/BOBDASH_L.gif");
  heroDashL.play();
  powerupN = new Gif(this, "data/powerup/Powerup_BLACK.gif");
  powerupN.play();
  powerupR = new Gif(this, "data/powerup/Powerup_RED.gif");
  powerupR.play();
  powerupB= new Gif(this, "data/powerup/Powerup_BLUE.gif");
  powerupB.play();
  powerupG= new Gif(this, "data/powerup/Powerup_GREEN.gif");
  powerupG.play();
  powerupP= new Gif(this, "data/powerup/Powerup_PURPLE.gif");
  powerupP.play();
  powerupV= new Gif(this, "data/powerup/Powerup_VIRIDIAN.gif");
  powerupV.play();
  powerupPoints= new Gif(this, "data/powerup/Powerup_Points.gif");
  powerupPoints.play();
  heroDeadBlue=new Gif(this, "data/BOB_SPRITE/BOBDEAD/BOBDEAD_BLUE.gif");
  heroDeadBlue.play();
  heroDeadGreen=new Gif(this, "data/BOB_SPRITE/BOBDEAD/BOBDEAD_GREEN.gif");
  heroDeadGreen.play();
  heroDeadBlack=new Gif(this, "data/BOB_SPRITE/BOBDEAD/BOBDEAD_BLACK.gif");
  heroDeadBlack.play();
  heroDeadPurple=new Gif(this, "data/BOB_SPRITE/BOBDEAD/BOBDEAD_PURPLE.gif");
  heroDeadPurple.play();
  heroDeadRed=new Gif(this, "data/BOB_SPRITE/BOBDEAD/BOBDEAD_RED.gif");
  heroDeadRed.play();
  heroDeadVeridian=new Gif(this, "data/BOB_SPRITE/BOBDEAD/BOBDEAD_VIRIDIAN.gif");
  heroDeadVeridian.play();
  heroGSwapR=new Gif(this, "data/BOB_SPRITE/BOBG-SWAP/BOBG-SWAP_WALK_R.gif");
  heroGSwapR.play();
  heroGSwapL=new Gif(this, "data/BOB_SPRITE/BOBG-SWAP/BOBG-SWAP_WALK_L.gif");
  heroGSwapL.play();
  heroTPR1=new Gif(this, "data/BOB_SPRITE/BOBTP/TP_RIGHT1.gif");
  heroTPR1.play();
  heroTPR2=new Gif(this, "data/BOB_SPRITE/BOBTP/TP_RIGHT2.gif");
  heroTPR2.play();
  heroTPL1=new Gif(this, "data/BOB_SPRITE/BOBTP/TP_LEFT1.gif");
  heroTPL1.play();
  heroTPL2=new Gif(this, "data/BOB_SPRITE/BOBTP/TP_LEFT2.gif");
  heroTPL2.play();
  menu=new Gif(this, "data/menu.gif");
  menu.play();
  //-------------------------END-GIF-DEFINITION---------------------------------------------------------------------------//

  //-------------------------BEGIN-LEVELS-DEFINITION----------------------------------------------------------------------//
  File file = new File(dataPath("levels/lvlsHitbox"));
  String[] lvls = file.list();
  for (int i=0; i<lvls.length; i++) {
    String actualLevel="lvl"+str(i+1);
    lvl[i]=loadImage("data/levels/lvlsPrint/"+actualLevel+".png");
    hitboxLvl[i]=loadStrings("data/levels/lvlsHitbox/"+actualLevel+".txt");
  }
  //-------------------------END-LEVELS-DEFINITION------------------------------------------------------------------------//

  //----------------------BEGIN-PNG-DEFINITION----------------------------------------------------------------------------//
  heroJumpBlueR=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_B_R.png");
  heroJumpBlueL=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_B_L.png");
  heroJumpGreenR=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_G_R.png");
  heroJumpGreenL=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_G_L.png");
  heroJumpBlackR=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_N_R.png");
  heroJumpBlackL=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_N_L.png");
  heroJumpPurpleR=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_P_R.png");
  heroJumpPurpleL=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_P_L.png");
  heroJumpRedR=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_R_R.png");
  heroJumpRedL=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_R_L.png");
  heroJumpVeridianR=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_V_R.png");
  heroJumpVeridianL=loadImage("data/BOB_SPRITE/BOBJUMP/BOBJUMP_V_L.png");

  heroJumpGSwapR=loadImage("data/BOB_SPRITE/BOBG-SWAP/BOBG-SWAP_JUMP_R.png");
  heroJumpGSwapL=loadImage("data/BOB_SPRITE/BOBG-SWAP/BOBG-SWAP_JUMP_L.png");
  heroIdleGSwapR=loadImage("data/BOB_SPRITE/BOBG-SWAP/BOBG-SWAP_IDLE_R.png");
  heroIdleGSwapL=loadImage("data/BOB_SPRITE/BOBG-SWAP/BOBG-SWAP_IDLE_L.png");

  heroIdleBlueL=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_B_LEFT.png");
  heroIdleBlueR=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_B_RIGHT.png");
  heroIdleGreenL=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_G_LEFT.png");
  heroIdleGreenR=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_G_RIGHT.png");
  heroIdleBlackL=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_N_LEFT.png");
  heroIdleBlackR=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_N_RIGHT.png");
  heroIdlePurpleL=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_P_LEFT.png");
  heroIdlePurpleR=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_P_RIGHT.png");
  heroIdleRedL=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_R_LEFT.png");
  heroIdleRedR=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_R_RIGHT.png");
  heroIdleVeridianL=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_V_LEFT.png");
  heroIdleVeridianR=loadImage("data/BOB_SPRITE/BOBIDLE/BOBIDLE_V_RIGHT.png");
  //-----------------------END-PNG-DEFINITION-----------------------------------------------------------------------------//

  //-----------------------BEGIN-MUSIC-DEFINITION-------------------------------------------------------------------------//
  minim= new Minim(this);
  musicBurn= minim.loadFile("Sound/Music/musicBurn.mp3");
  musicColorPanic=minim.loadFile("Sound/Music/musicColorPanic.mp3");
  musicJourneyBegin=minim.loadFile("Sound/Music/musicJourneyBegin.mp3");
  musicNewPower=minim.loadFile("Sound/Music/musicNewPower.mp3");
  musicRetroRide=minim.loadFile("Sound/Music/musicRetroRide.mp3");
  musicRise=minim.loadFile("Sound/Music/musicRise.mp3");
  musicTheLastBattle=minim.loadFile("Sound/Music/musicTheLastBattle.mp3");
  musicTheOne=minim.loadFile("Sound/Music/musicTheOne.mp3");
  musicValk=minim.loadFile("Sound/Music/musicValk.mp3");
  actualMusic=minim.loadFile("Sound/Music/musicRetroRide.mp3");
  //--------------------END-MUSIC-DEFINITION------------------------------------------------------------------------------//

  //-------------------BEGIN-SFX-DEFINITION-------------------------------------------------------------------------------//
  validationInterface=minim.loadSample("Sound/SFX/validation.mp3");
  mvtInterface=minim.loadSample("Sound/SFX/mvtInterface.mp3");
  gswap = minim.loadSample("Sound/SFX/G-Swap.mp3");
  death = minim.loadSample("Sound/SFX/Death.mp3");
  dash = minim.loadSample("Sound/SFX/Dash.mp3");
  jump = minim.loadSample("Sound/SFX/Jump.mp3");
  
  TP = minim.loadSample("Sound/SFX/TP.mp3");
  
  //-------------------END-SFX-DEFINITION---------------------------------------------------------------------------------//
  timer=loadImage("data/timer.png");
  deathPNG=loadImage("data/death.png");
  coin=loadImage("data/coin.png");

  font = createFont("Super Mario Bros. NES.ttf", 22);
  arial = createFont("Arial", 21);
  actualMusic=sound.musicBegin("data/Sound/Music/musicRetroRide.mp3");
  interfaces.playerBase=loadStrings("data/playerBase.txt");
}

void draw() {
  if (interfaces.firstScreen==true) {
    image(menu, 0, 0);
  } else if (interfaces.ecranTitre==true) {
    interfaces.ecranTitre();
  } else if (interfaces.ecranTitre==false && interfaces.setUsername==true) {
    image(menuEmpty, 0, 0);
    textSize(13);
    fill(255, 255, 255);
    interfaces.visualKeyboard();
  } else if (interfaces.ecranTitre==false && interfaces.load==true) {
    image(menuEmpty, 0, 0);
    interfaces.load();
  } else if (interfaces.importing==true) {
    interfaces.importing();
  } else if (interfaces.exporting==true) {
    interfaces.exporting();
  } else if (interfaces.ecranTitre==false && interfaces.leaderboard==true) {
    image(menuEmpty, 0, 0);
    interfaces.leaderboard();
    interfaces.visualLeaderboard();
  } else if (interfaces.ecranTitre==false && interfaces.credit==true) {
    image(menuEmpty, 0, 0);
    interfaces.credits();
  } else if (interfaces.save==true) {
    image(menuEmpty, 0, 0);
    interfaces.save();
  } else if (interfaces.pause==true) {
    interfaces.pause();
  } else if (levelNumber==59) {
    interfaces.endGame();
  } else {
    image(lvl[levelNumber], 0, 0);
    sound.musicLoop();
    sound.musicFirst();
    hero.dessin();
    hero.recommencer();
    hero.contactEnd();
    hero.TP();

    deplacements("PC");
    hero.dash();
    hero.confirmPosition();
    bonusDoubleJump.animation();
    bonusDash.animation();
    bonusGravitySwap.animation();
    bonusNoClip.animation();
    bonusTP.animation();
    bonusPoints.animation();
    textSize(22);
    if (((interfaces.firstLoadedMillis+millis()-initialTime)-timeStopped)%1000<=15) {
      second++;
      if (interfaces.stepMillisIntegration==0) {
        interfaces.firstLoadedMillis=-millis()+initialTime+timeStopped;
        interfaces.stepMillisIntegration++;
        interfaces.is1000=1;
      }
      if (interfaces.stepMillisIntegration==1) {
        interfaces.firstLoadedMillis=0;
        interfaces.stepMillisIntegration=2;
      }
    }
    if (second>=60) {
      minute++;
      second-=60;
    }
    if (minute>=60) {
      hour++;
      minute-=60;
    }
    fill(#E4E823);
    image(timer, 400, 5);
    text(hour+":"+minute+":"+second+":"+(((millis()-initialTime)-timeStopped+(1000*interfaces.is1000)+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis))-(second*1000)-(minute*60000)-(hour*3600000)), 445, 35);//880
    image(deathPNG, 5, 5);
    text(hero.nbMort, 50, 35);
    image(coin, 5, 55);
    text(bonusPoints.nbPoints, 50, 88);
    fill(255, 255, 255);
    hero.contactSpike();
    hero.contactEnd();
  }
}

void deplacements(String console) {
  if (console=="PC") {
    if (bonusDash.trigDash==false || bonusTP.trigTP==false) {
      hero.mvtHaut();
      hero.distanceSol();
      if (bonusGravitySwap.timeActivationGSwap==true && hero.nbMontee!=0) {
        hero.reset=true;
      } else if (bonusGravitySwap.timeActivationGSwap==true && hero.nbMontee==0) {
        bonusGravitySwap.timeActivationGSwap=false;
      }
      if (hero.nbMontee==0 && bonusDash.trigDash==false) {
        hero.descente();
      }
      if (hero.nbDescente==0) {
        hero.montee();
        hero.montee();
      }
    }
    hero.mvtGauche();
    hero.mvtDroite();
  } else if (console=="PI") {
    if (bonusDash.trigDash==false || bonusTP.trigTP==false) {
      hero.mvtHaut();
      hero.distanceSol();
      if (bonusGravitySwap.timeActivationGSwap==true && hero.nbMontee!=0) {
        hero.reset=true;
      } else if (bonusGravitySwap.timeActivationGSwap==true && hero.nbMontee==0) {
        bonusGravitySwap.timeActivationGSwap=false;
      }
      if (hero.nbMontee==0) {
        hero.descente();
        hero.descente();
      }
      if (hero.nbDescente==0) {
        hero.montee();
        hero.montee();        
        hero.montee();
        hero.montee();
      }
    }
    hero.mvtGauche();
    hero.mvtGauche();
    hero.mvtDroite();    
    hero.mvtDroite();
  }
}

void keyReleased() {
  if (hero.VIEHasBeenFalse==false && interfaces.setUsername==false && interfaces.load==false && interfaces.ecranTitre==false && interfaces.leaderboard==false && interfaces.save==false && interfaces.pause==false && interfaces.importing==false && interfaces.exporting==false) {//si on est dans aucunes interfaces
    if (key==GAUCHE && (key!=HAUT || key !=JUMP)) {//on relâche la touche gauche, arrête le mouvement
      hero.gauche=false;
      hero.droite=false;
    }
    if (key==DROITE && (key!=HAUT || key !=JUMP)) {//on relâche la touche droite,arrête le mouvement
      hero.droite=false;
      hero.gauche=false;
    }
  }//end if
}
void keyPressed() {
  if (key=='m') {
    interfaces.load();
  }
  if (interfaces.firstScreen==true) {//actions disponibles pour le premier écran du jeu
    if (key==PAUSE) {
      interfaces.firstScreen=false;
      interfaces.ecranTitre=true;
    }
  } else if (interfaces.ecranTitre==false && interfaces.setUsername==false && interfaces.load==false && interfaces.leaderboard==false && interfaces.save==false && interfaces.pause==false && interfaces.importing==false && interfaces.exporting==false) {//actions disponibles en jeu
    if (hero.VIEHasBeenFalse==false && hero.TPActivationP1==false && hero.TPActivationP2==false && hero.VIE==true) { // ne peut réaliser une action dans le jeu que si le hero est en vie et qu'il n'est pas en plein tp
      if ((((key==HAUT || key == JUMP) && hero.saut==false && bonusGravitySwap.GSwap==false) && ((bonusGravitySwap.trigGSwap==false && hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") ||hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall")) || (bonusGravitySwap.trigGSwap==true && hitboxLvl[levelNumber][hero.heroPos18-128].startsWith("wall") ||hitboxLvl[levelNumber][hero.heroPos17-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos16-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos15-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos14-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos13-128].startsWith("wall"))))) {// si on touche le sol et que l'on a pas de bonus pour inverser la gravité et que l'on souhaite sauter alors
        hero.saut=true;
        jump.trigger();//son du saut
      }
      if ((key==HAUT || key == JUMP)  && bonusDoubleJump.doubleJump==true && hero.jumping==true && bonusGravitySwap.GSwap==false) { // si on souhaite sauter en l'air quand on a le bonus double jump
        bonusDoubleJump.trigDoubleJump=true;
        jump.trigger();//son du saut
      }
      if (key==ACTION) {
        if (bonusDash.dash==true && bonusDash.canDash==true) {//si on a le bonus pour dash et que l'on a pas déjà dash une fois en l'air
          bonusDash.trigDash=true;
          bonusDash.canDash=false;
          dash.trigger();
        }
        if (bonusTP.bonusTP==true && bonusTP.canTP==true) {//si on a le bonus tp et que l'on pas déjà tp une fois en l'air
          bonusTP.trigTP=true;
          bonusTP.canTP=false;
          TP.trigger();//son du tp
        }
        //-------------------------------------------------------------------DEBUT-BONUS-NON-FONCTIONNEL-------------------------------------------------------------//
        if (bonusNoClip.noClip==true && bonusNoClip.trigNoClip==false) {
          bonusNoClip.trigNoClip=true;
        } else if (bonusNoClip.noClip==true && bonusNoClip.trigNoClip==true) {
          bonusNoClip.trigNoClip=false;
        }
        //-------------------------------------------------------------FIN-BONUS-NON-FONCTIONNEL-------------------------------------------------------------------//
        if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==false && hero.jumping==false) { //si on a le bonus d'inversion de gravité, sans sauter, et que la gravité n'est pas inversé alors on l'inverse
          bonusGravitySwap.trigGSwap=true;
          bonusGravitySwap.timeActivationGSwap=true;
          gswap.trigger(); //son inversion de gravité
        } else if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==true && hero.jumping==false) {//si on a le bonus d'inversion de gravité, sans sauter, et que la gravité n'est inversé alors on la remet normalement
          bonusGravitySwap.trigGSwap=false;
          gswap.trigger();//son inversion de gravité
        }
      }
      if (key==PAUSE && isLooping() && interfaces.pause==false) {// si on appuie sur la touche de pause et que le jeu tourne, le met en pause
        millisPaused=millis();//récupère le temps auquel le jeu s'est mis en pause
        interfaces.pause=true;
        death.close();
        jump.close();
        powerup.close();
        TP.close();
        //validationInterface=minim.loadSample("Sound/SFX/validation.mp3");
        //mvtInterface=minim.loadSample("Sound/SFX/mvtInterface.mp3");
        interfaces.pause();
      } else if (key==PAUSE && interfaces.pause==true) {//si on appuie sur la touche de pause et que le jeu ne tourne pas, le relance
        timeStopped+=millis()-millisPaused;//recupère la valeur où le jeu était en pause
        interfaces.pause=false;
      }
    }
  } else if (interfaces.ecranTitre==true || interfaces.setUsername==true || interfaces.load==true || interfaces.leaderboard==true || interfaces.save==true ||interfaces.pause==true ||interfaces.importing==true || interfaces.exporting==true) {// actions disponibles dans une interface
    if (key==HAUT ||key==BAS ||key==GAUCHE ||key==DROITE) {    
      interfaces.leftAction();
      interfaces.rightAction();
      interfaces.topAction();
      interfaces.bottomAction();
      mvtInterface.trigger();//son du mouvement dans les interfaces
    } else if (key==ACTION) {    
      interfaces.confirmAction();
      validationInterface.trigger();//son de validation dans les interfaces
    }
  }
}



void keyTyped() {
  if (interfaces.setUsername==false && interfaces.ecranTitre==false && interfaces.load==false && interfaces.leaderboard==false && interfaces.save==false && interfaces.pause==false) {//si on est dans aucune interface
    if (hero.VIEHasBeenFalse==false && hero.TPActivationP2==false && hero.TPActivationP1==false && hero.DashActivation==false) {//et que l'on est en vie 
      if (key==GAUCHE) {//lance le mouvement vers la gauche
        hero.lastMove=GAUCHE;
        hero.droite=false;
        hero.gauche=true;
      }

      if (key==DROITE) {//lance le mouvement vers la droite
        hero.lastMove=DROITE;
        hero.gauche=false;
        hero.droite=true;
      }
    }
  }
}