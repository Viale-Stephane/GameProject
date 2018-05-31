import gifAnimation.*;

import java.io.*;
import java.lang.*;


char GAUCHE='q', DROITE='d', HAUT='z', PAUSE='p' ;
PImage heroJumpBlueR, heroJumpBlueL, heroJumpGreenR, heroJumpGreenL, heroJumpBlackR, heroJumpBlackL, heroJumpPurpleR, heroJumpPurpleL, heroJumpRedR, heroJumpRedL, heroJumpVeridianR, heroJumpVeridianL;
PImage heroIdleBlueL, heroIdleBlueR, heroIdleGreenL, heroIdleGreenR, heroIdleBlackL, heroIdleBlackR, heroIdlePurpleL, heroIdlePurpleR, heroIdleRedL, heroIdleRedR, heroIdleVeridianL, heroIdleVeridianR;
PImage[] lvl=new PImage[9999];//heroDashR=new PImage[7];
PImage[] heroDashL=new PImage[30], heroTPL=new PImage[14], heroTPR=new PImage[39];
String [][]hitboxLvl=new String[9999][];



int levelNumber=0,actuallevelNumber=0;


Hitbox hitboxLvl1 = new Hitbox("1");
Hero hero=new Hero();
BonusDoubleJump bonusDoubleJump=new BonusDoubleJump();
BonusDash bonusDash=new BonusDash();
BonusNoClip bonusNoClip=new BonusNoClip();
BonusTP bonusTP=new BonusTP();
BonusGravitySwap bonusGravitySwap= new BonusGravitySwap();

Gif heroBlueR, heroBlueL, heroGreenR, heroGreenL, heroBlackR, heroBlackL, heroPurpleR, heroPurpleL, heroRedR, heroRedL, heroVeridianR, heroVeridianL;
Gif powerupN, powerupR, powerupB, powerupG, powerupP, powerupV;
Gif heroDashR;


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

  File file = new File(dataPath("levels/lvlsHitbox"));
  String[] lvls = file.list();
  for (int i=0; i<lvls.length; i++) {
    String actualLevel="lvl"+str(i+1);
    lvl[i]=loadImage("data/levels/lvlsPrint/"+actualLevel+".png");
    hitboxLvl[i]=loadStrings("data/levels/lvlsHitbox/"+actualLevel+".txt");
  }
  size(1024, 600);
  heroJumpBlueR=loadImage("data/BOB_SPRITE/BOB_B/BOBJUMP_B_RIGHT.png");
  heroJumpBlueL=loadImage("data/BOB_SPRITE/BOB_B/BOBJUMP_B_LEFT.png");
  heroJumpGreenR=loadImage("data/BOB_SPRITE/BOB_G/BOBJUMP_G_RIGHT.png");
  heroJumpGreenL=loadImage("data/BOB_SPRITE/BOB_G/BOBJUMP_G_LEFT.png");
  heroJumpBlackR=loadImage("data/BOB_SPRITE/BOB_N/BOBJUMP_N_RIGHT.png");
  heroJumpBlackL=loadImage("data/BOB_SPRITE/BOB_N/BOBJUMP_N_LEFT.png");
  heroJumpPurpleR=loadImage("data/BOB_SPRITE/BOB_P/BOBJUMP_P_RIGHT.png");
  heroJumpPurpleL=loadImage("data/BOB_SPRITE/BOB_P/BOBJUMP_P_LEFT.png");
  heroJumpRedR=loadImage("data/BOB_SPRITE/BOB_R/BOBJUMP_R_RIGHT.png");
  heroJumpRedL=loadImage("data/BOB_SPRITE/BOB_R/BOBJUMP_R_LEFT.png");
  heroJumpVeridianR=loadImage("data/BOB_SPRITE/BOB_V/BOBJUMP_V_RIGHT.png");
  heroJumpVeridianL=loadImage("data/BOB_SPRITE/BOB_V/BOBJUMP_V_LEFT.png");

  for (int i=1; i<30; i++) {
    heroDashL[i-1]=loadImage("data/BOB_SPRITE/BOBDASH/DASH_LEFT_"+i+".png");
  }
  for (int i=0; i<7; i++) {
    // heroDashR[i]=loadImage("data/BOB_SPRITE/BOBDASH/DASH_RIGHT_"+i+".png");
  }
  for (int i=0; i<14; i++) {
    heroTPL[i]=loadImage("data/BOB_SPRITE/BOBTP/TP_LEFT_"+i+".png");
  }
  for (int i=1; i<40; i++) {
    heroTPR[i-1]=loadImage("data/BOB_SPRITE/BOBTP/TP_RIGHT_"+i+".png");
  }
  heroIdleBlueL=loadImage("data/BOB_SPRITE/BOB_B/BOBIDLE_B_LEFT.png");
  heroIdleBlueR=loadImage("data/BOB_SPRITE/BOB_B/BOBIDLE_B_RIGHT.png");
  heroIdleGreenL=loadImage("data/BOB_SPRITE/BOB_G/BOBIDLE_G_LEFT.png");
  heroIdleGreenR=loadImage("data/BOB_SPRITE/BOB_G/BOBIDLE_G_RIGHT.png");
  heroIdleBlackL=loadImage("data/BOB_SPRITE/BOB_N/BOBIDLE_N_LEFT.png");
  heroIdleBlackR=loadImage("data/BOB_SPRITE/BOB_N/BOBIDLE_N_RIGHT.png");
  heroIdlePurpleL=loadImage("data/BOB_SPRITE/BOB_P/BOBIDLE_P_LEFT.png");
  heroIdlePurpleR=loadImage("data/BOB_SPRITE/BOB_P/BOBIDLE_P_RIGHT.png");
  heroIdleRedL=loadImage("data/BOB_SPRITE/BOB_R/BOBIDLE_R_LEFT.png");
  heroIdleRedR=loadImage("data/BOB_SPRITE/BOB_R/BOBIDLE_R_RIGHT.png");
  heroIdleVeridianL=loadImage("data/BOB_SPRITE/BOB_V/BOBIDLE_V_LEFT.png");
  heroIdleVeridianR=loadImage("data/BOB_SPRITE/BOB_V/BOBIDLE_V_RIGHT.png");
}


void draw() {
  image(lvl[levelNumber], 0, 0);
  hero.dessin();
  hero.mvtGauche();
  hero.mvtDroite();
  //image(heroDashR,100,100);
  if (bonusDash.trigDash==false || bonusTP.trigTP==false) {
    hero.mvtHaut();
    hero.distanceSol();
    if (hero.nbMontee==0) {
      hero.descente();
    }
    if (hero.nbDescente==0) {
      hero.montee();
      hero.montee();
    }
  }
  hero.dash();
  hero.TP();
  hero.contactEnd();
  // println(hitboxLvl[levelNumber][hero.heroPos1+1]);
  //println(bonusNoClip.trigNoClip
  //println("nbDescente :"+hero.nbDescente);
  //println("nbMontee :"+hero.nbMontee);
  //println("vitY:"+hero.vitY);
  //println("y:"+hero.y);
  //println("heroMvt :"+ hero.mvt);
  //println("bonusDoubleJump :"+bonusDoubleJump.doubleJump);
  //println("jumping :"+hero.jumping);
  bonusDoubleJump.animation();
  bonusDash.animation();
  bonusGravitySwap.animation();
  bonusNoClip.animation();
  bonusTP.animation();
  hero.wallNoClipheroDelete();
  hero.recommencer();
}

void keyPressed() {
  if ((key==HAUT && hero.saut==false) && (hitboxLvl[levelNumber][hero.heroPos1+128].startsWith("wall") ||hitboxLvl[levelNumber][hero.heroPos2+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos3+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos4+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos5+128].startsWith("wall") || hitboxLvl[levelNumber][hero.heroPos6+128].startsWith("wall"))) {
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
    hero.actualX=hero.x;
    hero.actualY=hero.y;
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
  }
  if (key=='l') {
    hero.heroHitboxDroite(1);
  }
}
void keyTyped() {
  if (key==GAUCHE) {
    if (hero.droite==false && hero.gauche==false && ((!hitboxLvl[levelNumber][hero.heroPos6-1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos12-1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos18-1].startsWith("wall"))||(bonusNoClip.trigNoClip==true &&(hitboxLvl[levelNumber][hero.heroPos18-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos17-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos16-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos15-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos14-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos13-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos12-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos11-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos10-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos9-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos8-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos6-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos5-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos4-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos3-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos2-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos1-1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7-1].startsWith("wallNoClip"))))) {
      hero.gauche=true;
      hero.droite=false;
    }
  }
  if (key==DROITE) {
    if ( hero.gauche==false && hero.droite==false && ((!hitboxLvl[levelNumber][hero.heroPos1+1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wall") && !hitboxLvl[levelNumber][hero.heroPos13+1].startsWith("wall"))||(bonusNoClip.trigNoClip==true &&(hitboxLvl[levelNumber][hero.heroPos18+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos17+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos16+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos15+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos14+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos13+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos12+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos11+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos10+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos9+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos8+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos6+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos5+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos4+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos3+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos2+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos1+1].startsWith("wallNoClip") || hitboxLvl[levelNumber][hero.heroPos7+1].startsWith("wallNoClip"))))) {
      hero.droite=true;
      hero.gauche=false;
    }
  }
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