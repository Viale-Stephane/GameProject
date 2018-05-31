int x, y;
boolean isSaving=false;
String R="0", G="0", B="0";
boolean selectR=false, selectG=false, selectB=false, selectName=false, selectEnd=false, noClip=false;
String []type=new String[0];
String types="empty", lvl="lvl29", end="end", noClipValue="", musicChosen="";
PImage[] wallRed=new PImage[26], wallDarkBlue=new PImage[26], wallLightBlue=new PImage[26], wallGreen=new PImage[26], wallPurple=new PImage[26], spike=new PImage[20];
PImage img, save, door;
void setup() {
  size(1624, 900);
  for (int i=0; i<=25; i++) {
    wallRed[i]=loadImage("BLOCKS/Red/Red"+i+".png");
    wallDarkBlue[i]=loadImage("BLOCKS/DarkBlue/DarkBlue"+i+".png");
    wallLightBlue[i]=loadImage("BLOCKS/LightBlue/LightBlue"+i+".png");
    wallGreen[i]=loadImage("BLOCKS/Green/Green"+i+".png");
    wallPurple[i]=loadImage("BLOCKS/Purple/Purple"+i+".png");
  }
  for (int i=0; i<20; i++) {// BOTTOM/LEFT/TOP/RIGHT DB/G/LB/P/R
    spike[i]=loadImage("BLOCKS/spike/spike"+i+".png");
  }
  img=loadImage("BLOCKS/Empty.png");
  door=loadImage("BLOCKS/DOOR.png");
  frameRate(15);
  type=loadStrings("../../data/levels/lvlsHitbox/"+lvl+".txt");
  if (type.length!=128*38+1) {
    for (int i=0; i<128*38; i++) {
      type=append(type, types);
    }
    type=append(type, "musicRetroRide");
  }
  musicChosen=type[128*38];
}

void draw() {
  background(40, 10, 10);
  changeBackground();
  printImage();
}
void changeBackground() {
  if (R.length()==0 || G.length()==0 || B.length()==0) {
    fill(0, 0, 0);
  } else {
    fill(Integer.parseInt(R), Integer.parseInt(G), Integer.parseInt(B));
  }
  rect(50, 50, 1024, 600);
  fill(255, 255, 255, 100);
  stroke(255, 255, 255);
  fill(10, 10, 10);
  rect(80, 770, 170, 35, 5);
  rect(80, 810, 170, 35, 5);
  rect(80, 850, 170, 35, 5);
  fill(255, 255, 255);
  text("R : "+R, 100, 795);
  text("G : "+G, 100, 835);
  text("B : "+B, 100, 875);
  if (mousePressed==true && x>=80 && x<=250 && y>=770 && y<=805) {
    selectR=true;
    selectB=false;
    selectG=false;
    selectName=false;
    selectEnd=false;
  }
  if (mousePressed==true && x>=80 && x<=250 && y>=810 && y<=845) {
    selectG=true;
    selectR=false;
    selectB=false;
    selectName=false;
    selectEnd=false;
  }
  if (mousePressed==true && x>=80 && x<=250 && y>=850 && y<=885) {
    selectB=true;
    selectG=false;
    selectR=false;
    selectName=false;
    selectEnd=false;
  }
  if (selectR==true && keyPressed==true) {
    if (key==BACKSPACE && R.length()>0) {
      R=R.substring(0, R.length()-1);
    } else if (keyCode>=48 && keyCode<=57 && R.length()<3) {
      R+=key;
    }
  }
  if (selectG==true && keyPressed==true) {
    if (key==BACKSPACE && G.length()>0) {
      G=G.substring(0, G.length()-1);
    } else if (keyCode>=48 && keyCode<=57 && G.length()<3) {
      G+=key;
    }
  }
  if (selectB==true && keyPressed==true) {
    if (key==BACKSPACE && B.length()>0) {
      B=B.substring(0, B.length()-1);
    } else if (keyCode>=48 && keyCode<=57 && B.length()<3) {
      B+=key;
    }
  }
  if (R.length()==3 && Integer.parseInt(R)>255) {
    R="255";
  }
  if (G.length()==3 && Integer.parseInt(G)>255) {
    G="255";
  }
  if (B.length()==3 && Integer.parseInt(B)>255) {
    B="255";
  }
}
void hitbox() {
  x=mouseX;
  y=mouseY;
  if (noClip==true) {
    noClipValue="NoClip";
  } else {
    noClipValue="";
  }
  if (x>=1100 && x<=1132) {
    if (y>=50 && y<=82) {
      types="wallBottom"+noClipValue+"Purple";
    }
    if (y>=90 && y<=122) {
      types="wallBottomLeft"+noClipValue+"Purple";
    }
    if (y>=130 && y<=162) {
      types="wallBottomLeftCorner"+noClipValue+"Purple";
    }
    if (y>=170 && y<=202) {
      types="wallBottomRight"+noClipValue+"Purple";
    }
    if (y>=210 && y<=242) {
      types="wallBottomRightCorner"+noClipValue+"Purple";
    }
    if (y>=250 && y<=282) {
      types="wallCenter"+noClipValue+"Purple";
    }
    if (y>=290 && y<=322) {
      types="wallLeft"+noClipValue+"Purple";
    }
    if (y>=330 && y<=362) {
      types="emptywallLineBottom"+noClipValue+"Purple";
    }
    if (y>=370 && y<=402) {
      types="wallLineBottomLeft"+noClipValue+"Purple";
    }
    if (y>=410 && y<=442) {
      types="emptywallLineBottomLeftCorner"+noClipValue+"Purple";
    }
    if (y>=450 && y<=482) {
      types="emptywallLineBottomRight"+noClipValue+"Purple";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineBottomRightCorner"+noClipValue+"Purple";
    }
    if (y>=530 && y<=562) {
      types="wallLineLeft"+noClipValue+"Purple";
    }
  } else if (x>=1150 && x<=1182) {
    if (y>=530 && y<=562) {
      types="emptywallLineTopRightCorner"+noClipValue+"Purple";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineRight"+noClipValue+"Purple";
    }
    if (y>=450 && y<=482) {
      types="wallLineTop"+noClipValue+"Purple";
    }
    if (y>=410 && y<=442) {
      types="wallLineTopLeft"+noClipValue+"Purple";
    }
    if (y>=370 && y<=402) {
      types="wallLineTopLeftCorner"+noClipValue+"Purple";
    }
    if (y>=330 && y<=362) {
      types="wallLineTopRight"+noClipValue+"Purple";
    }
    if (y>=290 && y<=322) {
      types="wallChiseled"+noClipValue+"Purple";
    }
    if (y>=250 && y<=282) {
      types="wallRight"+noClipValue+"Purple";
    }
    if (y>=210 && y<=242) {
      types="wallTop"+noClipValue+"Purple";
    }
    if (y>=170 && y<=202) {
      types="wallTopLeft"+noClipValue+"Purple";
    }
    if (y>=130 && y<=162) {
      types="wallTopLeftCorner"+noClipValue+"Purple";
    }
    if (y>=90 && y<=122) {
      types="wallTopRight"+noClipValue+"Purple";
    }
    if (y>=50 && y<=82) {
      types="wallTopRightCorner"+noClipValue+"Purple";
    }
  } else if (x>=1200 && x<=1232) {
    if (y>=50 && y<=82) {
      types="wallBottom"+noClipValue+"Red";
    }
    if (y>=90 && y<=122) {
      types="wallBottomLeft"+noClipValue+"Red";
    }
    if (y>=130 && y<=162) {
      types="wallBottomLeftCorner"+noClipValue+"Red";
    }
    if (y>=170 && y<=202) {
      types="wallBottomRight"+noClipValue+"Red";
    }
    if (y>=210 && y<=242) {
      types="wallBottomRightCorner"+noClipValue+"Red";
    }
    if (y>=250 && y<=282) {
      types="wallCenter"+noClipValue+"Red";
    }
    if (y>=290 && y<=322) {
      types="wallLeft"+noClipValue+"Red";
    }
    if (y>=330 && y<=362) {
      types="emptywallLineBottom"+noClipValue+"Red";
    }
    if (y>=370 && y<=402) {
      types="wallLineBottomLeft"+noClipValue+"Red";
    }
    if (y>=410 && y<=442) {
      types="emptywallLineBottomLeftCorner"+noClipValue+"Red";
    }
    if (y>=450 && y<=482) {
      types="emptywallLineBottomRight"+noClipValue+"Red";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineBottomRightCorner"+noClipValue+"Red";
    }
    if (y>=530 && y<=562) {
      types="wallLineLeft"+noClipValue+"Red";
    }
  } else if (x>=1250 && x<=1282) {
    if (y>=530 && y<=562) {
      types="emptywallLineTopRightCorner"+noClipValue+"Red";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineRight"+noClipValue+"Red";
    }
    if (y>=450 && y<=482) {
      types="wallLineTop"+noClipValue+"Red";
    }
    if (y>=410 && y<=442) {
      types="wallLineTopLeft"+noClipValue+"Red";
    }
    if (y>=370 && y<=402) {
      types="wallLineTopLeftCorner"+noClipValue+"Red";
    }
    if (y>=330 && y<=362) {
      types="wallLineTopRight"+noClipValue+"Red";
    }
    if (y>=290 && y<=322) {
      types="wallChiseled"+noClipValue+"Red";
    }
    if (y>=250 && y<=282) {
      types="wallRight"+noClipValue+"Red";
    }
    if (y>=210 && y<=242) {
      types="wallTop"+noClipValue+"Red";
    }
    if (y>=170 && y<=202) {
      types="wallTopLeft"+noClipValue+"Red";
    }
    if (y>=130 && y<=162) {
      types="wallTopLeftCorner"+noClipValue+"Red";
    }
    if (y>=90 && y<=122) {
      types="wallTopRight"+noClipValue+"Red";
    }
    if (y>=50 && y<=82) {
      types="wallTopRightCorner"+noClipValue+"Red";
    }
  } else if (x>=1300 && x<=1332) {
    if (y>=50 && y<=82) {
      types="wallBottom"+noClipValue+"DarkBlue";
    }
    if (y>=90 && y<=122) {
      types="wallBottomLeft"+noClipValue+"DarkBlue";
    }
    if (y>=130 && y<=162) {
      types="wallBottomLeftCorner"+noClipValue+"DarkBlue";
    }
    if (y>=170 && y<=202) {
      types="wallBottomRight"+noClipValue+"DarkBlue";
    }
    if (y>=210 && y<=242) {
      types="wallBottomRightCorne"+noClipValue+"DarkBluer";
    }
    if (y>=250 && y<=282) {
      types="wallCenter"+noClipValue+"DarkBlue";
    }
    if (y>=290 && y<=322) {
      types="wallLeft"+noClipValue+"DarkBlue";
    }
    if (y>=330 && y<=362) {
      types="emptywallLineBottom"+noClipValue+"DarkBlue";
    }
    if (y>=370 && y<=402) {
      types="wallLineBottomLeft"+noClipValue+"DarkBlue";
    }
    if (y>=410 && y<=442) {
      types="emptywallLineBottomLeftCorner"+noClipValue+"DarkBlue";
    }
    if (y>=450 && y<=482) {
      types="emptywallLineBottomRight"+noClipValue+"DarkBlue";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineBottomRightCorner"+noClipValue+"DarkBlue";
    }
    if (y>=530 && y<=562) {
      types="wallLineLeft"+noClipValue+"DarkBlue";
    }
  } else if (x>=1350 && x<=1382) {
    if (y>=530 && y<=562) {
      types="emptywallLineTopRightCorner"+noClipValue+"DarkBlue";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineRight"+noClipValue+"DarkBlue";
    }
    if (y>=450 && y<=482) {
      types="wallLineTop"+noClipValue+"DarkBlue";
    }
    if (y>=410 && y<=442) {
      types="wallLineTopLeft"+noClipValue+"DarkBlue";
    }
    if (y>=370 && y<=402) {
      types="wallLineTopLeftCorner"+noClipValue+"DarkBlue";
    }
    if (y>=330 && y<=362) {
      types="wallLineTopRight"+noClipValue+"DarkBlue";
    }
    if (y>=290 && y<=322) {
      types="wallChiseled"+noClipValue+"DarkBlue";
    }
    if (y>=250 && y<=282) {
      types="wallRight"+noClipValue+"DarkBlue";
    }
    if (y>=210 && y<=242) {
      types="wallTop"+noClipValue+"DarkBlue";
    }
    if (y>=170 && y<=202) {
      types="wallTopLeft"+noClipValue+"DarkBlue";
    }
    if (y>=130 && y<=162) {
      types="wallTopLeftCorner"+noClipValue+"DarkBlue";
    }
    if (y>=90 && y<=122) {
      types="wallTopRight"+noClipValue+"DarkBlue";
    }
    if (y>=50 && y<=82) {
      types="wallTopRightCorner"+noClipValue+"DarkBlue";
    }
  } else if (x>=1400 && x<=1432) {
    if (y>=50 && y<=82) {
      types="wallBottom"+noClipValue+"LightBlue";
    }
    if (y>=90 && y<=122) {
      types="wallBottomLeft"+noClipValue+"LightBlue";
    }
    if (y>=130 && y<=162) {
      types="wallBottomLeftCorner"+noClipValue+"LightBlue";
    }
    if (y>=170 && y<=202) {
      types="wallBottomRight"+noClipValue+"LightBlue";
    }
    if (y>=210 && y<=242) {
      types="wallBottomRightCorner"+noClipValue+"LightBlue";
    }
    if (y>=250 && y<=282) {
      types="wallCenter"+noClipValue+"LightBlue";
    }
    if (y>=290 && y<=322) {
      types="wallLeft"+noClipValue+"LightBlue";
    }
    if (y>=330 && y<=362) {
      types="emptywallLineBottom"+noClipValue+"LightBlue";
    }
    if (y>=370 && y<=402) {
      types="wallLineBottomLeft"+noClipValue+"LightBlue";
    }
    if (y>=410 && y<=442) {
      types="emptywallLineBottomLeftCorner"+noClipValue+"LightBlue";
    }
    if (y>=450 && y<=482) {
      types="emptywallLineBottomRight"+noClipValue+"LightBlue";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineBottomRightCorner"+noClipValue+"LightBlue";
    }
    if (y>=530 && y<=562) {
      types="wallLineLeft"+noClipValue+"LightBlue";
    }
  } else if (x>=1450 && x<=1482) {
    if (y>=530 && y<=562) {
      types="emptywallLineTopRightCorner"+noClipValue+"LightBlue";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineRight"+noClipValue+"LightBlue";
    }
    if (y>=450 && y<=482) {
      types="wallLineTop"+noClipValue+"LightBlue";
    }
    if (y>=410 && y<=442) {
      types="wallLineTopLeft"+noClipValue+"LightBlue";
    }
    if (y>=370 && y<=402) {
      types="wallLineTopLeftCorner"+noClipValue+"LightBlue";
    }
    if (y>=330 && y<=362) {
      types="wallLineTopRight"+noClipValue+"LightBlue";
    }
    if (y>=290 && y<=322) {
      types="wallChiseled"+noClipValue+"LightBlue";
    }
    if (y>=250 && y<=282) {
      types="wallRight"+noClipValue+"LightBlue";
    }
    if (y>=210 && y<=242) {
      types="wallTop"+noClipValue+"LightBlue";
    }
    if (y>=170 && y<=202) {
      types="wallTopLeft"+noClipValue+"LightBlue";
    }
    if (y>=130 && y<=162) {
      types="wallTopLeftCorner"+noClipValue+"LightBlue";
    }
    if (y>=90 && y<=122) {
      types="wallTopRight"+noClipValue+"LightBlue";
    }
    if (y>=50 && y<=82) {
      types="wallTopRightCorner"+noClipValue+"LightBlue";
    }
  } else if (x>=1500 && x<=1532) {
    if (y>=50 && y<=82) {
      types="wallBottom"+noClipValue+"Green";
    }
    if (y>=90 && y<=122) {
      types="wallBottomLeft"+noClipValue+"Green";
    }
    if (y>=130 && y<=162) {
      types="wallBottomLeftCorner"+noClipValue+"Green";
    }
    if (y>=170 && y<=202) {
      types="wallBottomRight"+noClipValue+"Green";
    }
    if (y>=210 && y<=242) {
      types="wallBottomRightCorner"+noClipValue+"Green";
    }
    if (y>=250 && y<=282) {
      types="wallGreenCenter"+noClipValue+"";
    }
    if (y>=290 && y<=322) {
      types="wallLeft"+noClipValue+"Green";
    }
    if (y>=330 && y<=362) {
      types="emptywallLineBottom"+noClipValue+"Green";
    }
    if (y>=370 && y<=402) {
      types="wallLineBottomLeft"+noClipValue+"Green";
    }
    if (y>=410 && y<=442) {
      types="emptywallLineBottomLeftCorner"+noClipValue+"Green";
    }
    if (y>=450 && y<=482) {
      types="emptywallLineBottomRight"+noClipValue+"Green";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineBottomRightCorner"+noClipValue+"Green";
    }
    if (y>=530 && y<=562) {
      types="wallLineLeft"+noClipValue+"Green";
    }
  } else if (x>=1550 && x<=1582) {
    if (y>=530 && y<=562) {
      types="emptywallLineTopRightCorner"+noClipValue+"Green";
    }
    if (y>=490 && y<=522) {
      types="emptywallLineRight"+noClipValue+"Green";
    }
    if (y>=450 && y<=482) {
      types="wallLineTop"+noClipValue+"Green";
    }
    if (y>=410 && y<=442) {
      types="wallLineTopLeft"+noClipValue+"Green";
    }
    if (y>=370 && y<=402) {
      types="wallLineTopLeftCorner"+noClipValue+"Green";
    }
    if (y>=330 && y<=362) {
      types="wallLineTopRight"+noClipValue+"Green";
    }
    if (y>=290 && y<=322) {
      types="wallChiseled"+noClipValue+"Green";
    }
    if (y>=250 && y<=282) {
      types="wallRight"+noClipValue+"Green";
    }
    if (y>=210 && y<=242) {
      types="wallTop"+noClipValue+"Green";
    }
    if (y>=170 && y<=202) {
      types="wallTopLeft"+noClipValue+"Green";
    }
    if (y>=130 && y<=162) {
      types="wallTopLeftCorner"+noClipValue+"Green";
    }
    if (y>=90 && y<=122) {
      types="wallTopRight"+noClipValue+"Green";
    }
    if (y>=50 && y<=82) {
      types="wallTopRightCorner"+noClipValue+"Green";
    }
    if (y>=290 && y<=322) {
      types="wallChiseled"+noClipValue+"Green";
    }
  }
  ////////////////////////////////////////////////////////////////

  if (y>=630 && y<=662) {
    if (x>=1100 && x<=1132) {
      types="emptyspikeDarkBlueBottom";
    }
    if (x>=1140 && x<=1172) {
      types="spikeDarkBlueLeft";
    }
    if (x>=1180 && x<=1212) {
      types="spikeDarkBlueTop";
    }
    if (x>=1220 && x<=1252) {
      types="emptyspikeDarkBlueRight";
    }
    if (x>=1260 && x<=1292) {
      types="emptyspikeGreenBottom";
    }
    if (x>=1300 && x<=1332) {
      types="spikeGreenLeft";
    }
    if (x>=1340 && x<=1372) {
      types="spikeGreenTop";
    }
    if (x>=1380 && x<=1412) {
      types="emptyspikeGreenRight";
    }
    if (x>=1420 && x<=1452) {
      types="emptyspikeLightBlueBottom";
    }
    if (x>=1460 && x<=1492) {
      types="spikeLightBlueLeft";
    }
    if (x>=1500 && x<=1532) {
      types="spikeLightBlueTop";
    }
    if (x>=1540 && x<=1572) {
      types="emptyspikeLightBlueRight";
    }
  } else if (y>=670 && y<=702) {
    if (x>=1180 && x<=1212) {
      types="emptyspikePurpleBottom";
    }
    if (x>=1220 && x<=1252) {
      types="spikePurpleLeft";
    }
    if (x>=1260 && x<=1292) {
      types="spikePurpleTop";
    }
    if (x>=1300 && x<=1332) {
      types="emptyspikePurpleRight";
    }
    if (x>=1340 && x<=1372) {
      types="emptyspikeRedBottom";
    }
    if (x>=1380 && x<=1412) {
      types="spikeRedLeft";
    }
    if (x>=1420 && x<=1452) {
      types="spikeRedTop";
    }
    if (x>=1460 && x<=1492) {
      types="emptyspikeRedRight";
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////
  if (y>=573 && y<=618) {
    if (x>=1080 && x<=1125) {
      types="BJump";
    }
    if (x>=1135 && x<=1180) {
      types="empty";
    }
    if (x>=1190 && x<=1235) {
      types="BTP";
    }
    if (x>=1245 && x<=1290 && noClip==false) {
      noClip=true;
    } else if (x>=1245 && x<=1290 && noClip==true) {
      noClip=false;
    }
    if (x>=1300 && x<=1345) {
      types="BnoClip";
    }
    if (x>=1355 && x<=1400) {
      types="hero";
    }
    if (x>=1410 && x<=1455) {
      types="BDash";
    }
    if (x>=1465 && x<=1510) {
      types=end;
    }
    if (x>=1520 && x<=1565) {
      types="BGSwap";
    }
    if (x>=1575 && x<=1620) {
      types="BPoints";
    }
  }
  if (x>=1100 && x<=1164 && y>=720 && y<=784) {
    types="door"+end.substring(3, end.length());
    println(types);
  }
  if (x>=1170 && x<=1335) {
    if (y>=730 && y<=760) {
      type[128*38]="musicBurn";
      musicChosen="musicBurn";
    } else if (y>=765 && y<=795) {
      type[128*38]="musicColorPanic";
      musicChosen="musicColorPanic";
    } else if (y>=800 && y<=830) {
      type[128*38]="musicJourneyBegin";
      musicChosen="musicJourneyBegin";
    } else if (y>=835 && y<=865) {
      type[128*38]="musicNewPower";
      musicChosen="musicNewPower";
    }
  }
  if (x>=1340 && x<=1505) {
    if (y>=730 && y<=760) {
      type[128*38]="musicRetroRide";
      musicChosen="musicRetroRide";
    } else if (y>=765 && y<=795) {
      type[128*38]="musicRise";
      musicChosen="musicRise";
    } else if (y>=800 && y<=830) {
      type[128*38]="musicTheLastBattle";
      musicChosen="musicTheLastBattle";
    } else if (y>=835 && y<=865) {
      type[128*38]="musicTheOne";
      musicChosen="musicTheOne";
    }
  }
  if (x>=1510 && x<=1610 && y>=730 && y<=760) {
    type[128*38]="musicValk";
    musicChosen="musicValk";
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////

  if (x>=300 && x<=470 && y>=700 && y<=750) {
    saveStrings("../../data/levels/lvlsHitbox/"+lvl+".txt", type);
    isSaving=true;
  }
  if (x>=100 && x<=250 && y>=700 && y<=750) {
    File file = new File(dataPath("../../../data/levels/lvlsHitbox"));
    boolean doesLvlExist=false;
    String[] lvls = file.list(), empty=new String[128*38+1];
    for (int i=0; i<lvls.length; i++) {
      if (lvls[i].equals(lvl+".txt")) {
        doesLvlExist=true;
      }
    }
    if (doesLvlExist==false) {
      saveStrings("../../data/levels/lvlsHitbox/"+lvl+".txt", empty);
      isSaving=true;
    }
    type=loadStrings("../../data/levels/lvlsHitbox/"+lvl+".txt");
  }
  if (x>=300 && x<=470 && y>=770 && y<=820) {
    for (int i=0; i<128*38; i++) {
      type[i]="empty";
    }
  }
}
void printImage() {
  fill(0, 0, 0);
  rect(500, 700, 500, 50, 5);
  rect(500, 770, 500, 50, 5);
  fill(255, 255, 255);
  text("nom du fichier: "+lvl, 510, 730);
  text("niveau suivant: "+end, 510, 800);
  if (mousePressed==true && x>=500 && x<=1000 && y>=700 && y<=750) {
    selectName=true;
    selectR=false;
    selectG=false;
    selectB=false;
    selectEnd=false;
  }
  if (mousePressed==true && x>=500 && x<=1000 && y>=770 && y<=820) {
    selectName=false;
    selectR=false;
    selectG=false;
    selectB=false;
    selectEnd=true;
  }
  if (keyPressed==true && selectEnd==true) {
    if (key==BACKSPACE && end.length()>3) {
      end=end.substring(0, end.length()-1);
    } else if (end.length()<20 && ((keyCode>=48 && keyCode<=57) || (keyCode>=65 && keyCode<=90) ||(keyCode>=97 && keyCode<=122))) {
      end+=key;
    }
  }
  if (keyPressed==true && selectName==true) {
    if (key==BACKSPACE && lvl.length()>3) {
      lvl=lvl.substring(0, lvl.length()-1);
    } else if (end.length()<20 && ((keyCode>=48 && keyCode<=57) || (keyCode>=65 && keyCode<=90) ||(keyCode>=97 && keyCode<=122))) {
      lvl+=key;
    }
  }
  for (int i=0; i<13; i++) {
    image(wallPurple[i], 1100, (i*40)+50);
    image(wallPurple[25-i], 1150, i*40+50);
    image(wallRed[i], 1200, 50+i*40);
    image(wallRed[25-i], 1250, 50+i*40);
    image(wallDarkBlue[i], 1300, (i*40)+50);
    image(wallDarkBlue[25-i], 1350, (i*40)+50);
    image(wallLightBlue[i], 1400, (i*40)+50);
    image(wallLightBlue[25-i], 1450, (i*40)+50);
    image(wallGreen[i], 1500, (i*40)+50);
    image(wallGreen[25-i], 1550, (i*40)+50);
  }
  for (int i=0; i<12; i++) {
    stroke(0, 0, 0);
    rect(1100+(i*40), 630, 32, 32);
    image(spike[i], 1100+(i*40), 630);
  }
  for (int i=0; i<8; i++) {
    rect(1180+(i*40), 670, 32, 32);
    image(spike[12+i], 1180+(i*40), 670);
  }
  image(door, 1100, 720);
  fill(255, 255, 255);
  text("x="+x, 110, 685);
  text("y="+y, 210, 685);
  text("sauvegarde", 320, 730);
  text("actualiser", 120, 730);
  text("réinitialiser", 320, 800);
  text(types, 290, 685);
  textSize(13);
  text("BJump", 1083, 600);
  text("empty", 1139, 600);
  text("BTP", 1203, 600);
  if (noClip==true) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  text("noClip", 1248, 600);
  fill(255, 255, 255);
  textSize(12);
  text("BnoClip", 1300, 600);
  textSize(13);
  text("hero", 1363, 600);
  text("BDash", 1412, 600);
  text("end", 1475, 600);
  textSize(11);
  text("BGSwap", 1523, 600);
  textSize(13);
  text("BPoints", 1576, 600);
  stroke(255, 255, 0);
  fill(255, 255, 255, 20);
  rect(1300, 573, 45, 45);  //5 BnoClip

  stroke(0, 255, 0);
  fill(0, 255, 0, 100);
  rect(1080, 573, 45, 45); //1 bonusDoubleJump
  stroke(153, 0, 0);
  fill(153, 0, 0, 100);  
  rect(1410, 573, 45, 45); //7 BDash
  stroke(142, 64, 30);
  fill(142, 64, 30, 100);
  rect(1135, 573, 45, 45); //2 empty
  fill(140, 24, 202, 100);
  stroke(140, 24, 202);
  rect(1190, 573, 45, 45); //3 BTP
  stroke(255, 255, 255);
  fill(100, 100, 100, 100);
  rect(1245, 573, 45, 45); //4 noClip
  stroke(255, 20, 147);
  fill(255, 20, 147, 100);
  rect(1355, 573, 45, 45); //6 hero
  stroke(0, 255, 255);
  fill(0, 255, 255, 100);
  rect(1465, 573, 45, 45); //8 end
  fill(30, 87, 142, 100);
  stroke(30, 87, 142);
  rect(1520, 573, 45, 45); //9 BGSwap
  stroke(255, 255, 0);
  fill(255, 255, 0, 100);
  rect(1575, 573, 45, 45);   //10 BPoints
  stroke(255, 255, 255);
  fill(255, 255, 255, 100);
  rect(300, 700, 170, 50, 8);
  rect(100, 700, 150, 50, 8);
  rect(300, 770, 170, 50, 5);
  //---------------------------------------------------------//
  textSize(20);
  fill(0, 0, 0);
  switch(type[128*38]) {
  case "musicBurn":
    fill(0, 255, 0);
    text("Burn", 1230, 750);
    fill(0, 0, 0);
    text("Color Panic", 1200, 785);
    text("Journey Begins", 1185, 820);
    text("New Power", 1200, 855);
    text("Retro Ride", 1370, 750);
    text("Rise", 1400, 785);
    text("The Last Battle", 1350, 820);
    text("The One", 1380, 855);
    text("Valk", 1535, 750);
    break;
  case "musicColorPanic":
    text("Burn", 1230, 750);
    fill(0, 255, 0);
    text("Color Panic", 1200, 785);
    fill(0, 0, 0);
    text("Journey Begins", 1185, 820);
    text("New Power", 1200, 855);
    text("Retro Ride", 1370, 750);
    text("Rise", 1400, 785);
    text("The Last Battle", 1350, 820);
    text("The One", 1380, 855);
    text("Valk", 1535, 750);
    break;
  case"musicJourneyBegin":
    text("Burn", 1230, 750);
    text("Color Panic", 1200, 785);
    fill(0, 255, 0);
    text("Journey Begins", 1185, 820);
    fill(0, 0, 0);
    text("New Power", 1200, 855);
    text("Retro Ride", 1370, 750);
    text("Rise", 1400, 785);
    text("The Last Battle", 1350, 820);
    text("The One", 1380, 855);
    text("Valk", 1535, 750);
    break;
  case "musicNewPower":
    text("Burn", 1230, 750);
    text("Color Panic", 1200, 785);
    text("Journey Begins", 1185, 820);
    fill(0, 255, 0);
    text("New Power", 1200, 855);
    fill(0, 0, 0);
    text("Retro Ride", 1370, 750);
    text("Rise", 1400, 785);
    text("The Last Battle", 1350, 820);
    text("The One", 1380, 855);
    text("Valk", 1535, 750);
    break;
  case "musicRetroRide":
    text("Burn", 1230, 750);
    text("Color Panic", 1200, 785);
    text("Journey Begins", 1185, 820);
    text("New Power", 1200, 855);
    fill(0, 255, 0);
    text("Retro Ride", 1370, 750);
    fill(0, 0, 0);
    text("Rise", 1400, 785);
    text("The Last Battle", 1350, 820);
    text("The One", 1380, 855);
    text("Valk", 1535, 750);
    break;
  case "musicRise":
    text("Burn", 1230, 750);
    text("Color Panic", 1200, 785);
    text("Journey Begins", 1185, 820);
    text("New Power", 1200, 855);
    text("Retro Ride", 1370, 750);
    fill(0, 255, 0);
    text("Rise", 1400, 785);
    fill(0, 0, 0);
    text("The Last Battle", 1350, 820);
    text("The One", 1380, 855);
    text("Valk", 1535, 750);
    break;
  case"musicTheLastBattle":
    text("Burn", 1230, 750);
    text("Color Panic", 1200, 785);
    text("Journey Begins", 1185, 820);
    text("New Power", 1200, 855);
    text("Retro Ride", 1370, 750);
    text("Rise", 1400, 785);
    fill(0, 255, 0);
    text("The Last Battle", 1350, 820);
    fill(0, 0, 0);
    text("The One", 1380, 855);
    text("Valk", 1535, 750);
    break;
  case"musicTheOne":
    text("Burn", 1230, 750);
    text("Color Panic", 1200, 785);
    text("Journey Begins", 1185, 820);
    text("New Power", 1200, 855);
    text("Retro Ride", 1370, 750);
    text("Rise", 1400, 785);
    text("The Last Battle", 1350, 820);
    fill(0, 255, 0);
    text("The One", 1380, 855);
    fill(0, 0, 0);
    text("Valk", 1535, 750);
    break;
  case"musicValk":
    fill(0, 0, 0);
    text("Burn", 1230, 750);
    text("Color Panic", 1200, 785);
    text("Journey Begins", 1185, 820);
    text("New Power", 1200, 855);
    text("Retro Ride", 1370, 750);
    text("Rise", 1400, 785);
    text("The Last Battle", 1350, 820);
    text("The One", 1380, 855);
    fill(0, 255, 0);
    text("Valk", 1535, 750);
    break;
  default:
    fill(0, 255, 0);
    text("Burn", 1230, 750);
    fill(0, 0, 0);
    text("Color Panic", 1200, 785);
    text("Journey Begins", 1185, 820);
    text("New Power", 1200, 855);
    text("Retro Ride", 1370, 750);
    text("Rise", 1400, 785);
    text("The Last Battle", 1350, 820);
    text("The One", 1380, 855);
    text("Valk", 1535, 750);
    break;
  }
  fill(100, 100, 100, 100);
  stroke(255, 255, 255);
  rect(1170, 730, 165, 30);
  rect(1170, 765, 165, 30);
  rect(1170, 800, 165, 30);
  rect(1170, 835, 165, 30);
  rect(1340, 730, 165, 30);
  rect(1340, 765, 165, 30);
  rect(1340, 800, 165, 30);
  rect(1340, 835, 165, 30);
  rect(1510, 730, 100, 30);
  textSize(22);




  for (int i=0; i<128; i++) {
    for (int j=0; j<38; j++) {
      stroke(0);
      fill(255, 255, 255, 0);
      if (j<37 && i<125) {
        if (type[i+128*j].startsWith("emptywallLineTopRightCorner")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("walLineTopLeftCorner")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("wallLineTopRight")) {
          type[i+1+128*j]="wall";
          type[i+2+128*j]="wall";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="wall";
        } else if (type[i+128*j].startsWith("wallLineTopLeft")) {
          type[i+1+128*j]="wall";
          type[i+2+128*j]="wall";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (i%4==0 && j%2==0 && j<37 && i<125 && type[i+128*j].startsWith("wallLineTop")) { 
          type[i+1+128*j]="wall";
          type[i+2+128*j]="wall";
          type[i+3+128*j]="wall";
        } else if (j<37 && i<128 && type[i+128*j].startsWith("emptywallLineBottomLeftCorner")) {
          type[i+128*(j+1)]="wall";
        } else if (j<37 && i<125 && type[i+128*j].startsWith("emptyWallBottomRightCorner")) {
          type[i+3+128*(j+1)]="wall";
        } else if (i%4==0 && j%2==0 && j<37 && i<125 && type[i+128*j].startsWith("wallLineBottomLeft")) {
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="wall";
          type[i+2+128*(j+1)]="wall";
          type[i+3+128*(j+1)]="wall";
        } else if (i%4== 0 && j%2==0 && j<37 && i<125 && type[i+128*j].startsWith("emptywallLineBottomRight")) {
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="wall";
          type[i+2+128*(j+1)]="wall";
        } else if (i%4==0 && j%2==0 && j<37 && i<125 && type[i+128*j].startsWith("emptywallLineBottom")) {
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="wall";
          type[i+2+128*(j+1)]="wall";
          type[i+3+128*(j+1)]="wall";
          type[i+3+128*(j+1)]="wall";
        } else if (j<37 && type[i+128*j].startsWith("wallLineLeft")) {
          type[i+128*(j+1)]="wall";
        } else if (j<37 && i<125 && type[i+128*j].startsWith("emptywallLineRight")) {
          type[i+3+128*j]="wall";
          type[i+3+128*(j+1)]="wall";
        } else if (i%4==0 && j%2==0 &&j<37 && type[i+128*j].startsWith("wall") && !type[i+128*j].startsWith("wallNoClip")) {
          type[i+1+128*j]="wall";
          type[i+2+128*j]="wall";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="wall";
          type[i+2+128*(j+1)]="wall";
          type[i+3+128*(j+1)]="wall";
        } else if (i%4==0 && j%2==0 && j<37 && type[i+128*j].startsWith("wallNoClip")) {//&& type[i%4+128*j].startsWith("wall") && j<37){
          type[i+1+128*j]="wallNoClip";
          type[i+2+128*j]="wallNoClip";
          type[i+3+128*j]="wallNoClip";
          type[i+128*(j+1)]="wallNoClip";
          type[i+1+128*(j+1)]="wallNoClip";
          type[i+2+128*(j+1)]="wallNoClip";
          type[i+3+128*(j+1)]="wallNoClip";
        } else if (i%4==0 && type[i+128*j].startsWith("spike") && type[i+128*j].endsWith("Top")) {
          type[i+1+128*j]="spike";
          type[i+2+128*j]="spike";
          type[i+3+128*j]="spike";
        } else if (i%4==0 && j%2==0 && j<37 && type[i+128*j].startsWith("emptyspike") && type[i+128*j].endsWith("Bottom")) {
          type[i+128*(j+1)]="spike";
          type[i+1+128*(j+1)]="spike";
          type[i+2+128*(j+1)]="spike";
          type[i+3+128*(j+1)]="spike";
        } else if (j%2==0 && j<37 && type[i+128*j].startsWith("spike") && type[i+128*j].endsWith("Left")) {
          type[i+1+128*j]="spike";
          type[i+128*(j+1)]="spike";
          type[i+1+128*(j+1)]="spike";
        } else if (j%2==0 && j<37 && type[i+128*j].startsWith("emptyspike") && type[i+128*j].endsWith("Right")) {
          type[i+2+128*j]="spike";
          type[i+3+128*j]="spike";
          type[i+2+128*(j+1)]="spike";
          type[i+3+128*(j+1)]="spike";
        } else if (i%4==0 && j%2==0 && j<37 && i<125 && type[i+128*j].equals("empty") && (type[i+1+128*j].startsWith("wall") || type[i+1+128*j].startsWith("emptywall") || type[i+1+128*j].startsWith("spike") ||type[i+1+128*j].startsWith("emptyspike") ||type[i+2+128*j].startsWith("wall") || type[i+2+128*j].startsWith("emptywall") || type[i+2+128*j].startsWith("spike") ||type[i+2+128*j].startsWith("emptyspike") ||type[i+3+128*j].startsWith("wall") || type[i+3+128*j].startsWith("emptywall")|| type[i+3+128*j].startsWith("spike") ||type[i+3+128*j].startsWith("emptyspike") ||type[i+128*(j+1)].startsWith("wall") ||type[i+128*(j+1)].startsWith("emptywall") || type[i+128*(j+1)].startsWith("spike") ||type[i+128*(j+1)].startsWith("emptyspike") ||type[i+1+128*(j+1)].startsWith("wall") ||type[i+1+128*(j+1)].startsWith("emptywall") || type[i+1+128*(j+1)].startsWith("spike") ||type[i+1+128*(j+1)].startsWith("emptyspike") ||type[i+2+128*(j+1)].startsWith("wall") || type[i+2+128*(j+1)].startsWith("emptywall") || type[i+2+128*(j+1)].startsWith("spike") ||type[i+2+128*(j+1)].startsWith("emptyspike") || type[i+3+128*(j+1)].startsWith("wall") ||type[i+3+128*(j+1)].startsWith("emptywall") || type[i+3+128*(j+1)].startsWith("spike") ||type[i+3+128*(j+1)].startsWith("emptyspike"))) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (i%8==0 && j%4==0 && j<35 && i<121 && type[i+128*j].startsWith("door")) {
          for (int k=1; k<8; k++) {
            for (int l=0; l<4; l++) {
              type[i+k+128*(j+l)]="end"+type[i+128*j].substring(4, type[i+128*j].length());
            }
          }
          type[i+128*(j+1)]="end"+type[i+128*j].substring(4, type[i+128*j].length());
          type[i+128*(j+2)]="end"+type[i+128*j].substring(4, type[i+128*j].length());
          type[i+128*(j+3)]="end"+type[i+128*j].substring(4, type[i+128*j].length());
        }
        if (x>50+8*i && x<50+(8*i+8) && y>50+16*j && y<50+(16*j+16) && x<1074 && y<=650) {
          type[i+128*j]=types;
        }

        //////////////////////////////////////////////////////////////////////////
        if (type[i+128*j].equals("emptyspikeDarkBlueBottom") || type[i+128*j]=="emptyspikeDarkBlueBottom") {
          img=spike[0];
        } else if (type[i+128*j].equals("spikeDarkBlueLeft") || type[i+128*j]=="spikeDarkBlueLeft") {
          img=spike[1];
        } else if (type[i+128*j].equals("spikeDarkBlueTop") || type[i+128*j]=="spikeDarkBlueTop") {
          img=spike[2];
        } else if (type[i+128*j].equals("emptyspikeDarkBlueRight") || type[i+128*j]=="emptyspikeDarkBlueRight") {
          img=spike[3];
        } else if (type[i+128*j].equals("emptyspikeGreenBottom") || type[i+128*j]=="emptyspikeGreenBottom") {
          img=spike[4];
        } else if (type[i+128*j].equals("spikeGreenLeft") || type[i+128*j]=="spikeGreenLeft") {
          img=spike[5];
        } else if (type[i+128*j].equals("spikeGreenTop") || type[i+128*j]=="spikeGreenTop") {
          img=spike[6];
        } else if (type[i+128*j].equals("emptyspikeGreenRight") ||type[i+128*j]=="emptyspikeGreenRight") {
          img=spike[7];
        } else if (type[i+128*j].equals("emptyspikeLightBlueBottom") ||type[i+128*j]=="emptyspikeLightBlueBottom") {
          img=spike[8];
        } else if (type[i+128*j].equals("spikeLightBlueLeft") || type[i+128*j]=="spikeLightBlueLeft") {
          img=spike[9];
        } else if (type[i+128*j].equals("spikeLightBlueTop") || type[i+128*j]=="spikeLightBlueTop") {
          img=spike[10];
        } else if (type[i+128*j].equals("emptyspikeLightBlueRight") || type[i+128*j]=="emptyspikeLightBlueRight") {
          img=spike[11];
        } else if (type[i+128*j].equals("emptyspikePurpleBottom") || type[i+128*j]=="emptyspikePurpleBottom") {
          img=spike[12];
        } else if (type[i+128*j].equals("spikePurpleLeft") || type[i+128*j]=="spikePurpleLeft") {
          img=spike[13];
        } else if (type[i+128*j].equals("spikePurpleTop") || type[i+128*j]=="spikePurpleTop") {
          img=spike[14];
        } else if (type[i+128*j].equals("emptyspikePurpleRight") || type[i+128*j]=="emptyspikePurpleRight") {
          img=spike[15];
        } else if (type[i+128*j].equals("emptyspikeRedBottom") || type[i+128*j]=="emptyspikeRedBottom") {
          img=spike[16];
        } else if (type[i+128*j].equals("spikeRedLeft") || type[i+128*j]=="spikeRedLeft") {
          img=spike[17];
        } else if (type[i+128*j].equals("spikeRedTop") || type[i+128*j]=="spikeRedTop") {
          img=spike[18];
        } else if (type[i+128*j].equals("emptyspikeRedRight") || type[i+128*j]=="emptyspikeRedRight") {
          img=spike[19];
          /////////////////////////////////////////////////////////////////////////////////////////
        } else if (type[i+128*j].equals("wallBottomPurple") || type[i+128*j]=="wallBottomPurple") {
          img=wallPurple[0];
        } else if (type[i+128*j].equals("wallBottomLeftPurple") || type[i+128*j]=="wallBottomLeftPurple") {
          img=wallPurple[1];
        } else if (type[i+128*j].equals("wallBottomLeftCornerPurple") || type[i+128*j]=="wallBottomLeftCornerPurple") {
          img=wallPurple[2];
        } else if (type[i+128*j].equals("wallBottomRightPurple") || type[i+128*j]=="wallBottomRightPurple") {
          img=wallPurple[3];
        } else if (type[i+128*j].equals("wallBottomRightCornerPurple") || type[i+128*j]=="wallBottomRightCornerPurple") {
          img=wallPurple[4];
        } else if (type[i+128*j].equals("wallCenterPurple") || type[i+128*j]=="wallCenterPurple") {
          img=wallPurple[5];
        } else if (type[i+128*j].equals("wallLeftPurple") || type[i+128*j]=="wallLeftPurple") {
          img=wallPurple[6];
        } else if (type[i+128*j].equals("emptywallLineBottomPurple") || type[i+128*j]=="emptywallLineBottomPurple") {
          img=wallPurple[7];
        } else if (type[i+128*j].equals("wallLineBottomLeftPurple") || type[i+128*j]=="wallLineBottomLeftPurple") {
          img=wallPurple[8];
        } else if (type[i+128*j].equals("emptywallLineBottomLeftCornerPurple") || type[i+128*j]=="emptywallLineBottomLeftCornerPurple") {
          img=wallPurple[9];
        } else if (type[i+128*j].equals("emptywallLineBottomRightPurple") ||type[i+128*j]=="emptywallLineBottomRightPurple") {
          img=wallPurple[10];
        } else if (type[i+128*j].equals("emptywallLineBottomRightCornerPurple") || type[i+128*j]=="emptywallLineBottomRightCornerPurple") {
          img=wallPurple[11];
        } else if (type[i+128*j].equals("wallLineLeftPurple") || type[i+128*j]=="wallLineLeftPurple") {
          img=wallPurple[12];
        } else if (type[i+128*j].equals("emptywallLineRightPurple") || type[i+128*j]=="emptywallLineRightPurple") {
          img=wallPurple[14];
        } else if (type[i+128*j].equals("wallLineTopPurple") || type[i+128*j]=="wallLineTopPurple") {
          img=wallPurple[15];
        } else if (type[i+128*j].equals("wallLineTopLeftPurple") || type[i+128*j]=="wallLineTopLeftPurple") {
          img=wallPurple[16];
        } else if (type[i+128*j].equals("wallLineTopLeftCornerPurple") || type[i+128*j]=="wallLineTopLeftCornerPurple") {
          img=wallPurple[17];
        } else if (type[i+128*j].equals("wallLineTopRightPurple") || type[i+128*j]=="wallLineTopRightPurple") {
          img=wallPurple[18];
        } else if (type[i+128*j].equals("emptywallLineTopRightCornerPurple") || type[i+128*j]=="emptywallLineTopRightCornerPurple") {
          img=wallPurple[13];
        } else if (type[i+128*j].equals("emptywallRightPurple") ||type[i+128*j]=="emptywallRightPurple") {
          img=wallPurple[20];
        } else if (type[i+128*j].equals("wallTopPurple") ||type[i+128*j]=="wallTopPurple") {
          img=wallPurple[21];
        } else if (type[i+128*j].equals("wallTopLeftPurple") || type[i+128*j]=="wallTopLeftPurple") {
          img=wallPurple[22];
        } else if (type[i+128*j].equals("wallTopLeftCornerPurple") || type[i+128*j]=="wallTopLeftCornerPurple") {
          img=wallPurple[23];
        } else if (type[i+128*j].equals("wallTopRightPurple") || type[i+128*j]=="wallTopRightPurple") {
          img=wallPurple[24];
        } else if (type[i+128*j].equals("wallTopRightCornerPurple") || type[i+128*j]=="wallTopRightCornerPurple") {
          img=wallPurple[25];
        } else if (type[i+128*j].equals("wallChiseledPurple") || type[i+128*j]=="wallCiseledPurple") {
          img=wallPurple[19];
        } else if (type[i+128*j].equals("wallBottomRed") || type[i+128*j]=="wallBottomRed") {
          img=wallRed[0];
        } else if (type[i+128*j].equals("wallBottomLeftRed") || type[i+128*j]=="wallBottomLeftRed") {
          img=wallRed[1];
        } else if (type[i+128*j].equals("wallBottomLeftCornerRed") || type[i+128*j]=="wallBottomLeftCornerRed") {
          img=wallRed[2];
        } else if (type[i+128*j].equals("wallBottomRightRed") || type[i+128*j]=="wallBottomRightRed") {
          img=wallRed[3];
        } else if (type[i+128*j].equals("wallBottomRightCornerRed") || type[i+128*j]=="wallBottomRightCornerRed") {
          img=wallRed[4];
        } else if (type[i+128*j].equals("wallCenterRed") || type[i+128*j]=="wallCenterRed") {
          img=wallRed[5];
        } else if (type[i+128*j].equals("wallLeftRed") || type[i+128*j]=="wallLeftRed") {
          img=wallRed[6];
        } else if (type[i+128*j].equals("emptywallLineBottomRed") || type[i+128*j]=="emptywallLineBottomRed") {
          img=wallRed[7];
        } else if (type[i+128*j].equals("wallLineBottomLeftRed") || type[i+128*j]=="wallLineBottomLeftRed") {
          img=wallRed[8];
        } else if (type[i+128*j].equals("emptywallLineBottomLeftCornerRed") || type[i+128*j]=="emptywallLineBottomLeftCornerRed") {
          img=wallRed[9];
        } else if (type[i+128*j].equals("emptywallLineBottomRightRed") ||type[i+128*j]=="emptywallLineBottomRightRed") {
          img=wallRed[10];
        } else if (type[i+128*j].equals("emptywallLineBottomRightCornerRed") || type[i+128*j]=="emptywallLineBottomRightCornerRed") {
          img=wallRed[11];
        } else if (type[i+128*j].equals("wallLineLeftRed") || type[i+128*j]=="wallLineLeftRed") {
          img=wallRed[12];
        } else if (type[i+128*j].equals("emptywallLineRightRed") || type[i+128*j]=="emptywallLineRightRed") {
          img=wallRed[14];
        } else if (type[i+128*j].equals("wallLineTopRed") || type[i+128*j]=="wallLineTopRed") {
          img=wallRed[15];
        } else if (type[i+128*j].equals("wallLineTopLeftRed") || type[i+128*j]=="wallLineTopLeftRed") {
          img=wallRed[16];
        } else if (type[i+128*j].equals("wallLineTopLeftCornerRed") || type[i+128*j]=="wallLineTopLeftCornerRed") {
          img=wallRed[17];
        } else if (type[i+128*j].equals("wallLineTopRightRed") || type[i+128*j]=="wallLineTopRightRed") {
          img=wallRed[18];
        } else if (type[i+128*j].equals("emptywallLineTopRightCornerRed") || type[i+128*j]=="emptywallLineTopRightCornerRed") {
          img=wallRed[13];
        } else if (type[i+128*j].equals("emptywallRightRed") ||type[i+128*j]=="emptywallRightRed") {
          img=wallRed[20];
        } else if (type[i+128*j].equals("wallTopRed") ||type[i+128*j]=="wallTopRed") {
          img=wallRed[21];
        } else if (type[i+128*j].equals("wallTopLeftRed") || type[i+128*j]=="wallTopLeftRed") {
          img=wallRed[22];
        } else if (type[i+128*j].equals("wallTopLeftCornerRed") || type[i+128*j]=="wallTopLeftCornerRed") {
          img=wallRed[23];
        } else if (type[i+128*j].equals("wallTopRightRed") || type[i+128*j]=="wallTopRightRed") {
          img=wallRed[24];
        } else if (type[i+128*j].equals("emptywallTopRightCornerRed") || type[i+128*j]=="emptywallTopRightCornerRed") {
          img=wallRed[25];
        } else if (type[i+128*j].equals("wallChiseledRed") ||type[i+128*j]=="wallChiseledRed") {
          img=wallRed[19];
        } else if (type[i+128*j].equals("wallBottomDarkBlue") || type[i+128*j]=="wallBottomDarkBlue") {
          img=wallDarkBlue[0];
        } else if (type[i+128*j].equals("wallBottomLeftDarkBlue") || type[i+128*j]=="wallBottomLeftDarkBlue") {
          img=wallDarkBlue[1];
        } else if (type[i+128*j].equals("wallBottomLeftCornerDarkBlue") || type[i+128*j]=="wallBottomLeftCornerDarkBlue") {
          img=wallDarkBlue[2];
        } else if (type[i+128*j].equals("wallBottomRightDarkBlue") || type[i+128*j]=="wallBottomRightDarkBlue") {
          img=wallDarkBlue[3];
        } else if (type[i+128*j].equals("wallBottomRightCornerDarkBlue") || type[i+128*j]=="wallBottomRightCornerDarkBlue") {
          img=wallDarkBlue[4];
        } else if (type[i+128*j].equals("wallCenterDarkBlue") || type[i+128*j]=="wallCenterDarkBlue") {
          img=wallDarkBlue[5];
        } else if (type[i+128*j].equals("wallLeftDarkBlue") || type[i+128*j]=="wallLeftDarkBlue") {
          img=wallDarkBlue[6];
        } else if (type[i+128*j].equals("emptywallLineBottomDarkBlue") || type[i+128*j]=="emptywallLineBottomDarkBlue") {
          img=wallDarkBlue[7];
        } else if (type[i+128*j].equals("wallLineBottomLeftDarkBlue") || type[i+128*j]=="wallLineBottomLeftDarkBlue") {
          img=wallDarkBlue[8];
        } else if (type[i+128*j].equals("emptywallLineBottomLeftCornerDarkBlue") || type[i+128*j]=="emptywallLineBottomLeftCornerDarkBlue") {
          img=wallDarkBlue[9];
        } else if (type[i+128*j].equals("emptywallLineBottomRightDarkBlue") ||type[i+128*j]=="emptywallLineBottomRightDarkBlue") {
          img=wallDarkBlue[10];
        } else if (type[i+128*j].equals("emptywallLineBottomRightCornerDarkBlue") || type[i+128*j]=="emptywallLineBottomRightCornerDarkBlue") {
          img=wallDarkBlue[11];
        } else if (type[i+128*j].equals("wallLineLeftDarkBlue") || type[i+128*j]=="wallLineLeftDarkBlue") {
          img=wallDarkBlue[12];
        } else if (type[i+128*j].equals("emptywallLineRightDarkBlue") || type[i+128*j]=="emptywallLineRightDarkBlue") {
          img=wallDarkBlue[14];
        } else if (type[i+128*j].equals("wallLineTopDarkBlue") || type[i+128*j]=="wallLineTopDarkBlue") {
          img=wallDarkBlue[15];
        } else if (type[i+128*j].equals("wallLineTopLeftDarkBlue") || type[i+128*j]=="wallLineTopLeftDarkBlue") {
          img=wallDarkBlue[16];
        } else if (type[i+128*j].equals("wallLineTopLeftCornerDarkBlue") || type[i+128*j]=="wallLineTopLeftCornerDarkBlue") {
          img=wallDarkBlue[17];
        } else if (type[i+128*j].equals("wallLineTopRightDarkBlue") || type[i+128*j]=="wallLineTopRightDarkBlue") {
          img=wallDarkBlue[18];
        } else if (type[i+128*j].equals("emptywallLineTopRightCornerDarkBlue") || type[i+128*j]=="emptywallDLineTopRightCornerarkBlue") {
          img=wallDarkBlue[13];
        } else if (type[i+128*j].equals("wallRightDarkBlue") ||type[i+128*j]=="wallRightDarkBlue") {
          img=wallDarkBlue[20];
        } else if (type[i+128*j].equals("wallTopDarkBlue") ||type[i+128*j]=="wallTopDarkBlue") {
          img=wallDarkBlue[21];
        } else if (type[i+128*j].equals("wallTopLeftDarkBlue") || type[i+128*j]=="wallTopLeftDarkBlue") {
          img=wallDarkBlue[22];
        } else if (type[i+128*j].equals("wallTopLeftCornerDarkBlue") || type[i+128*j]=="wallTopLeftCornerDarkBlue") {
          img=wallDarkBlue[23];
        } else if (type[i+128*j].equals("wallTopRightDarkBlue") || type[i+128*j]=="wallTopRightDarkBlue") {
          img=wallDarkBlue[24];
        } else if (type[i+128*j].equals("wallDarkBlueTopRightCorner") || type[i+128*j]=="wallDarkBlueTopRightCorner") {
          img=wallDarkBlue[25];
        } else if (type[i+128*j].equals("wallChiseledDarkBlue") ||type[i+128*j]=="wallChiseledDarkBlue") {
          img=wallDarkBlue[19];
        } else if (type[i+128*j].equals("wallBottomLightBlue") || type[i+128*j]=="wallBottomLightBlue") {
          img=wallLightBlue[0];
        } else if (type[i+128*j].equals("wallBottomLeftLightBlue") || type[i+128*j]=="wallBottomLeftLightBlue") {
          img=wallLightBlue[1];
        } else if (type[i+128*j].equals("wallBottomLeftCornerLightBlue") || type[i+128*j]=="wallBottomLeftCornerLightBlue") {
          img=wallLightBlue[2];
        } else if (type[i+128*j].equals("wallBottomRightLightBlue") || type[i+128*j]=="wallBottomRightLightBlue") {
          img=wallLightBlue[3];
        } else if (type[i+128*j].equals("wallBottomRightCornerLightBlue") || type[i+128*j]=="wallBottomRightCornerLightBlue") {
          img=wallLightBlue[4];
        } else if (type[i+128*j].equals("wallCenterLightBlue") || type[i+128*j]=="wallCenterLightBlue") {
          img=wallLightBlue[5];
        } else if (type[i+128*j].equals("wallLeftLightBlue") || type[i+128*j]=="wallLeftLightBlue") {
          img=wallLightBlue[6];
        } else if (type[i+128*j].equals("emptywallLineBottomLightBlue") || type[i+128*j]=="emptywallLineBottomLightBlue") {
          img=wallLightBlue[7];
        } else if (type[i+128*j].equals("wallLineBottomLeftLightBlue") || type[i+128*j]=="wallLineBottomLeftLightBlue") {
          img=wallLightBlue[8];
        } else if (type[i+128*j].equals("emptywallLineBottomLeftCornerLightBlue") || type[i+128*j]=="emptywallLineBottomLeftCornerLightBlue") {
          img=wallLightBlue[9];
        } else if (type[i+128*j].equals("emptywallLineBottomRightLightBlue") ||type[i+128*j]=="emptywallLineBottomRightLightBlue") {
          img=wallLightBlue[10];
        } else if (type[i+128*j].equals("emptywallLineBottomRightCornerLightBlue") || type[i+128*j]=="emptywallLineBottomRightCornerLightBlue") {
          img=wallLightBlue[11];
        } else if (type[i+128*j].equals("wallLineLeftLightBlue") || type[i+128*j]=="wallLineLeftLightBlue") {
          img=wallLightBlue[12];
        } else if (type[i+128*j].equals("emptywallLineRightLightBlue") || type[i+128*j]=="emptywallLineRightLightBlue") {
          img=wallLightBlue[14];
        } else if (type[i+128*j].equals("wallLineTopLightBlue") || type[i+128*j]=="wallLineTopLightBlue") {
          img=wallLightBlue[15];
        } else if (type[i+128*j].equals("wallLineTopLeftLightBlue") || type[i+128*j]=="wallLineTopLeftLightBlue") {
          img=wallLightBlue[16];
        } else if (type[i+128*j].equals("wallLineTopLeftCornerLightBlue") || type[i+128*j]=="wallLineTopLeftCornerLightBlue") {
          img=wallLightBlue[17];
        } else if (type[i+128*j].equals("wallLineTopRightLightBlue") || type[i+128*j]=="wallLineTopRightLightBlue") {
          img=wallLightBlue[18];
        } else if (type[i+128*j].equals("emptywallLineTopRightCornerLightBlue") || type[i+128*j]=="emptywallLineTopRightCornerLightBlue") {
          img=wallLightBlue[13];
        } else if (type[i+128*j].equals("wallRightLightBlue") ||type[i+128*j]=="wallRightLightBlue") {
          img=wallLightBlue[20];
        } else if (type[i+128*j].equals("wallTopLightBlue") ||type[i+128*j]=="wallTopLightBlue") {
          img=wallLightBlue[21];
        } else if (type[i+128*j].equals("wallTopLeftLightBlue") || type[i+128*j]=="wallTopLeftLightBlue") {
          img=wallLightBlue[22];
        } else if (type[i+128*j].equals("wallTopLeftCornerLightBlue") || type[i+128*j]=="wallTopLeftCornerLightBlue") {
          img=wallLightBlue[23];
        } else if (type[i+128*j].equals("wallTopRightLightBlue") || type[i+128*j]=="wallTopRightLightBlue") {
          img=wallLightBlue[24];
        } else if (type[i+128*j].equals("wallTopRightCornerLightBlue") || type[i+128*j]=="wallTopRightCornerLightBlue") {
          img=wallLightBlue[25];
        } else if (type[i+128*j].equals("wallChiseledLightBlue") ||type[i+128*j]=="wallChiseledLightBlue") {
          img=wallLightBlue[19];
        } else if (type[i+128*j].equals("wallBottomGreen") || type[i+128*j]=="wallBottomGreen") {
          img=wallGreen[0];
        } else if (type[i+128*j].equals("wallBottomLeftGreen") || type[i+128*j]=="wallBottomLeftGreen") {
          img=wallGreen[1];
        } else if (type[i+128*j].equals("wallBottomLeftCornerGreen") || type[i+128*j]=="wallBottomLeftCornerGreen") {
          img=wallGreen[2];
        } else if (type[i+128*j].equals("wallBottomRightGreen") || type[i+128*j]=="wallBottomRightGreen") {
          img=wallGreen[3];
        } else if (type[i+128*j].equals("wallBottomRightCornerGreen") || type[i+128*j]=="wallBottomRightCornerGreen") {
          img=wallGreen[4];
        } else if (type[i+128*j].equals("wallCenterGreen") || type[i+128*j]=="wallCenterGreen") {
          img=wallGreen[5];
        } else if (type[i+128*j].equals("wallLeftGreen") || type[i+128*j]=="wallLeftGreen") {
          img=wallGreen[6];
        } else if (type[i+128*j].equals("emptywallLineBottomGreen") || type[i+128*j]=="emptywallLineBottomGreen") {
          img=wallGreen[7];
        } else if (type[i+128*j].equals("wallLineBottomLeftGreen") || type[i+128*j]=="wallLineBottomLeftGreen") {
          img=wallGreen[8];
        } else if (type[i+128*j].equals("emptywallLineBottomLeftCornerGreen") || type[i+128*j]=="emptywallLineBottomLeftCornerGreen") {
          img=wallGreen[9];
        } else if (type[i+128*j].equals("emptywallLineBottomRightGreen") ||type[i+128*j]=="emptywallLineBottomRightGreen") {
          img=wallGreen[10];
        } else if (type[i+128*j].equals("emptywallLineBottomRightCornerGreen") || type[i+128*j]=="emptywallLineBottomRightCornerGreen") {
          img=wallGreen[11];
        } else if (type[i+128*j].equals("wallLineLeftGreen") || type[i+128*j]=="wallLineLeftGreen") {
          img=wallGreen[12];
        } else if (type[i+128*j].equals("emptywallLineRightGreen") || type[i+128*j]=="emptywallLineRightGreen") {
          img=wallGreen[14];
        } else if (type[i+128*j].equals("wallLineTopGreen") || type[i+128*j]=="wallLineTopGreen") {
          img=wallGreen[15];
        } else if (type[i+128*j].equals("wallLineTopLeftGreen") || type[i+128*j]=="wallLineTopLeftGreen") {
          img=wallGreen[16];
        } else if (type[i+128*j].equals("wallLineTopLeftCornerGreen") || type[i+128*j]=="wallLineTopLeftCornerGreen") {
          img=wallGreen[17];
        } else if (type[i+128*j].equals("wallLineTopRightGreen") || type[i+128*j]=="wallLineTopRightGreen") {
          img=wallGreen[18];
        } else if (type[i+128*j].equals("emptywallLineTopRightCornerGreen") || type[i+128*j]=="emptywallLineTopRightCornerGreen") {
          img=wallGreen[13];
        } else if (type[i+128*j].equals("wallRightGreen") ||type[i+128*j]=="wallRightGreen") {
          img=wallGreen[20];
        } else if (type[i+128*j].equals("wallTopGreen") ||type[i+128*j]=="wallTopGreen") {
          img=wallGreen[21];
        } else if (type[i+128*j].equals("wallTopLeftGreen") || type[i+128*j]=="wallTopLeftGreen") {
          img=wallGreen[22];
        } else if (type[i+128*j].equals("wallTopLeftCornerGreen") || type[i+128*j]=="wallTopLeftCornerGreen") {
          img=wallGreen[23];
        } else if (type[i+128*j].equals("wallTopRightGreen") || type[i+128*j]=="wallTopRightGreen") {
          img=wallGreen[24];
        } else if (type[i+128*j].equals("wallTopRightCornerGreen") || type[i+128*j]=="wallTopRightCornerGreen") {
          img=wallGreen[25];
        } else if (type[i+128*j].equals("wallChiseledGreen") ||type[i+128*j]=="wallChiseledGreen") {
          img=wallGreen[19];
        } else if (type[i+128*j].equals("wallNoClipBottomPurple") || type[i+128*j]=="wallNoClipBottomPurple") {
          img=wallPurple[0];
        } else if (type[i+128*j].equals("wallNoClipBottomLeftPurple") || type[i+128*j]=="wallNoClipBottomLeftPurple") {
          img=wallPurple[1];
        } else if (type[i+128*j].equals("wallNoClipBottomLeftCornerPurple") || type[i+128*j]=="wallNoClipBottomLeftCornerPurple") {
          img=wallPurple[2];
        } else if (type[i+128*j].equals("wallNoClipBottomRightPurple") || type[i+128*j]=="wallNoClipBottomRightPurple") { ///////////////--------------------------------------------------------------------/////////
          img=wallPurple[3];
        } else if (type[i+128*j].equals("wallNoClipPurpleBottomRightCorner") || type[i+128*j]=="wallNoClipPurpleBottomRightCorner") {
          img=wallPurple[4];
        } else if (type[i+128*j].equals("wallNoClipPurpleCenter") || type[i+128*j]=="wallNoClipPurpleCenter") {
          img=wallPurple[5];
        } else if (type[i+128*j].equals("wallNoClipPurpleLeft") || type[i+128*j]=="wallNoClipPurpleLeft") {
          img=wallPurple[6];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineBottom") || type[i+128*j]=="wallNoClipPurpleLineBottom") {
          img=wallPurple[7];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineBottomLeft") || type[i+128*j]=="wallNoClipPurpleLineBottomLeft") {
          img=wallPurple[8];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineBottomLeftCorner") || type[i+128*j]=="wallNoClipPurpleLineBottomLeftCorner") {
          img=wallPurple[9];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineBottomRight") ||type[i+128*j]=="wallNoClipPurpleLineBottomRight") {
          img=wallPurple[10];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineBottomRightCorner") || type[i+128*j]=="wallNoClipPurpleLineBottomRightCorner") {
          img=wallPurple[11];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineLeft") || type[i+128*j]=="wallNoClipPurpleLineLeft") {
          img=wallPurple[12];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineRight") || type[i+128*j]=="wallNoClipPurpleLineRight") {
          img=wallPurple[14];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineTop") || type[i+128*j]=="wallNoClipPurpleLineTop") {
          img=wallPurple[15];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineTopLeft") || type[i+128*j]=="wallNoClipPurpleLineTopLeft") {
          img=wallPurple[16];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineTopLeftCorner") || type[i+128*j]=="wallNoClipPurpleLineTopLeftCorner") {
          img=wallPurple[17];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineTopRight") || type[i+128*j]=="wallNoClipPurpleLineTopRight") {
          img=wallPurple[18];
        } else if (type[i+128*j].equals("wallNoClipPurpleLineTopRightCorner") || type[i+128*j]=="wallNoClipPurpleLineTopRightCorner") {
          img=wallPurple[13];
        } else if (type[i+128*j].equals("wallNoClipPurpleRight") ||type[i+128*j]=="wallNoClipPurpleRight") {
          img=wallPurple[20];
        } else if (type[i+128*j].equals("wallNoClipPurpleTop") ||type[i+128*j]=="wallNoClipPurpleTop") {
          img=wallPurple[21];
        } else if (type[i+128*j].equals("wallNoClipPurpleTopLeft") || type[i+128*j]=="wallNoClipPurpleTopLeft") {
          img=wallPurple[22];
        } else if (type[i+128*j].equals("wallNoClipPurpleTopLeftCorner") || type[i+128*j]=="wallNoClipPurpleTopLeftCorner") {
          img=wallPurple[23];
        } else if (type[i+128*j].equals("wallNoClipPurpleTopRight") || type[i+128*j]=="wallNoClipPurpleTopRight") {
          img=wallPurple[24];
        } else if (type[i+128*j].equals("wallNoClipPurpleTopRightCorner") || type[i+128*j]=="wallNoClipPurpleTopRightCorner") {
          img=wallPurple[25];
        } else if (type[i+128*j].equals("wallNoClipPurpleChiseled") || type[i+128*j]=="wallNoClipPurpleCiseled") {
          img=wallPurple[19];
        } else if (type[i+128*j].equals("wallNoClipRedBottom") || type[i+128*j]=="wallNoClipRedBottom") {
          img=wallRed[0];
        } else if (type[i+128*j].equals("wallNoClipRedBottomLeft") || type[i+128*j]=="wallNoClipRedBottomLeft") {
          img=wallRed[1];
        } else if (type[i+128*j].equals("wallNoClipRedBottomLeftCorner") || type[i+128*j]=="wallNoClipRedBottomLeftCorner") {
          img=wallRed[2];
        } else if (type[i+128*j].equals("wallNoClipRedBottomRight") || type[i+128*j]=="wallNoClipRedBottomRight") {
          img=wallRed[3];
        } else if (type[i+128*j].equals("wallNoClipRedBottomRightCorner") || type[i+128*j]=="wallNoClipRedBottomRightCorner") {
          img=wallRed[4];
        } else if (type[i+128*j].equals("wallNoClipRedCenter") || type[i+128*j]=="wallNoClipRedCenter") {
          img=wallRed[5];
        } else if (type[i+128*j].equals("wallNoClipRedLeft") || type[i+128*j]=="wallNoClipRedLeft") {
          img=wallRed[6];
        } else if (type[i+128*j].equals("wallNoClipRedLineBottom") || type[i+128*j]=="wallNoClipRedLineBottom") {
          img=wallRed[7];
        } else if (type[i+128*j].equals("wallNoClipRedLineBottomLeft") || type[i+128*j]=="wallNoClipRedLineBottomLeft") {
          img=wallRed[8];
        } else if (type[i+128*j].equals("wallNoClipRedLineBottomLeftCorner") || type[i+128*j]=="wallNoClipRedLineBottomLeftCorner") {
          img=wallRed[9];
        } else if (type[i+128*j].equals("wallNoClipRedLineBottomRight") ||type[i+128*j]=="wallNoClipRedLineBottomRight") {
          img=wallRed[10];
        } else if (type[i+128*j].equals("wallNoClipRedLineBottomRightCorner") || type[i+128*j]=="wallNoClipRedLineBottomRightCorner") {
          img=wallRed[11];
        } else if (type[i+128*j].equals("wallNoClipRedLineLeft") || type[i+128*j]=="wallNoClipRedLineLeft") {
          img=wallRed[12];
        } else if (type[i+128*j].equals("wallNoClipRedLineRight") || type[i+128*j]=="wallNoClipRedLineRight") {
          img=wallRed[14];
        } else if (type[i+128*j].equals("wallNoClipRedLineTop") || type[i+128*j]=="wallNoClipRedLineTop") {
          img=wallRed[15];
        } else if (type[i+128*j].equals("wallNoClipRedLineTopLeft") || type[i+128*j]=="wallNoClipRedLineTopLeft") {
          img=wallRed[16];
        } else if (type[i+128*j].equals("wallNoClipRedLineTopLeftCorner") || type[i+128*j]=="wallNoClipRedLineTopLeftCorner") {
          img=wallRed[17];
        } else if (type[i+128*j].equals("wallNoClipRedLineTopRight") || type[i+128*j]=="wallNoClipRedLineTopRight") {
          img=wallRed[18];
        } else if (type[i+128*j].equals("wallNoClipRedLineTopRightCorner") || type[i+128*j]=="wallNoClipRedLineTopRightCorner") {
          img=wallRed[13];
        } else if (type[i+128*j].equals("wallNoClipRedRight") ||type[i+128*j]=="wallNoClipRedRight") {
          img=wallRed[20];
        } else if (type[i+128*j].equals("wallNoClipRedTop") ||type[i+128*j]=="wallNoClipRedTop") {
          img=wallRed[21];
        } else if (type[i+128*j].equals("wallNoClipRedTopLeft") || type[i+128*j]=="wallNoClipRedTopLeft") {
          img=wallRed[22];
        } else if (type[i+128*j].equals("wallNoClipRedTopLeftCorner") || type[i+128*j]=="wallNoClipRedTopLeftCorner") {
          img=wallRed[23];
        } else if (type[i+128*j].equals("wallNoClipRedTopRight") || type[i+128*j]=="wallNoClipRedTopRight") {
          img=wallRed[24];
        } else if (type[i+128*j].equals("wallNoClipRedTopRightCorner") || type[i+128*j]=="wallNoClipRedTopRightCorner") {
          img=wallRed[25];
        } else if (type[i+128*j].equals("wallNoClipRedChiseled") ||type[i+128*j]=="wallNoClipRedChiseled") {
          img=wallRed[19];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueBottom") || type[i+128*j]=="wallNoClipDarkBlueBottom") {
          img=wallDarkBlue[0];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueBottomLeft") || type[i+128*j]=="wallNoClipDarkBlueBottomLeft") {
          img=wallDarkBlue[1];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueBottomLeftCorner") || type[i+128*j]=="wallNoClipDarkBlueBottomLeftCorner") {
          img=wallDarkBlue[2];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueBottomRight") || type[i+128*j]=="wallNoClipDarkBlueBottomRight") {
          img=wallDarkBlue[3];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueBottomRightCorner") || type[i+128*j]=="wall"+noClipValue+"DarkBlueBottomRightCorner") {
          img=wallDarkBlue[4];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueCenter") || type[i+128*j]=="wallNoClipDarkBlueCenter") {
          img=wallDarkBlue[5];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLeft") || type[i+128*j]=="wallNoClipDarkBlueLeft") {
          img=wallDarkBlue[6];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineBottom") || type[i+128*j]=="wallNoClipDarkBlueLineBottom") {
          img=wallDarkBlue[7];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineBottomLeft") || type[i+128*j]=="wallNoClipDarkBlueLineBottomLeft") {
          img=wallDarkBlue[8];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineBottomLeftCorner") || type[i+128*j]=="wallNoClipDarkBlueLineBottomLeftCorner") {
          img=wallDarkBlue[9];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineBottomRight") ||type[i+128*j]=="wallNoClipDarkBlueLineBottomRight") {
          img=wallDarkBlue[10];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineBottomRightCorner") || type[i+128*j]=="wallNoClipDarkBlueLineBottomRightCorner") {
          img=wallDarkBlue[11];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineLeft") || type[i+128*j]=="wallNoClipDarkBlueLineLeft") {
          img=wallDarkBlue[12];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineRight") || type[i+128*j]=="wallNoClipDarkBlueLineRight") {
          img=wallDarkBlue[14];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineTop") || type[i+128*j]=="wallNoClipDarkBlueLineTop") {
          img=wallDarkBlue[15];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineTopLeft") || type[i+128*j]=="wallNoClipDarkBlueLineTopLeft") {
          img=wallDarkBlue[16];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineTopLeftCorner") || type[i+128*j]=="wallNoClipDarkBlueLineTopLeftCorner") {
          img=wallDarkBlue[17];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineTopRight") || type[i+128*j]=="wallNoClipDarkBlueLineTopRight") {
          img=wallDarkBlue[18];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueLineTopRightCorner") || type[i+128*j]=="wallNoClipDarkBlueLineTopRightCorner") {
          img=wallDarkBlue[13];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueRight") ||type[i+128*j]=="wallNoClipDarkBlueRight") {
          img=wallDarkBlue[20];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueTop") ||type[i+128*j]=="wallNoClipDarkBlueTop") {
          img=wallDarkBlue[21];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueTopLeft") || type[i+128*j]=="wallNoClipDarkBlueTopLeft") {
          img=wallDarkBlue[22];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueTopLeftCorner") || type[i+128*j]=="wallNoClipDarkBlueTopLeftCorner") {
          img=wallDarkBlue[23];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueTopRight") || type[i+128*j]=="wallNoClipDarkBlueTopRight") {
          img=wallDarkBlue[24];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueTopRightCorner") || type[i+128*j]=="wallNoClipDarkBlueTopRightCorner") {
          img=wallDarkBlue[25];
        } else if (type[i+128*j].equals("wallNoClipDarkBlueChiseled") ||type[i+128*j]=="wallNoClipDarkBlueChiseled") {
          img=wallDarkBlue[19];
        } else if (type[i+128*j].equals("wallNoClipLightBlueBottom") || type[i+128*j]=="wallNoClipLightBlueBottom") {
          img=wallLightBlue[0];
        } else if (type[i+128*j].equals("wallNoClipLightBlueBottomLeft") || type[i+128*j]=="wallNoClipLightBlueBottomLeft") {
          img=wallLightBlue[1];
        } else if (type[i+128*j].equals("wallNoClipLightBlueBottomLeftCorner") || type[i+128*j]=="wallNoClipLightBlueBottomLeftCorner") {
          img=wallLightBlue[2];
        } else if (type[i+128*j].equals("wallNoClipLightBlueBottomRight") || type[i+128*j]=="wallNoClipLightBlueBottomRight") {
          img=wallLightBlue[3];
        } else if (type[i+128*j].equals("wallNoClipLightBlueBottomRightCorner") || type[i+128*j]=="wallNoClipLightBlueBottomRightCorner") {
          img=wallLightBlue[4];
        } else if (type[i+128*j].equals("wallNoClipLightBlueCenter") || type[i+128*j]=="wallNoClipLightBlueCenter") {
          img=wallLightBlue[5];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLeft") || type[i+128*j]=="wallNoClipLightBlueLeft") {
          img=wallLightBlue[6];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineBottom") || type[i+128*j]=="wallNoClipLightBlueLineBottom") {
          img=wallLightBlue[7];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineBottomLeft") || type[i+128*j]=="wallNoClipLightBlueLineBottomLeft") {
          img=wallLightBlue[8];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineBottomLeftCorner") || type[i+128*j]=="wallNoClipLightBlueLineBottomLeftCorner") {
          img=wallLightBlue[9];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineBottomRight") ||type[i+128*j]=="wallLightBlueLineBottomRight") {
          img=wallLightBlue[10];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineBottomRightCorner") || type[i+128*j]=="wallNoClipLightBlueLineBottomRightCorner") {
          img=wallLightBlue[11];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineLeft") || type[i+128*j]=="wallNoClipLightBlueLineLeft") {
          img=wallLightBlue[12];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineRight") || type[i+128*j]=="wallNoClipLightBlueLineRight") {
          img=wallLightBlue[14];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineTop") || type[i+128*j]=="wallNoClipLightBlueLineTop") {
          img=wallLightBlue[15];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineTopLeft") || type[i+128*j]=="wallNoClipLightBlueLineTopLeft") {
          img=wallLightBlue[16];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineTopLeftCorner") || type[i+128*j]=="wallNoClipLightBlueLineTopLeftCorner") {
          img=wallLightBlue[17];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineTopRight") || type[i+128*j]=="wallNoClipLightBlueLineTopRight") {
          img=wallLightBlue[18];
        } else if (type[i+128*j].equals("wallNoClipLightBlueLineTopRightCorner") || type[i+128*j]=="wallNoClipLightBlueLineTopRightCorner") {
          img=wallLightBlue[13];
        } else if (type[i+128*j].equals("wallNoClipLightBlueRight") ||type[i+128*j]=="wallNoClipLightBlueRight") {
          img=wallLightBlue[20];
        } else if (type[i+128*j].equals("wallNoClipLightBlueTop") ||type[i+128*j]=="wallNoClipLightBlueTop") {
          img=wallLightBlue[21];
        } else if (type[i+128*j].equals("wallNoClipLightBlueTopLeft") || type[i+128*j]=="wallNoClipLightBlueTopLeft") {
          img=wallLightBlue[22];
        } else if (type[i+128*j].equals("wallNoClipLightBlueTopLeftCorner") || type[i+128*j]=="wallNoClipLightBlueTopLeftCorner") {
          img=wallLightBlue[23];
        } else if (type[i+128*j].equals("wallNoClipLightBlueTopRight") || type[i+128*j]=="wallNoClipLightBlueTopRight") {
          img=wallLightBlue[24];
        } else if (type[i+128*j].equals("wallNoClipLightBlueTopRightCorner") || type[i+128*j]=="wallNoClipLightBlueTopRightCorner") {
          img=wallLightBlue[25];
        } else if (type[i+128*j].equals("wallNoClipLightBlueChiseled") ||type[i+128*j]=="wallNoClipLightBlueChiseled") {
          img=wallLightBlue[19];
        } else if (type[i+128*j].equals("wallNoClipGreenBottom") || type[i+128*j]=="wallNoClipGreenBottom") {
          img=wallGreen[0];
        } else if (type[i+128*j].equals("wallNoClipGreenBottomLeft") || type[i+128*j]=="wallNoClipGreenBottomLeft") {
          img=wallGreen[1];
        } else if (type[i+128*j].equals("wallNoClipGreenBottomLeftCorner") || type[i+128*j]=="wallNoClipGreenBottomLeftCorner") {
          img=wallGreen[2];
        } else if (type[i+128*j].equals("wallNoClipGreenBottomRight") || type[i+128*j]=="wallNoClipGreenBottomRight") {
          img=wallGreen[3];
        } else if (type[i+128*j].equals("wallNoClipGreenBottomRightCorner") || type[i+128*j]=="wallNoClipGreenBottomRightCorner") {
          img=wallGreen[4];
        } else if (type[i+128*j].equals("wallNoClipGreenCenter") || type[i+128*j]=="wallNoClipGreenCenter") {
          img=wallGreen[5];
        } else if (type[i+128*j].equals("wallNoClipGreenLeft") || type[i+128*j]=="wallNoClipGreenLeft") {
          img=wallGreen[6];
        } else if (type[i+128*j].equals("wallNoClipGreenLineBottom") || type[i+128*j]=="wallNoClipGreenLineBottom") {
          img=wallGreen[7];
        } else if (type[i+128*j].equals("wallNoClipGreenLineBottomLeft") || type[i+128*j]=="wallNoClipGreenLineBottomLeft") {
          img=wallGreen[8];
        } else if (type[i+128*j].equals("wallNoClipGreenLineBottomLeftCorner") || type[i+128*j]=="wallNoClipGreenLineBottomLeftCorner") {
          img=wallGreen[9];
        } else if (type[i+128*j].equals("wallNoClipGreenLineBottomRight") ||type[i+128*j]=="wallNoClipGreenLineBottomRight") {
          img=wallGreen[10];
        } else if (type[i+128*j].equals("wallNoClipGreenLineBottomRightCorner") || type[i+128*j]=="wallNoClipGreenLineBottomRightCorner") {
          img=wallGreen[11];
        } else if (type[i+128*j].equals("wallNoClipGreenLineLeft") || type[i+128*j]=="wallNoClipGreenLineLeft") {
          img=wallGreen[12];
        } else if (type[i+128*j].equals("wallNoClipGreenLineRight") || type[i+128*j]=="wallNoClipGreenLineRight") {
          img=wallGreen[14];
        } else if (type[i+128*j].equals("wallNoClipGreenLineTop") || type[i+128*j]=="wallNoClipGreenLineTop") {
          img=wallGreen[15];
        } else if (type[i+128*j].equals("wallNoClipGreenLineTopLeft") || type[i+128*j]=="wallNoClipGreenLineTopLeft") {
          img=wallGreen[16];
        } else if (type[i+128*j].equals("wallNoClipGreenLineTopLeftCorner") || type[i+128*j]=="wallNoClipGreenLineTopLeftCorner") {
          img=wallGreen[17];
        } else if (type[i+128*j].equals("wallNoClipGreenLineTopRight") || type[i+128*j]=="wallNoClipGreenLineTopRight") {
          img=wallGreen[18];
        } else if (type[i+128*j].equals("wallNoClipGreenLineTopRightCorner") || type[i+128*j]=="wallNoClipGreenLineTopRightCorner") {
          img=wallGreen[13];
        } else if (type[i+128*j].equals("wallNoClipGreenRight") ||type[i+128*j]=="wallNoClipGreenRight") {
          img=wallGreen[20];
        } else if (type[i+128*j].equals("wallNoClipGreenTop") ||type[i+128*j]=="wallNoClipGreenTop") {
          img=wallGreen[21];
        } else if (type[i+128*j].equals("wallNoClipGreenTopLeft") || type[i+128*j]=="wallNoClipGreenTopLeft") {
          img=wallGreen[22];
        } else if (type[i+128*j].equals("wallNoClipGreenTopLeftCorner") || type[i+128*j]=="wallNoClipGreenTopLeftCorner") {
          img=wallGreen[23];
        } else if (type[i+128*j].equals("wallNoClipGreenTopRight") || type[i+128*j]=="wallNoClipGreenTopRight") {
          img=wallGreen[24];
        } else if (type[i+128*j].equals("wallNoClipGreenTopRightCorner") || type[i+128*j]=="wallNoClipGreenTopRightCorner") {
          img=wallGreen[25];
        } else if (type[i+128*j].equals("wallNoClipGreenChiseled") ||type[i+128*j]=="wallNoClipGreenChiseled") {
          img=wallGreen[19];
        } else if (type[i+128*j].startsWith("door") ||type[i+128*j].startsWith("door")) {
          img=door;
        }
        if (type[i+128*j].equals("BJump") || type[i+128*j]=="BJump") {
          fill(0, 255, 0, 150);
        } else if (type[i+128*j].equals("BnoClip") || type[i+128*j]=="BnoClip") {
          fill(255, 255, 255);
        } else if (type[i+128*j].equals("BTP") || type[i+128*j]=="BTP") {
          fill(140, 24, 202, 150);
        } else if (type[i+128*j].equals("BDash") || type[i+128*j]=="BDash") {
          fill(255, 0, 0, 150);
        } else if (type[i+128*j].startsWith("empty") || type[i+128*j]=="empty") {//||){ type[i+128*j]=="emptyspikeRedRight" || type[i+128*j]=="emptyspikePurpleBottom") {
          if (R.length()==0 || G.length()==0 || B.length()==0) {
          } else {
            fill(Integer.parseInt(R), Integer.parseInt(G), Integer.parseInt(B));//fill(152,64,30);
          }
        } else if (type[i+128*j].equals("noClip") || type[i+128*j]=="noClip") {
          fill(100, 100, 100, 150);
        } else if (type[i+128*j].equals("hero") || type[i+128*j]=="hero") {
          fill(255, 20, 147, 150);
        } else if (type[i+128*j].startsWith("end") || type[i+128*j].startsWith("end")) {
          fill(0, 255, 255, 150);
        } else if (type[i+128*j].equals("BGSwap") || type[i+128*j]=="BGSwap") {
          fill(30, 87, 142, 150);
        } else if (type[i+128*j].equals("BPoints") ||type[i+128*j]=="BPoints") {
          fill(255, 255, 0, 150);
        }
        if ((!type[i+128*j].equals("wall") && !type[i+128*j].equals("wallNoClip") && type[i+128*j].startsWith("wall")) || (!type[i+128*j].equals("spike") && type[i+128*j].startsWith("spike")) || (!type[i+128*j].equals("spike") && type[i+128*j].startsWith("emptyspike")) ||type[i+128*j].startsWith("door") || type[i+128*j].startsWith("emptywall")) {
          image(img, 50+8*i, 50+16*j);
        }
        if (isSaving==false) {
          if (R.length()!=0 && G.length()!=0 && B.length()!=0 && Integer.parseInt(R)!=120 && Integer.parseInt(G)!=100 && Integer.parseInt(B)!=100) {
            stroke(120, 100, 100);
          } else {
            stroke(150, 130, 130);
          }
          if ( type[i+128*j].startsWith("wallNoClip")) {
            fill(100, 100, 100, 150);
          }
          rect(50+8*i, 50+16*j, 8, 16);
          stroke(0, 0, 0);
        }
      }
    }
    if (isSaving==true) {
      isSaving=false;
      save=get(50, 50, 1024, 599);
      save.save("../../data/levels/lvlsPrint/"+lvl+".png");
    }
  }



  void mousePressed() {
    //click();
    hitbox();
  }

  void mouseDragged() {
    hitbox();
    //click();
  }
