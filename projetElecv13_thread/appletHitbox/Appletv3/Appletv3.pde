int x, y;
boolean isSaving=false;
String R="0", G="0", B="0";
boolean selectR=false, selectG=false, selectB=false, selectName=false, selectEnd=false, noClip=false;
String []type=new String[0];
String types="empty", lvl="lvl1", end="end", noClipValue="";
PImage[] wallRed=new PImage[26], wallDarkBlue=new PImage[26], wallLightBlue=new PImage[26], wallGreen=new PImage[26], wallPurple=new PImage[26], spike=new PImage[20];
PImage img, save;
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
  frameRate(15);
  type=loadStrings("../../data/levels/lvlsHitbox/"+lvl+".txt");
  if (type.length!=128*38) {
    for (int i=0; i<128*38; i++) {
      type=append(type, types);
    }
  }
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
      types="wall"+noClipValue+"PurpleBottom";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"PurpleBottomLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"PurpleBottomLeftCorner";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"PurpleBottomRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"PurpleBottomRightCorner";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"PurpleCenter";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"PurpleLeft";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"PurpleLineBottom";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"PurpleLineBottomLeft";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"PurpleLineBottomLeftCorner";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"PurpleLineBottomRight";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"PurpleLineBottomRightCorner";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"PurpleLineLeft";
    }
  } else if (x>=1150 && x<=1182) {
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"PurpleLineTopRightCorner";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"PurpleLineRight";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"PurpleLineTop";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"PurpleLineTopLeft";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"PurpleLineTopLeftCorner";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"PurpleLineTopRight";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"PurpleChiseled";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"PurpleRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"PurpleTop";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"PurpleTopLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"PurpleTopLeftCorner";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"PurpleTopRight";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"PurpleTopRightCorner";
    }
  } else if (x>=1200 && x<=1232) {
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"RedBottom";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"RedBottomLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"RedBottomLeftCorner";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"RedBottomRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"RedBottomRightCorner";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"RedCenter";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"RedLeft";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"RedLineBottom";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"RedLineBottomLeft";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"RedLineBottomLeftCorner";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"RedLineBottomRight";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"RedLineBottomRightCorner";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"RedLineLeft";
    }
  } else if (x>=1250 && x<=1282) {
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"RedLineTopRightCorner";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"RedLineRight";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"RedLineTop";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"RedLineTopLeft";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"RedLineTopLeftCorner";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"RedLineTopRight";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"RedChiseled";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"RedRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"RedTop";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"RedTopLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"RedTopLeftCorner";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"RedTopRight";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"RedTopRightCorner";
    }
  } else if (x>=1300 && x<=1332) {
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"DarkBlueBottom";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"DarkBlueBottomLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"DarkBlueBottomLeftCorner";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"DarkBlueBottomRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"DarkBlueBottomRightCorner";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"DarkBlueCenter";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"DarkBlueLeft";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"DarkBlueLineBottom";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"DarkBlueLineBottomLeft";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"DarkBlueLineBottomLeftCorner";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"DarkBlueLineBottomRight";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"DarkBlueLineBottomRightCorner";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"DarkBlueLineLeft";
    }
  } else if (x>=1350 && x<=1382) {
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"DarkBlueLineTopRightCorner";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"DarkBlueLineRight";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"DarkBlueLineTop";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"DarkBlueLineTopLeft";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"DarkBlueLineTopLeftCorner";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"DarkBlueLineTopRight";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"DarkBlueChiseled";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"DarkBlueRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"DarkBlueTop";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"DarkBlueTopLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"DarkBlueTopLeftCorner";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"DarkBlueTopRight";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"DarkBlueTopRightCorner";
    }
  } else if (x>=1400 && x<=1432) {
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"LightBlueBottom";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"LightBlueBottomLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"LightBlueBottomLeftCorner";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"LightBlueBottomRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"LightBlueBottomRightCorner";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"LightBlueCenter";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"LightBlueLeft";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"LightBlueLineBottom";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LightBlueLineBottomLeft";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"LightBlueLineBottomLeftCorner";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"LightBlueLineBottomRight";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"LightBlueLineBottomRightCorner";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"LightBlueLineLeft";
    }
  } else if (x>=1450 && x<=1482) {
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"LightBlueLineTopRightCorner";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"LightBlueLineRight";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"LightBlueLineTop";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"LightBlueLineTopLeft";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LightBlueLineTopLeftCorner";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"LightBlueLineTopRight";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"LightBlueChiseled";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"LightBlueRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"LightBlueTop";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"LightBlueTopLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"LightBlueTopLeftCorner";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"LightBlueTopRight";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"LightBlueTopRightCorner";
    }
  } else if (x>=1500 && x<=1532) {
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"GreenBottom";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"GreenBottomLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"GreenBottomLeftCorner";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"GreenBottomRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"GreenBottomRightCorner";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"GreenCenter";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"GreenLeft";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"GreenLineBottom";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"GreenLineBottomLeft";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"GreenLineBottomLeftCorner";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"GreenLineBottomRight";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"GreenLineBottomRightCorner";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"GreenLineLeft";
    }
  } else if (x>=1550 && x<=1582) {
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"GreenLineTopRightCorner";
    }
    if (y>=490 && y<=522) {
      types="wall"+noClipValue+"GreenLineRight";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"GreenLineTop";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"GreenLineTopLeft";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"GreenLineTopLeftCorner";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"GreenLineTopRight";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"GreenChiseled";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"GreenRight";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"GreenTop";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"GreenTopLeft";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"GreenTopLeftCorner";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"GreenTopRight";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"GreenTopRightCorner";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"GreenChiseled";
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
  if (y>=570 && y<=620) {
    if (x>=1100 && x<=1150) {
      types="BJump";
    }
    if (x>=1160 && x<=1210) {
      types="empty";
    }
    if (x>=1220 && x<=1270) {
      types="BTP";
    }
    if (x>=1280 && x<=1330 && noClip==false) {
      noClip=true;
    } else if (x>=1280 && x<=1330 && noClip==true) {
      noClip=false;
    }
    if (x>=1340 && x<=1390) {
      types="BnoClip";
    }
    if (x>=1400 && x<=1450) {
      types="hero";
    }
    if (x>=1460 && x<=1510) {
      types="BDash";
    }
    if (x>=1520 && x<=1565) {
      types=end;
    }
    if (x>=1575 && x<=1620) {
      types="BGSwap";
    }
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////

  if (x>=300 && x<=470 && y>=700 && y<=750) {
    saveStrings("../../data/levels/lvlsHitbox/"+lvl+".txt", type);
    isSaving=true;
  }
  if (x>=100 && x<=250 && y>=700 && y<=750) {
    File file = new File(dataPath("../../../data/levels/lvlsHitbox"));
    boolean doesLvlExist=false;
    String[] lvls = file.list(), empty=new String[128*38];
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
  fill(255, 255, 255);
  text("x="+x, 110, 685);
  text("y="+y, 210, 685);
  text("sauvegarde", 320, 730);
  text("actualiser", 120, 730);
  text("réinitialiser", 320, 800);
  text(types, 290, 685);
  textSize(13);
  text("BJump", 1104, 600);
  text("empty", 1165, 600);
  text("BTP", 1233, 600);
  if (noClip==true) {
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  text("noClip", 1284, 600);
  fill(255, 255, 255);
  text("BnoClip", 1342, 600);
  text("hero", 1411, 600);
  text("BDash", 1466, 600);
  text("end", 1532, 600);
  textSize(11);
  text("BGSwap", 1577, 600);
  textSize(13);
  stroke(255, 255, 0);
  fill(255, 255, 255, 20);
  rect(1340, 570, 50, 50);
  fill(255, 255, 0, 100);
  rect(1100, 570, 50, 50);
  stroke(140, 24, 202);
  fill(140, 24, 202, 100);
  rect(1460, 570, 50, 50);
  stroke(0, 255, 0);
  fill(0, 255, 0, 100);
  rect(1160, 570, 50, 50);
  stroke(153, 0, 0);
  fill(153, 0, 0, 100);  
  rect(1220, 570, 50, 50);
  stroke(255, 255, 255);
  fill(100, 100, 100, 100);
  rect(1280, 570, 50, 50);
  stroke(255, 20, 147);
  fill(255, 20, 147, 100);
  rect(1400, 570, 50, 50);
  stroke(0, 255, 255);
  fill(0, 255, 255, 100);
  rect(1520, 570, 45, 50);
  stroke(50, 200, 50);
  fill(50, 200, 50, 100);
  rect(1575, 570, 45, 50);
  stroke(255, 255, 255);
  fill(255, 255, 255, 100);
  rect(300, 700, 170, 50, 8);
  rect(100, 700, 150, 50, 8);
  rect(300, 770, 170, 50, 5);
  textSize(22);


  for (int i=0; i<128; i++) {
    for (int j=0; j<38; j++) {
      stroke(0);
      fill(255, 255, 255, 0);

      if (i%4==0 && j%2==0 &&j<37 && type[i+128*j].startsWith("wall") && !type[i+128*j].startsWith("wallNoClip")) {
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
      } else if (i%4==0 && j%2==0 && j<37 && i<125 && type[i+128*j].equals("empty") && (type[i+1+128*j].startsWith("wall") || type[i+1+128*j].startsWith("spike") ||type[i+1+128*j].startsWith("emptyspike") ||type[i+2+128*j].startsWith("wall") || type[i+2+128*j].startsWith("spike") ||type[i+2+128*j].startsWith("emptyspike") ||type[i+3+128*j].startsWith("wall") || type[i+3+128*j].startsWith("spike") ||type[i+3+128*j].startsWith("emptyspike") ||type[i+128*(j+1)].startsWith("wall") || type[i+128*(j+1)].startsWith("spike") ||type[i+128*(j+1)].startsWith("emptyspike") ||type[i+1+128*(j+1)].startsWith("wall") || type[i+1+128*(j+1)].startsWith("spike") ||type[i+1+128*(j+1)].startsWith("emptyspike") ||type[i+2+128*(j+1)].startsWith("wall") || type[i+2+128*(j+1)].startsWith("spike") ||type[i+2+128*(j+1)].startsWith("emptyspike") || type[i+3+128*(j+1)].startsWith("wall") || type[i+3+128*(j+1)].startsWith("spike") ||type[i+3+128*(j+1)].startsWith("emptyspike"))) {
        type[i+1+128*j]="empty";
        type[i+2+128*j]="empty";
        type[i+3+128*j]="empty";
        type[i+128*(j+1)]="empty";
        type[i+1+128*(j+1)]="empty";
        type[i+2+128*(j+1)]="empty";
        type[i+3+128*(j+1)]="empty";
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
      } else if (type[i+128*j].equals("wallPurpleBottom") || type[i+128*j]=="wallPurpleBottom") {
        img=wallPurple[0];
      } else if (type[i+128*j].equals("wallPurpleBottomLeft") || type[i+128*j]=="wallPurpleBottomLeft") {
        img=wallPurple[1];
      } else if (type[i+128*j].equals("wallPurpleBottomLeftCorner") || type[i+128*j]=="wallPurpleBottomLeftCorner") {
        img=wallPurple[2];
      } else if (type[i+128*j].equals("wallPurpleBottomRight") || type[i+128*j]=="wallPurpleBottomRight") {
        img=wallPurple[3];
      } else if (type[i+128*j].equals("wallPurpleBottomRightCorner") || type[i+128*j]=="wallPurpleBottomRightCorner") {
        img=wallPurple[4];
      } else if (type[i+128*j].equals("wallPurpleCenter") || type[i+128*j]=="wallPurpleCenter") {
        img=wallPurple[5];
      } else if (type[i+128*j].equals("wallPurpleLeft") || type[i+128*j]=="wallPurpleLeft") {
        img=wallPurple[6];
      } else if (type[i+128*j].equals("wallPurpleLineBottom") || type[i+128*j]=="wallPurpleLineBottom") {
        img=wallPurple[7];
      } else if (type[i+128*j].equals("wallPurpleLineBottomLeft") || type[i+128*j]=="wallPurpleLineBottomLeft") {
        img=wallPurple[8];
      } else if (type[i+128*j].equals("wallPurpleLineBottomLeftCorner") || type[i+128*j]=="wallPurpleLineBottomLeftCorner") {
        img=wallPurple[9];
      } else if (type[i+128*j].equals("wallPurpleLineBottomRight") ||type[i+128*j]=="wallPurpleLineBottomRight") {
        img=wallPurple[10];
      } else if (type[i+128*j].equals("wallPurpleLineBottomRightCorner") || type[i+128*j]=="wallPurpleLineBottomRightCorner") {
        img=wallPurple[11];
      } else if (type[i+128*j].equals("wallPurpleLineLeft") || type[i+128*j]=="wallPurpleLineLeft") {
        img=wallPurple[12];
      } else if (type[i+128*j].equals("wallPurpleLineRight") || type[i+128*j]=="wallPurpleLineRight") {
        img=wallPurple[14];
      } else if (type[i+128*j].equals("wallPurpleLineTop") || type[i+128*j]=="wallPurpleLineTop") {
        img=wallPurple[15];
      } else if (type[i+128*j].equals("wallPurpleLineTopLeft") || type[i+128*j]=="wallPurpleLineTopLeft") {
        img=wallPurple[16];
      } else if (type[i+128*j].equals("wallPurpleLineTopLeftCorner") || type[i+128*j]=="wallPurpleLineTopLeftCorner") {
        img=wallPurple[17];
      } else if (type[i+128*j].equals("wallPurpleLineTopRight") || type[i+128*j]=="wallPurpleLineTopRight") {
        img=wallPurple[18];
      } else if (type[i+128*j].equals("wallPurpleLineTopRightCorner") || type[i+128*j]=="wallPurpleLineTopRightCorner") {
        img=wallPurple[13];
      } else if (type[i+128*j].equals("wallPurpleRight") ||type[i+128*j]=="wallPurpleRight") {
        img=wallPurple[20];
      } else if (type[i+128*j].equals("wallPurpleTop") ||type[i+128*j]=="wallPurpleTop") {
        img=wallPurple[21];
      } else if (type[i+128*j].equals("wallPurpleTopLeft") || type[i+128*j]=="wallPurpleTopLeft") {
        img=wallPurple[22];
      } else if (type[i+128*j].equals("wallPurpleTopLeftCorner") || type[i+128*j]=="wallPurpleTopLeftCorner") {
        img=wallPurple[23];
      } else if (type[i+128*j].equals("wallPurpleTopRight") || type[i+128*j]=="wallPurpleTopRight") {
        img=wallPurple[24];
      } else if (type[i+128*j].equals("wallPurpleTopRightCorner") || type[i+128*j]=="wallPurpleTopRightCorner") {
        img=wallPurple[25];
      } else if (type[i+128*j].equals("wallPurpleChiseled") || type[i+128*j]=="wallPurpleCiseled") {
        img=wallPurple[19];
      } else if (type[i+128*j].equals("wallRedBottom") || type[i+128*j]=="wallRedBottom") {
        img=wallRed[0];
      } else if (type[i+128*j].equals("wallRedBottomLeft") || type[i+128*j]=="wallRedBottomLeft") {
        img=wallRed[1];
      } else if (type[i+128*j].equals("wallRedBottomLeftCorner") || type[i+128*j]=="wallRedBottomLeftCorner") {
        img=wallRed[2];
      } else if (type[i+128*j].equals("wallRedBottomRight") || type[i+128*j]=="wallRedBottomRight") {
        img=wallRed[3];
      } else if (type[i+128*j].equals("wallRedBottomRightCorner") || type[i+128*j]=="wallRedBottomRightCorner") {
        img=wallRed[4];
      } else if (type[i+128*j].equals("wallRedCenter") || type[i+128*j]=="wallRedCenter") {
        img=wallRed[5];
      } else if (type[i+128*j].equals("wallRedLeft") || type[i+128*j]=="wallRedLeft") {
        img=wallRed[6];
      } else if (type[i+128*j].equals("wallRedLineBottom") || type[i+128*j]=="wallRedLineBottom") {
        img=wallRed[7];
      } else if (type[i+128*j].equals("wallRedLineBottomLeft") || type[i+128*j]=="wallRedLineBottomLeft") {
        img=wallRed[8];
      } else if (type[i+128*j].equals("wallRedLineBottomLeftCorner") || type[i+128*j]=="wallRedLineBottomLeftCorner") {
        img=wallRed[9];
      } else if (type[i+128*j].equals("wallRedLineBottomRight") ||type[i+128*j]=="wallRedLineBottomRight") {
        img=wallRed[10];
      } else if (type[i+128*j].equals("wallRedLineBottomRightCorner") || type[i+128*j]=="wallRedLineBottomRightCorner") {
        img=wallRed[11];
      } else if (type[i+128*j].equals("wallRedLineLeft") || type[i+128*j]=="wallRedLineLeft") {
        img=wallRed[12];
      } else if (type[i+128*j].equals("wallRedLineRight") || type[i+128*j]=="wallRedLineRight") {
        img=wallRed[14];
      } else if (type[i+128*j].equals("wallRedLineTop") || type[i+128*j]=="wallRedLineTop") {
        img=wallRed[15];
      } else if (type[i+128*j].equals("wallRedLineTopLeft") || type[i+128*j]=="wallRedLineTopLeft") {
        img=wallRed[16];
      } else if (type[i+128*j].equals("wallRedLineTopLeftCorner") || type[i+128*j]=="wallRedLineTopLeftCorner") {
        img=wallRed[17];
      } else if (type[i+128*j].equals("wallRedLineTopRight") || type[i+128*j]=="wallRedLineTopRight") {
        img=wallRed[18];
      } else if (type[i+128*j].equals("wallRedLineTopRightCorner") || type[i+128*j]=="wallRedLineTopRightCorner") {
        img=wallRed[13];
      } else if (type[i+128*j].equals("wallRedRight") ||type[i+128*j]=="wallRedRight") {
        img=wallRed[20];
      } else if (type[i+128*j].equals("wallRedTop") ||type[i+128*j]=="wallRedTop") {
        img=wallRed[21];
      } else if (type[i+128*j].equals("wallRedTopLeft") || type[i+128*j]=="wallRedTopLeft") {
        img=wallRed[22];
      } else if (type[i+128*j].equals("wallRedTopLeftCorner") || type[i+128*j]=="wallRedTopLeftCorner") {
        img=wallRed[23];
      } else if (type[i+128*j].equals("wallRedTopRight") || type[i+128*j]=="wallRedTopRight") {
        img=wallRed[24];
      } else if (type[i+128*j].equals("wallRedTopRightCorner") || type[i+128*j]=="wallRedTopRightCorner") {
        img=wallRed[25];
      } else if (type[i+128*j].equals("wallRedChiseled") ||type[i+128*j]=="wallRedChiseled") {
        img=wallRed[19];
      } else if (type[i+128*j].equals("wallDarkBlueBottom") || type[i+128*j]=="wallDarkBlueBottom") {
        img=wallDarkBlue[0];
      } else if (type[i+128*j].equals("wallDarkBlueBottomLeft") || type[i+128*j]=="wallDarkBlueBottomLeft") {
        img=wallDarkBlue[1];
      } else if (type[i+128*j].equals("wallDarkBlueBottomLeftCorner") || type[i+128*j]=="wallDarkBlueBottomLeftCorner") {
        img=wallDarkBlue[2];
      } else if (type[i+128*j].equals("wallDarkBlueBottomRight") || type[i+128*j]=="wallDarkBlueBottomRight") {
        img=wallDarkBlue[3];
      } else if (type[i+128*j].equals("wallDarkBlueBottomRightCorner") || type[i+128*j]=="wallDarkBlueBottomRightCorner") {
        img=wallDarkBlue[4];
      } else if (type[i+128*j].equals("wallDarkBlueCenter") || type[i+128*j]=="wallDarkBlueCenter") {
        img=wallDarkBlue[5];
      } else if (type[i+128*j].equals("wallDarkBlueLeft") || type[i+128*j]=="wallDarkBlueLeft") {
        img=wallDarkBlue[6];
      } else if (type[i+128*j].equals("wallDarkBlueLineBottom") || type[i+128*j]=="wallDarkBlueLineBottom") {
        img=wallDarkBlue[7];
      } else if (type[i+128*j].equals("wallDarkBlueLineBottomLeft") || type[i+128*j]=="wallDarkBlueLineBottomLeft") {
        img=wallDarkBlue[8];
      } else if (type[i+128*j].equals("wallDarkBlueLineBottomLeftCorner") || type[i+128*j]=="wallDarkBlueLineBottomLeftCorner") {
        img=wallDarkBlue[9];
      } else if (type[i+128*j].equals("wallDarkBlueLineBottomRight") ||type[i+128*j]=="wallDarkBlueLineBottomRight") {
        img=wallDarkBlue[10];
      } else if (type[i+128*j].equals("wallDarkBlueLineBottomRightCorner") || type[i+128*j]=="wallDarkBlueLineBottomRightCorner") {
        img=wallDarkBlue[11];
      } else if (type[i+128*j].equals("wallDarkBlueLineLeft") || type[i+128*j]=="wallDarkBlueLineLeft") {
        img=wallDarkBlue[12];
      } else if (type[i+128*j].equals("wallDarkBlueLineRight") || type[i+128*j]=="wallDarkBlueLineRight") {
        img=wallDarkBlue[14];
      } else if (type[i+128*j].equals("wallDarkBlueLineTop") || type[i+128*j]=="wallDarkBlueLineTop") {
        img=wallDarkBlue[15];
      } else if (type[i+128*j].equals("wallDarkBlueLineTopLeft") || type[i+128*j]=="wallDarkBlueLineTopLeft") {
        img=wallDarkBlue[16];
      } else if (type[i+128*j].equals("wallDarkBlueLineTopLeftCorner") || type[i+128*j]=="wallDarkBlueLineTopLeftCorner") {
        img=wallDarkBlue[17];
      } else if (type[i+128*j].equals("wallDarkBlueLineTopRight") || type[i+128*j]=="wallDarkBlueLineTopRight") {
        img=wallDarkBlue[18];
      } else if (type[i+128*j].equals("wallDarkBlueLineTopRightCorner") || type[i+128*j]=="wallDarkBlueLineTopRightCorner") {
        img=wallDarkBlue[13];
      } else if (type[i+128*j].equals("wallDarkBlueRight") ||type[i+128*j]=="wallDarkBlueRight") {
        img=wallDarkBlue[20];
      } else if (type[i+128*j].equals("wallDarkBlueTop") ||type[i+128*j]=="wallDarkBlueTop") {
        img=wallDarkBlue[21];
      } else if (type[i+128*j].equals("wallDarkBlueTopLeft") || type[i+128*j]=="wallDarkBlueTopLeft") {
        img=wallDarkBlue[22];
      } else if (type[i+128*j].equals("wallDarkBlueTopLeftCorner") || type[i+128*j]=="wallDarkBlueTopLeftCorner") {
        img=wallDarkBlue[23];
      } else if (type[i+128*j].equals("wallDarkBlueTopRight") || type[i+128*j]=="wallDarkBlueTopRight") {
        img=wallDarkBlue[24];
      } else if (type[i+128*j].equals("wallDarkBlueTopRightCorner") || type[i+128*j]=="wallDarkBlueTopRightCorner") {
        img=wallDarkBlue[25];
      } else if (type[i+128*j].equals("wallDarkBlueChiseled") ||type[i+128*j]=="wallDarkBlueChiseled") {
        img=wallDarkBlue[19];
      } else if (type[i+128*j].equals("wallLightBlueBottom") || type[i+128*j]=="wallLightBlueBottom") {
        img=wallLightBlue[0];
      } else if (type[i+128*j].equals("wallLightBlueBottomLeft") || type[i+128*j]=="wallLightBlueBottomLeft") {
        img=wallLightBlue[1];
      } else if (type[i+128*j].equals("wallLightBlueBottomLeftCorner") || type[i+128*j]=="wallLightBlueBottomLeftCorner") {
        img=wallLightBlue[2];
      } else if (type[i+128*j].equals("wallLightBlueBottomRight") || type[i+128*j]=="wallLightBlueBottomRight") {
        img=wallLightBlue[3];
      } else if (type[i+128*j].equals("wallLightBlueBottomRightCorner") || type[i+128*j]=="wallLightBlueBottomRightCorner") {
        img=wallLightBlue[4];
      } else if (type[i+128*j].equals("wallLightBlueCenter") || type[i+128*j]=="wallLightBlueCenter") {
        img=wallLightBlue[5];
      } else if (type[i+128*j].equals("wallLightBlueLeft") || type[i+128*j]=="wallLightBlueLeft") {
        img=wallLightBlue[6];
      } else if (type[i+128*j].equals("wallLightBlueLineBottom") || type[i+128*j]=="wallLightBlueLineBottom") {
        img=wallLightBlue[7];
      } else if (type[i+128*j].equals("wallLightBlueLineBottomLeft") || type[i+128*j]=="wallLightBlueLineBottomLeft") {
        img=wallLightBlue[8];
      } else if (type[i+128*j].equals("wallLightBlueLineBottomLeftCorner") || type[i+128*j]=="wallLightBlueLineBottomLeftCorner") {
        img=wallLightBlue[9];
      } else if (type[i+128*j].equals("wallLightBlueLineBottomRight") ||type[i+128*j]=="wallLightBlueLineBottomRight") {
        img=wallLightBlue[10];
      } else if (type[i+128*j].equals("wallLightBlueLineBottomRightCorner") || type[i+128*j]=="wallLightBlueLineBottomRightCorner") {
        img=wallLightBlue[11];
      } else if (type[i+128*j].equals("wallLightBlueLineLeft") || type[i+128*j]=="wallLightBlueLineLeft") {
        img=wallLightBlue[12];
      } else if (type[i+128*j].equals("wallLightBlueLineRight") || type[i+128*j]=="wallLightBlueLineRight") {
        img=wallLightBlue[14];
      } else if (type[i+128*j].equals("wallLightBlueLineTop") || type[i+128*j]=="wallLightBlueLineTop") {
        img=wallLightBlue[15];
      } else if (type[i+128*j].equals("wallLightBlueLineTopLeft") || type[i+128*j]=="wallLightBlueLineTopLeft") {
        img=wallLightBlue[16];
      } else if (type[i+128*j].equals("wallLightBlueLineTopLeftCorner") || type[i+128*j]=="wallLightBlueLineTopLeftCorner") {
        img=wallLightBlue[17];
      } else if (type[i+128*j].equals("wallLightBlueLineTopRight") || type[i+128*j]=="wallLightBlueLineTopRight") {
        img=wallLightBlue[18];
      } else if (type[i+128*j].equals("wallLightBlueLineTopRightCorner") || type[i+128*j]=="wallLightBlueLineTopRightCorner") {
        img=wallLightBlue[13];
      } else if (type[i+128*j].equals("wallLightBlueRight") ||type[i+128*j]=="wallLightBlueRight") {
        img=wallLightBlue[20];
      } else if (type[i+128*j].equals("wallLightBlueTop") ||type[i+128*j]=="wallLightBlueTop") {
        img=wallLightBlue[21];
      } else if (type[i+128*j].equals("wallLightBlueTopLeft") || type[i+128*j]=="wallLightBlueTopLeft") {
        img=wallLightBlue[22];
      } else if (type[i+128*j].equals("wallLightBlueTopLeftCorner") || type[i+128*j]=="wallLightBlueTopLeftCorner") {
        img=wallLightBlue[23];
      } else if (type[i+128*j].equals("wallLightBlueTopRight") || type[i+128*j]=="wallLightBlueTopRight") {
        img=wallLightBlue[24];
      } else if (type[i+128*j].equals("wallLightBlueTopRightCorner") || type[i+128*j]=="wallLightBlueTopRightCorner") {
        img=wallLightBlue[25];
      } else if (type[i+128*j].equals("wallLightBlueChiseled") ||type[i+128*j]=="wallLightBlueChiseled") {
        img=wallLightBlue[19];
      } else if (type[i+128*j].equals("wallGreenBottom") || type[i+128*j]=="wallGreenBottom") {
        img=wallGreen[0];
      } else if (type[i+128*j].equals("wallGreenBottomLeft") || type[i+128*j]=="wallGreenBottomLeft") {
        img=wallGreen[1];
      } else if (type[i+128*j].equals("wallGreenBottomLeftCorner") || type[i+128*j]=="wallGreenBottomLeftCorner") {
        img=wallGreen[2];
      } else if (type[i+128*j].equals("wallGreenBottomRight") || type[i+128*j]=="wallGreenBottomRight") {
        img=wallGreen[3];
      } else if (type[i+128*j].equals("wallGreenBottomRightCorner") || type[i+128*j]=="wallGreenBottomRightCorner") {
        img=wallGreen[4];
      } else if (type[i+128*j].equals("wallGreenCenter") || type[i+128*j]=="wallGreenCenter") {
        img=wallGreen[5];
      } else if (type[i+128*j].equals("wallGreenLeft") || type[i+128*j]=="wallGreenLeft") {
        img=wallGreen[6];
      } else if (type[i+128*j].equals("wallGreenLineBottom") || type[i+128*j]=="wallGreenLineBottom") {
        img=wallGreen[7];
      } else if (type[i+128*j].equals("wallGreenLineBottomLeft") || type[i+128*j]=="wallGreenLineBottomLeft") {
        img=wallGreen[8];
      } else if (type[i+128*j].equals("wallGreenLineBottomLeftCorner") || type[i+128*j]=="wallGreenLineBottomLeftCorner") {
        img=wallGreen[9];
      } else if (type[i+128*j].equals("wallGreenLineBottomRight") ||type[i+128*j]=="wallGreenLineBottomRight") {
        img=wallGreen[10];
      } else if (type[i+128*j].equals("wallGreenLineBottomRightCorner") || type[i+128*j]=="wallGreenLineBottomRightCorner") {
        img=wallGreen[11];
      } else if (type[i+128*j].equals("wallGreenLineLeft") || type[i+128*j]=="wallGreenLineLeft") {
        img=wallGreen[12];
      } else if (type[i+128*j].equals("wallGreenLineRight") || type[i+128*j]=="wallGreenLineRight") {
        img=wallGreen[14];
      } else if (type[i+128*j].equals("wallGreenLineTop") || type[i+128*j]=="wallGreenLineTop") {
        img=wallGreen[15];
      } else if (type[i+128*j].equals("wallGreenLineTopLeft") || type[i+128*j]=="wallGreenLineTopLeft") {
        img=wallGreen[16];
      } else if (type[i+128*j].equals("wallGreenLineTopLeftCorner") || type[i+128*j]=="wallGreenLineTopLeftCorner") {
        img=wallGreen[17];
      } else if (type[i+128*j].equals("wallGreenLineTopRight") || type[i+128*j]=="wallGreenLineTopRight") {
        img=wallGreen[18];
      } else if (type[i+128*j].equals("wallGreenLineTopRightCorner") || type[i+128*j]=="wallGreenLineTopRightCorner") {
        img=wallGreen[13];
      } else if (type[i+128*j].equals("wallGreenRight") ||type[i+128*j]=="wallGreenRight") {
        img=wallGreen[20];
      } else if (type[i+128*j].equals("wallGreenTop") ||type[i+128*j]=="wallGreenTop") {
        img=wallGreen[21];
      } else if (type[i+128*j].equals("wallGreenTopLeft") || type[i+128*j]=="wallGreenTopLeft") {
        img=wallGreen[22];
      } else if (type[i+128*j].equals("wallGreenTopLeftCorner") || type[i+128*j]=="wallGreenTopLeftCorner") {
        img=wallGreen[23];
      } else if (type[i+128*j].equals("wallGreenTopRight") || type[i+128*j]=="wallGreenTopRight") {
        img=wallGreen[24];
      } else if (type[i+128*j].equals("wallGreenTopRightCorner") || type[i+128*j]=="wallGreenTopRightCorner") {
        img=wallGreen[25];
      } else if (type[i+128*j].equals("wallGreenChiseled") ||type[i+128*j]=="wallGreenChiseled") {
        img=wallGreen[19];
      } else if (type[i+128*j].equals("wallNoClipPurpleBottom") || type[i+128*j]=="wallNoClipPurpleBottom") {
        img=wallPurple[0];
      } else if (type[i+128*j].equals("wallNoClipPurpleBottomLeft") || type[i+128*j]=="wallNoClipPurpleBottomLeft") {
        img=wallPurple[1];
      } else if (type[i+128*j].equals("wallNoClipPurpleBottomLeftCorner") || type[i+128*j]=="wallNoClipPurpleBottomLeftCorner") {
        img=wallPurple[2];
      } else if (type[i+128*j].equals("wallNoClipPurpleBottomRight") || type[i+128*j]=="wallNoClipPurpleBottomRight") {
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
      }
      if (type[i+128*j].equals("BJump") || type[i+128*j]=="BJump") {
        fill(255, 255, 0, 150);
      } else if (type[i+128*j].equals("BnoClip") || type[i+128*j]=="BnoClip") {
        fill(255, 255, 255);
      } else if (type[i+128*j].equals("BTP") || type[i+128*j]=="BTP") {
        fill(255, 0, 0, 150);
      } else if (type[i+128*j].equals("BDash") || type[i+128*j]=="BDash") {
        fill(140, 24, 202, 150);
      } else if (type[i+128*j].startsWith("empty") || type[i+128*j]=="empty") {//||){ type[i+128*j]=="emptyspikeRedRight" || type[i+128*j]=="emptyspikePurpleBottom") {
        if (R.length()==0 || G.length()==0 || B.length()==0) {
        } else {
          fill(Integer.parseInt(R), Integer.parseInt(G), Integer.parseInt(B));
        }
      } else if (type[i+128*j].equals("noClip") || type[i+128*j]=="noClip") {
        fill(100, 100, 100, 150);
      } else if (type[i+128*j].equals("hero") || type[i+128*j]=="hero") {
        fill(255, 20, 147, 150);
      } else if (type[i+128*j].startsWith("end") || type[i+128*j].startsWith("end")) {
        fill(0, 255, 255, 150);
      } else if (type[i+128*j].equals("BGSwap") || type[i+128*j]=="BGSwap") {
        fill(50, 200, 50, 100);
      }
      if ((!type[i+128*j].equals("wall") && !type[i+128*j].equals("wallNoClip") && type[i+128*j].startsWith("wall")) || (!type[i+128*j].equals("spike") && type[i+128*j].startsWith("spike")) || (!type[i+128*j].equals("spike") && type[i+128*j].startsWith("emptyspike"))) {
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