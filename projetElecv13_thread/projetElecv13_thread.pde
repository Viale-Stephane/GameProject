import gifAnimation.*;

import java.io.*;
import java.lang.*;


char GAUCHE='q', DROITE='d', HAUT='z', PAUSE='p' ;
PImage heroJumpBlueR, heroJumpBlueL, heroJumpGreenR, heroJumpGreenL, heroJumpBlackR, heroJumpBlackL, heroJumpPurpleR, heroJumpPurpleL, heroJumpRedR, heroJumpRedL, heroJumpVeridianR, heroJumpVeridianL, heroJumpGSwapR, heroJumpGSwapL;
PImage heroIdleBlueL, heroIdleBlueR, heroIdleGreenL, heroIdleGreenR, heroIdleBlackL, heroIdleBlackR, heroIdlePurpleL, heroIdlePurpleR, heroIdleRedL, heroIdleRedR, heroIdleVeridianL, heroIdleVeridianR, heroIdleGSwapL, heroIdleGSwapR;
PImage[] lvl=new PImage[9999];
String [][]hitboxLvl=new String[9999][];



int levelNumber=0, initialTime=0;
int second=0, millis=0, minute=0, hour=0, actualMillis, millisPaused=0;


Hero hero=new Hero();
BonusDoubleJump bonusDoubleJump=new BonusDoubleJump();
BonusDash bonusDash=new BonusDash();
BonusNoClip bonusNoClip=new BonusNoClip();
BonusTP bonusTP=new BonusTP();
BonusGravitySwap bonusGravitySwap= new BonusGravitySwap();

Gif heroBlueR, heroBlueL, heroGreenR, heroGreenL, heroBlackR, heroBlackL, heroPurpleR, heroPurpleL, heroRedR, heroRedL, heroVeridianR, heroVeridianL, heroGSwapL, heroGSwapR;
Gif powerupN, powerupR, powerupB, powerupG, powerupP, powerupV;
Gif heroDashR;
Gif heroTPR1, heroTPL1, heroTPR2, heroTPL2;
Gif heroDeadBlue, heroDeadGreen, heroDeadBlack, heroDeadPurple, heroDeadRed, heroDeadVeridian;


void setup() {
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
  heroDashR=new Gif(this, "data/BOB_SPRITE/BOBDASH_R.gif");
  heroDashR.play();
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
  File file = new File(dataPath("levels/lvlsHitbox"));
  String[] lvls = file.list();
  for (int i=0; i<lvls.length; i++) {
    String actualLevel="lvl"+str(i+1);
    lvl[i]=loadImage("data/levels/lvlsPrint/"+actualLevel+".png");
    hitboxLvl[i]=loadStrings("data/levels/lvlsHitbox/"+actualLevel+".txt");
  }
  size(1024, 600);
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
  initialTime=millis();
}

void threadheroHitboxHaut(){
  hero.heroHitboxHaut();
}
void threadheroHitboxChute(){
  hero.heroHitboxChute();
}
void threadheroHitboxGauche1(){
  hero.heroHitboxGauche(1);
}
void threadheroHitboxGauche16(){
  hero.heroHitboxGauche(16);
}
void threadheroHitboxGauche120(){
  hero.heroHitboxGauche(120);
}
void threadheroHitboxDroite1(){
  hero.heroHitboxDroite(1);
}
void threadheroHitboxDroite16(){
  hero.heroHitboxDroite(16);
}
void threadheroHitboxDroite120(){
  hero.heroHitboxDroite(120);
}

void draw() {
  image(lvl[levelNumber], 0, 0);
  hero.dessin();
  hero.recommencer();
  // println(millis());
  // println(hero.timeDeath);
  // println("init : "+initialTime);  
  if (bonusDash.trigDash==false || bonusTP.trigTP==false) {
    hero.mvtHaut();
    hero.distanceSol();
    if (bonusGravitySwap.trigGSwap==true) {
      hero.reset=true;
    }
    if (hero.nbMontee==0) {
      hero.descente();
    }
    if (hero.nbDescente==0) {
      hero.montee();
      hero.montee();
    }
  }
  hero.mvtGauche();
  hero.mvtDroite();
  hero.dash();
  hero.TP();
  //println(bonusNoClip.trigNoClip);
  //println("gauche: "+hero.gauche);
  //println("droite: "+hero.droite);
  //println("lastMove: "+hero.lastMove);
  //println("nbDescente :"+hero.nbDescente);
  //println("nbMontee :"+hero.nbMontee);
  //println("vitY:"+hero.vitY);
  //println("y:"+hero.y);
  //println("heroMvt :"+ hero.mvt);
  // println("bonusDoubleJump :"+bonusDoubleJump.doubleJump);
  //println("jumping :"+hero.jumping);
  //println("GSWAP: "+bonusGravitySwap.trigGSwap);
  //println("TPP1: "+hero.TPActivationP1);
  //println("TPP2: "+hero.TPActivationP2);
  //println("lvlNumber: "+levelNumber);
  bonusDoubleJump.animation();
  bonusDash.animation();
  bonusGravitySwap.animation();
  bonusNoClip.animation();
  bonusTP.animation();
  //hero.wallNoClipheroDelete();
  textSize(22);
  if (minute%61==60 && second%61==60 && millis()%1000<=15) {
    hour++;
    minute-=60;
  }
  if (millisPaused==0) {
    millis=actualMillis;
  } else {
    millis=actualMillis-(actualMillis-millisPaused);
  }
  //println(millisPaused);
  if (millis()%1000<=15) {
    second++;
  }
  if (second%61==60 && millis()%1000<=15) {
    minute++;
    second-=60;
  }
  fill(126, 56, 186);
  text("TIMER: ", 800, 50);
  text(hour+":"+minute+":"+second+":"+(millis()-(second*1000)), 880, 50);
  text("MORTS: "+hero.nbMort, 500, 50);
  fill(255, 255, 255);
  hero.contactSpike();
  hero.contactEnd();
}

void threadCoinAnimation() {
  bonusDoubleJump.animation();
  bonusDash.animation();
  bonusGravitySwap.animation();
  bonusNoClip.animation();
  bonusTP.animation();
}

void keyReleased() {
  if (key==GAUCHE && key!=HAUT) {
    hero.gauche=false;
    hero.droite=false;
  }
  if (key==DROITE && key!=HAUT) {
    hero.droite=false;
    hero.gauche=false;
  }
}
void keyPressed() {
  if (hero.VIEHasBeenFalse==false && hero.TPActivationP1==false && hero.TPActivationP2==false ) {
    if (((key==HAUT && hero.saut==false) && ((bonusGravitySwap.trigGSwap==false && hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") ||hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall")) || (bonusGravitySwap.trigGSwap==true && hitboxLvl[levelNumber][hero.heroPos18-128].startsWith("wall") ||hitboxLvl[levelNumber][hero.heroPos17-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos16-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos15-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos14-128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos13-128].startsWith("wall"))))) {
      hero.saut=true;
    }
    if (key==HAUT  && bonusDoubleJump.doubleJump==true && hero.jumping==true) {
      bonusDoubleJump.trigDoubleJump=true;
      //bonusDoubleJump.doubleJump=false;
    }
    if (key=='m') {
      int level=levelNumber+1;
      saveStrings("data/levels/lvlsHitbox/lvl"+level+".txt", hitboxLvl[levelNumber]);
    }
    if (key=='j') {
      //hero.actualX=hero.x;
      //hero.actualY=hero.y;
      if (bonusDash.dash==true) {
        bonusDash.trigDash=true;
      }
      if (bonusTP.bonusTP==true) {
        bonusTP.trigTP=true;
      }
      if (bonusNoClip.noClip==true && bonusNoClip.trigNoClip==false) {
        bonusNoClip.trigNoClip=true;
      } else if (bonusNoClip.noClip==true && bonusNoClip.trigNoClip==true) {
        bonusNoClip.trigNoClip=false;
      }
      if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==false && hero.jumping==false) {
        bonusGravitySwap.trigGSwap=true;
      } else if (bonusGravitySwap.GSwap==true && bonusGravitySwap.trigGSwap==true && hero.jumping==false) {
        bonusGravitySwap.trigGSwap=false;
      }
    }
  }
  if (key==PAUSE && isLooping()) {
    noLoop();
  } else if (key==PAUSE && isLooping()==false) {
    loop();
  }
}

void keyTyped() {
  if (hero.VIEHasBeenFalse==false && hero.TPActivationP2==false && hero.TPActivationP1==false) {
    if (key==GAUCHE) {
      hero.lastMove=GAUCHE;
      hero.droite=false;
      hero.gauche=true;
    }

    if (key==DROITE) {
      hero.lastMove=DROITE;
      hero.gauche=false;
      hero.droite=true;
    }
  }
}