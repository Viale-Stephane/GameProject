class Hero {
  protected int heroPos1, heroPos2, heroPos3, heroPos4, heroPos5, heroPos6, heroPos7, heroPos8, heroPos9, heroPos10, heroPos11, heroPos12, heroPos13, heroPos14, heroPos15, heroPos16, heroPos17, heroPos18;
  protected int x, y, previousX, previousY;
  public float vitX=8, vitY=2, mvt=0;
  public int nbWaitMvt=25;
  private int heroAnimCount=0, i=0, j=0, nbMontee=0, nbDescente=0;
  public boolean saut=false, jumping=false, droite=false, gauche=false, reset=true;
  public char lastMove;


  public void dessin() {
    if (reset==true) {
      for (int i=0; i<128*38; i++) {
        if (hitboxLvl[i].equals("hero")) { 
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
          reset=false;
        }
      }
    }
    rect(x, y, 8, 16);
    if (heroAnimCount<20) {
      image(heroRight1, x, y);
      heroAnimCount+=1;
    } else if (heroAnimCount<40 && heroAnimCount>=20) {
      image(heroRight2, x, y);
      heroAnimCount+=1;
    } else if (heroAnimCount>=40 && heroAnimCount<60) {
      image(heroRight3, x, y);
      heroAnimCount+=1;
    } else if (heroAnimCount>=60) {
      heroAnimCount=0;
      image(heroRight1, x, y);
    }
  }
  public void mvtGauche() {//42 >10

    if (hero.gauche==true && x>previousX-8) {//mvt d'une case
      x-=vitX;
      //if (heroAnimCount<20) {
      //image(heroRight1, x, y);
      //heroAnimCount+=1;
      //} else if (heroAnimCount<40 && heroAnimCount>=20) {
      //  image(heroRight2, x, y);
      //  heroAnimCount+=1;
      //} else if (heroAnimCount>=40 && heroAnimCount<60) {
      //  image(heroRight3, x, y);
      //  heroAnimCount+=1;
      //} else {
      //  heroAnimCount=0;
      //}
      lastMove=GAUCHE;
    } else {
      hero.gauche=false;
    }
  }
  public void heroHitbox() {
    hitboxLvl[hero.heroPos1]="hero";
    hitboxLvl[hero.heroPos2]="hero";
    hitboxLvl[hero.heroPos3]="hero";
    hitboxLvl[hero.heroPos4]="hero";
    hitboxLvl[hero.heroPos5]="hero";
    hitboxLvl[hero.heroPos6]="hero";
    hitboxLvl[hero.heroPos7]="hero";
    hitboxLvl[hero.heroPos8]="hero";
    hitboxLvl[hero.heroPos9]="hero";
    hitboxLvl[hero.heroPos10]="hero";
    hitboxLvl[hero.heroPos11]="hero";
    hitboxLvl[hero.heroPos12]="hero";
    hitboxLvl[hero.heroPos13]="hero";
    hitboxLvl[hero.heroPos14]="hero";
    hitboxLvl[hero.heroPos15]="hero";
    hitboxLvl[hero.heroPos16]="hero";
    hitboxLvl[hero.heroPos17]="hero";
    hitboxLvl[hero.heroPos18]="hero";
  }
  public void heroHitboxGauche() {
    hero.heroPos1-=1;
    hero.heroPos2-=1;
    hero.heroPos3-=1;
    hero.heroPos4-=1;
    hero.heroPos5-=1;
    hero.heroPos6-=1;
    hero.heroPos7-=1;
    hero.heroPos8-=1;
    hero.heroPos9-=1;
    hero.heroPos10-=1;
    hero.heroPos11-=1;
    hero.heroPos12-=1;
    hero.heroPos13-=1;
    hero.heroPos14-=1;
    hero.heroPos15-=1;
    hero.heroPos16-=1;
    hero.heroPos17-=1;
    hero.heroPos18-=1;
    contactSpike();
    contactBonusDoubleJump();
    heroHitbox();
    hitboxLvl[hero.heroPos1+1]="empty";
    hitboxLvl[hero.heroPos7+1]="empty";
    hitboxLvl[hero.heroPos13+1]="empty";
  }
  public void heroHitboxDroite() {
    hero.heroPos1+=1;
    hero.heroPos2+=1;
    hero.heroPos3+=1;
    hero.heroPos4+=1;
    hero.heroPos5+=1;
    hero.heroPos6+=1;
    hero.heroPos7+=1;
    hero.heroPos8+=1;
    hero.heroPos9+=1;
    hero.heroPos10+=1;
    hero.heroPos11+=1;
    hero.heroPos12+=1;
    hero.heroPos13+=1;
    hero.heroPos14+=1;
    hero.heroPos15+=1;
    hero.heroPos16+=1;
    hero.heroPos17+=1;
    hero.heroPos18+=1;
    contactSpike();
    contactBonusDoubleJump();
    heroHitbox();
    hitboxLvl[hero.heroPos6-1]="empty";
    hitboxLvl[hero.heroPos12-1]="empty";
    hitboxLvl[hero.heroPos18-1]="empty";
  }
  public void heroHitboxHaut() {
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
    contactSpike();
    contactBonusDoubleJump();
    heroHitbox();
    hitboxLvl[hero.heroPos1+128]="empty";
    hitboxLvl[hero.heroPos2+128]="empty";
    hitboxLvl[hero.heroPos3+128]="empty";
    hitboxLvl[hero.heroPos4+128]="empty";
    hitboxLvl[hero.heroPos5+128]="empty";
    hitboxLvl[hero.heroPos6+128]="empty";
  }
  public void heroHitboxChute() {
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
    contactSpike();
    contactBonusDoubleJump();
    heroHitbox();
    hitboxLvl[hero.heroPos18-128]="empty";
    hitboxLvl[hero.heroPos17-128]="empty";
    hitboxLvl[hero.heroPos16-128]="empty";
    hitboxLvl[hero.heroPos15-128]="empty";
    hitboxLvl[hero.heroPos14-128]="empty";
    hitboxLvl[hero.heroPos13-128]="empty";
  }

  public void mvtDroite() {
    if (hero.droite==true && x<previousX+8) {//mvt d'une case
      x+=vitX;
      //if (heroAnimCount<20) {
      //  image(heroRight1, x, y);
      //  heroAnimCount+=1;
      //} else if (heroAnimCount<40 && heroAnimCount>=20) {
      //  image(heroRight2, x, y);
      //  heroAnimCount+=1;
      //} else if (heroAnimCount>=40 && heroAnimCount<60) {
      //  image(heroRight3, x, y);
      //  heroAnimCount+=1;
      //} else if (heroAnimCount>=60) {
      //  heroAnimCount+=1;
      //} else {
      //  heroAnimCount=0;
      //}
      lastMove=DROITE;
    } else {
      hero.droite=false;
    }
  }
  public void contactSol() {
    if (nbMontee==0 && nbDescente==0 && !hitboxLvl[hero.heroPos1+128].equals("wall") && !hitboxLvl[hero.heroPos2+128].equals("wall") && !hitboxLvl[hero.heroPos3+128].equals("wall") && !hitboxLvl[hero.heroPos4+128].equals("wall") && !hitboxLvl[hero.heroPos5+128].equals("wall") && !hitboxLvl[hero.heroPos6+128].equals("wall") && saut==false && bonusDoubleJump.trigDoubleJump==false) {
      nbDescente=5;
    }
  }
  public void descente() {
    if (nbDescente>0 && i<16/pow(vitY,2) && !hitboxLvl[hero.heroPos1+128].equals("wall") && !hitboxLvl[hero.heroPos2+128].equals("wall") && !hitboxLvl[hero.heroPos3+128].equals("wall") && !hitboxLvl[hero.heroPos4+128].equals("wall") && !hitboxLvl[hero.heroPos5+128].equals("wall") && !hitboxLvl[hero.heroPos6+128].equals("wall")) {
      mvt+=pow(vitY-1,2);
      y+=pow(vitY-1,2);
      i++;
    } else if (i==16/pow(vitY,2)) {
      if (mvt<16) {
        y+=(16-mvt); 
        // println("lul");
      }

      i=0;
      mvt=0;
      heroHitboxChute();
      nbDescente--;
    } else {
      nbDescente=0;
    }
    if (hitboxLvl[hero.heroPos1+128].equals("wall") || hitboxLvl[hero.heroPos2+128].equals("wall") || hitboxLvl[hero.heroPos3+128].equals("wall") || hitboxLvl[hero.heroPos4+128].equals("wall") || hitboxLvl[hero.heroPos5+128].equals("wall") || hitboxLvl[hero.heroPos6+128].equals("wall")) {
      jumping=false;
      if (bonusDoubleJump.doubleJumpOn==true) {
        bonusDoubleJump.doubleJump=true;
      }
    } else {
      jumping=true;
      nbDescente=0;
      vitY=2;
    }
  }

  public void dash() {
    if (bonusDash.trigDash==true) {
      nbWaitMvt=3;
      vitX=100;
      if (lastMove==GAUCHE) {
        hero.gauche=true;
        mvtGauche();
      } else if (lastMove==DROITE) {
        hero.droite=true;
        mvtDroite();
      }
      bonusDash.trigDash=false;
      bonusDash.dash=false;
    }
    nbWaitMvt=25;
    vitX=8;
  }
  public void mvtHaut() {

    if (hero.saut==true && nbMontee==0) {
      nbMontee=5;
    }
    if (bonusDoubleJump.trigDoubleJump==true) {
      nbMontee=5;
    }
  }
  public void montee() {
    if (nbMontee>0 && j<16/vitY && !hitboxLvl[hero.heroPos18-128].equals("wall") && !hitboxLvl[hero.heroPos17-128].equals("wall") && !hitboxLvl[hero.heroPos16-128].equals("wall") && !hitboxLvl[hero.heroPos15-128].equals("wall") && !hitboxLvl[hero.heroPos14-128].equals("wall") && !hitboxLvl[hero.heroPos13-128].equals("wall")) {
      y-=vitY;
      mvt+=vitY;
      j++;
    } else if (j==16/vitY) {
      if (mvt<16) {
        y-=(16-mvt); 
      }
      mvt=0;
      nbMontee--;
      hero.saut=false;
      if (bonusDoubleJump.trigDoubleJump==true) {
        bonusDoubleJump.trigDoubleJump=false;
        bonusDoubleJump.doubleJump=false;
      }
      j=0;
      hero.heroHitboxHaut();
    } else {
      vitY=2;
      nbMontee=0;
    }
  }
  public void contactSpike() {
    if (hitboxLvl[hero.heroPos18].equals("spike") || hitboxLvl[heroPos17].equals("spike") || hitboxLvl[heroPos16].equals("spike") || hitboxLvl[heroPos15].equals("spike") || hitboxLvl[heroPos14].equals("spike") || hitboxLvl[heroPos13].equals("spike") || hitboxLvl[heroPos12].equals("spike") || hitboxLvl[heroPos11].equals("spike") || hitboxLvl[heroPos10].equals("spike") || hitboxLvl[heroPos9].equals("spike") || hitboxLvl[heroPos8].equals("spike") || hitboxLvl[heroPos7].equals("spike") || hitboxLvl[heroPos6].equals("spike") || hitboxLvl[heroPos5].equals("spike") || hitboxLvl[heroPos4].equals("spike") || hitboxLvl[heroPos4].equals("spike") || hitboxLvl[heroPos3].equals("spike") || hitboxLvl[heroPos2].equals("spike") || hitboxLvl[heroPos1].equals("spike")) {
      println("mort");
    }
  }
  public void contactBonusDoubleJump() {
    if (hitboxLvl[hero.heroPos18].equals("BJump") || hitboxLvl[heroPos17].equals("BJump") || hitboxLvl[heroPos16].equals("BJump") || hitboxLvl[heroPos15].equals("BJump") || hitboxLvl[heroPos14].equals("BJump") || hitboxLvl[heroPos13].equals("BJump") || hitboxLvl[heroPos12].equals("BJump") || hitboxLvl[heroPos11].equals("BJump") || hitboxLvl[heroPos10].equals("BJump") || hitboxLvl[heroPos9].equals("BJump") || hitboxLvl[heroPos8].equals("BJump") || hitboxLvl[heroPos7].equals("BJump") || hitboxLvl[heroPos6].equals("BJump") || hitboxLvl[heroPos5].equals("BJump") || hitboxLvl[heroPos4].equals("BJump") || hitboxLvl[heroPos4].equals("BJump") || hitboxLvl[heroPos3].equals("BJump") || hitboxLvl[heroPos2].equals("BJump") || hitboxLvl[heroPos1].equals("BJump")) {
      bonusDoubleJump.doubleJump=true;
      bonusDoubleJump.doubleJumpOn=true;
    }
  }
}