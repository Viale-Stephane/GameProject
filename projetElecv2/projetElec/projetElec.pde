char GAUCHE='q', DROITE='d', HAUT='z', PAUSE='p' ;
PImage heroIdle0, heroIdle1, heroIdle2, heroIdle3;
PImage heroRight1, heroRight2, heroRight3;
PImage lvl1;
String []hitboxLvl=new String[0];



Hero hero=new Hero();
BonusDoubleJump bonusDoubleJump=new BonusDoubleJump(100, 100);
BonusDash bonusDash=new BonusDash(200, 200);

void setup() {
  size(1024, 600);
  heroRight1=loadImage("data/bobR/BOBWALK_Animation 2_0.png");
  heroRight2=loadImage("data/bobR/BOBWALK_Animation 2_1.png");
  heroRight3=loadImage("data/bobR/BOBWALK_Animation 2_2.png");
  lvl1=loadImage("data/levels/levelsImage/testscene.png");
  hitboxLvl=loadStrings("appletHitbox/Applet/lvl1.txt");
}
Hitbox hitboxLvl1 = new Hitbox("1");

void draw() {
  image(lvl1, 0, 0);
  hero.dessin();
  //hero.contactPlafond();
  hero.mvtHaut();
  hero.montee();
  hero.montee();
  hero.dash();
  hero.mvtDroite();

  hero.mvtGauche();

  //hero.rechercheSol();
  hero.contactSol();
  hero.descente();
  //println("vitY:"+hero.vitY);
  println("y:"+hero.y);
  println("heroMvt :"+ hero.mvt);
}

void keyPressed() {
  if ((key==HAUT && hero.saut==false) && (hitboxLvl[hero.heroPos1+128].equals("wall") ||hitboxLvl[hero.heroPos2+128].equals("wall") || hitboxLvl[hero.heroPos3+128].equals("wall") || hitboxLvl[hero.heroPos4+128].equals("wall") || hitboxLvl[hero.heroPos5+128].equals("wall") || hitboxLvl[hero.heroPos6+128].equals("wall"))) {
    hero.saut=true;
  }
  if (key==HAUT  && bonusDoubleJump.doubleJump==true && hero.jumping==true) {
    bonusDoubleJump.trigDoubleJump=true;
    //bonusDoubleJump.doubleJump=false;
  }
  if (key==GAUCHE || (key==HAUT &&  hero.lastMove==GAUCHE)) {
    if (hero.gauche==false && hero.droite==false && !hitboxLvl[hero.heroPos6-1].equals("wall") && !hitboxLvl[hero.heroPos12-1].equals("wall") && !hitboxLvl[hero.heroPos18-1].equals("wall")) {
      hero.gauche=true;
      hero.heroHitboxGauche();
      hero.previousX=hero.x;
    }
  }
  if (key==DROITE || (key==HAUT && hero.lastMove==DROITE)) {
    if (hero.droite==false && hero.gauche==false && !hitboxLvl[hero.heroPos1+1].equals("wall") && !hitboxLvl[hero.heroPos7+1].equals("wall") && !hitboxLvl[hero.heroPos13+1].equals("wall")) {
      hero.heroHitboxDroite();
      hero.droite=true;
      hero.previousX=hero.x;
    }
  }
  if (key=='m') {
    saveStrings("appletHitbox/Applet/lvl1.txt", hitboxLvl);
  }
  if (key=='j') {
    hero.y=500;
  }
}