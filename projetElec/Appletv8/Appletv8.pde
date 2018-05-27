int x, y;
boolean isSaving=false;
String R="0", G="0", B="0";
boolean selectR=false, selectG=false, selectB=false, selectName=false, selectEnd=false, noClip=false;
String []type=new String[0];
String types="empty", lvl="lvl1", end="end", noClipValue="", musicChosen="musicColorPanic";
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
  type=loadStrings("../data/levels/lvlsHitbox/"+lvl+".txt");
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
      types="wall"+noClipValue+"BottomPurple";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"BottomLeftPurple";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"BottomLeftCornerPurple";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"BottomRightPurple";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"BottomRightCornerPurple";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"CenterPurple";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"LeftPurple";
    }
    if (y>=330 && y<=362) {
      types="emptywall"+noClipValue+"LineBottomPurple";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineBottomLeftPurple";
    }
    if (y>=410 && y<=442) {
      types="emptywall"+noClipValue+"LineBottomLeftCornerPurple";
    }
    if (y>=450 && y<=482) {
      types="emptywall"+noClipValue+"LineBottomRightPurple";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineBottomRightCornerPurple";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"LineLeftPurple";
    }
  } else if (x>=1150 && x<=1182) {
    if (y>=530 && y<=562) {
      types="emptywall"+noClipValue+"LineTopRightCornerPurple";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineRightPurple";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"LineTopPurple";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"LineTopLeftPurple";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineTopLeftCornerPurple";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"LineTopRightPurple";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"ChiseledPurple";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"RightPurple";
    }
    if (y>=210 && y<=242) {
      types="wallTop"+noClipValue+"Purple";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"TopLeftPurple";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"TopLeftCornerPurple";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"TopRightPurple";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"TopRightCornerPurple";
    }
  } else if (x>=1200 && x<=1232) {
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"BottomRed";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"BottomLeftRed";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"BottomLeftCornerRed";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"BottomRightRed";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"BottomRightCornerRed";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"CenterRed";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"LeftRed";
    }
    if (y>=330 && y<=362) {
      types="emptywall"+noClipValue+"LineBottomRed";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineBottomLeftRed";
    }
    if (y>=410 && y<=442) {
      types="emptywall"+noClipValue+"LineBottomLeftCornerRed";
    }
    if (y>=450 && y<=482) {
      types="emptywall"+noClipValue+"LineBottomRightRed";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineBottomRightCornerRed";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"LineLeftRed";
    }
  } else if (x>=1250 && x<=1282) {
    if (y>=530 && y<=562) {
      types="emptywall"+noClipValue+"LineTopRightCornerRed";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineRightRed";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"LineTopRed";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"LineTopLeftRed";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineTopLeftCornerRed";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"LineTopRightRed";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"ChiseledRed";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"RightRed";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"TopRed";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"TopLeftRed";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"TopLeftCornerRed";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"TopRightRed";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"TopRightCornerRed";
    }
  } else if (x>=1300 && x<=1332) {
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"BottomDarkBlue";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"BottomLeftDarkBlue";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"BottomLeftCornerDarkBlue";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"BottomRightDarkBlue";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"BottomRightCornerDarkBlue";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"CenterDarkBlue";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"LeftDarkBlue";
    }
    if (y>=330 && y<=362) {
      types="emptywall"+noClipValue+"LineBottomDarkBlue";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineBottomLeftDarkBlue";
    }
    if (y>=410 && y<=442) {
      types="emptywall"+noClipValue+"LineBottomLeftCornerDarkBlue";
    }
    if (y>=450 && y<=482) {
      types="emptywall"+noClipValue+"LineBottomRightDarkBlue";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineBottomRightCornerDarkBlue";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"LineLeftDarkBlue";
    }
  } else if (x>=1350 && x<=1382) {
    if (y>=530 && y<=562) {
      types="emptywall"+noClipValue+"LineTopRightCornerDarkBlue";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineRightDarkBlue";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"LineTopDarkBlue";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"LineTopLeftDarkBlue";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineTopLeftCornerDarkBlue";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"LineTopRightDarkBlue";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"ChiseledDarkBlue";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"RightDarkBlue";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"TopDarkBlue";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"TopLeftDarkBlue";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"TopLeftCornerDarkBlue";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"TopRightDarkBlue";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"TopRightCornerDarkBlue";
    }
  } else if (x>=1400 && x<=1432) {
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"BottomLightBlue";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"BottomLeftLightBlue";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"BottomLeftCornerLightBlue";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"BottomRightLightBlue";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"BottomRightCornerLightBlue";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"CenterLightBlue";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"LeftLightBlue";
    }
    if (y>=330 && y<=362) {
      types="emptywall"+noClipValue+"LineBottomLightBlue";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineBottomLeftLightBlue";
    }
    if (y>=410 && y<=442) {
      types="emptywall"+noClipValue+"LineBottomLeftCornerLightBlue";
    }
    if (y>=450 && y<=482) {
      types="emptywall"+noClipValue+"LineBottomRightLightBlue";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineBottomRightCornerLightBlue";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"LineLeftLightBlue";
    }
  } else if (x>=1450 && x<=1482) {
    if (y>=530 && y<=562) {
      types="emptywall"+noClipValue+"LineTopRightCornerLightBlue";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineRightLightBlue";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"LineTopLightBlue";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"LineTopLeftLightBlue";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineTopLeftCornerLightBlue";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"LineTopRightLightBlue";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"ChiseledLightBlue";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"RightLightBlue";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"TopLightBlue";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"TopLeftLightBlue";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"TopLeftCornerLightBlue";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"TopRightLightBlue";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"TopRightCornerLightBlue";
    }
  } else if (x>=1500 && x<=1532) {
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"BottomGreen";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"BottomLeftGreen";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"BottomLeftCornerGreen";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"BottomRightGreen";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"BottomRightCornerGreen";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"GreenCenter";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"LeftGreen";
    }
    if (y>=330 && y<=362) {
      types="emptywall"+noClipValue+"LineBottomGreen";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineBottomLeftGreen";
    }
    if (y>=410 && y<=442) {
      types="emptywall"+noClipValue+"LineBottomLeftCornerGreen";
    }
    if (y>=450 && y<=482) {
      types="emptywall"+noClipValue+"LineBottomRightGreen";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineBottomRightCornerGreen";
    }
    if (y>=530 && y<=562) {
      types="wall"+noClipValue+"LineLeftGreen";
    }
  } else if (x>=1550 && x<=1582) {
    if (y>=530 && y<=562) {
      types="emptywall"+noClipValue+"LineTopRightCornerGreen";
    }
    if (y>=490 && y<=522) {
      types="emptywall"+noClipValue+"LineRightGreen";
    }
    if (y>=450 && y<=482) {
      types="wall"+noClipValue+"LineTopGreen";
    }
    if (y>=410 && y<=442) {
      types="wall"+noClipValue+"LineTopLeftGreen";
    }
    if (y>=370 && y<=402) {
      types="wall"+noClipValue+"LineTopLeftCornerGreen";
    }
    if (y>=330 && y<=362) {
      types="wall"+noClipValue+"LineTopRightGreen";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"ChiseledGreen";
    }
    if (y>=250 && y<=282) {
      types="wall"+noClipValue+"RightGreen";
    }
    if (y>=210 && y<=242) {
      types="wall"+noClipValue+"TopGreen";
    }
    if (y>=170 && y<=202) {
      types="wall"+noClipValue+"TopLeftGreen";
    }
    if (y>=130 && y<=162) {
      types="wall"+noClipValue+"TopLeftCornerGreen";
    }
    if (y>=90 && y<=122) {
      types="wall"+noClipValue+"TopRightGreen";
    }
    if (y>=50 && y<=82) {
      types="wall"+noClipValue+"TopRightCornerGreen";
    }
    if (y>=290 && y<=322) {
      types="wall"+noClipValue+"ChiseledGreen";
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
    saveStrings("../data/levels/lvlsHitbox/"+lvl+".txt", type);
    isSaving=true;
  }
  if (x>=100 && x<=250 && y>=700 && y<=750) {
    File file = new File(dataPath("../../data/levels/lvlsHitbox"));
    boolean doesLvlExist=false;
    String[] lvls = file.list(), empty=new String[128*38+1];
    for (int i=0; i<lvls.length; i++) {
      if (lvls[i].equals(lvl+".txt")) {
        doesLvlExist=true;
      }
    }
    if (doesLvlExist==false) {
      saveStrings("../data/levels/lvlsHitbox/"+lvl+".txt", empty);
      isSaving=true;
    }
    type=loadStrings("../data/levels/lvlsHitbox/"+lvl+".txt");
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
  fill(0);
  stroke(0);
  for (int i=0; i<13; i++) {
    for (int j=0; j<10; j++) {
      rect(1100+50*j, i*40+50, 32, 32);
    }
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
        } else if (type[i+128*j].startsWith("emptywallNoClipLineTopRightCorner")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="wallNoClip";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("wallLineTopLeftCorner") || type[i+128*j].startsWith("wallNoClipLineTopLeftCorner")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("emptywallLineBottomRightCorner")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="wall";
        } else if (type[i+128*j].startsWith("emptywallNoClipLineBottomRightCorner")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="wallNoClip";
        } else if (type[i+128*j].startsWith("wallLineTopRight")) {
          type[i+1+128*j]="wall";
          type[i+2+128*j]="wall";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="wall";
        } else if (type[i+128*j].startsWith("wallNoClipLineTopRight")) {
          type[i+1+128*j]="wallNoClip";
          type[i+2+128*j]="wallNoClip";
          type[i+3+128*j]="wallNoClip";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="wallNoClip";
        } else if (type[i+128*j].startsWith("wallLineTopLeft")) {
          type[i+1+128*j]="wall";
          type[i+2+128*j]="wall";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("wallNoClipLineTopLeft")) {
          type[i+1+128*j]="wallNoClip";
          type[i+2+128*j]="wallNoClip";
          type[i+3+128*j]="wallNoClip";
          type[i+128*(j+1)]="wallNoClip";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("wallLineTop")) { 
          type[i+1+128*j]="wall";
          type[i+2+128*j]="wall";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("wallNoClipLineTop")) {
          type[i+1+128*j]="wallNoClip";
          type[i+2+128*j]="wallNoClip";
          type[i+3+128*j]="wallNoClip";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("emptywallLineBottomLeftCorner")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("emptywallNoClipLineBottomLeftCorner")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="wallNoClip";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("wallLineBottomLeft")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="wall";
          type[i+2+128*(j+1)]="wall";
          type[i+3+128*(j+1)]="wall";
        } else if (type[i+128*j].startsWith("wallNoClipLineBottomLeft")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="wallNoClip";
          type[i+1+128*(j+1)]="wallNoClip";
          type[i+2+128*(j+1)]="wallNoClip";
          type[i+3+128*(j+1)]="wallNoClip";
        } else if (type[i+128*j].startsWith("emptywallLineBottomRight")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="wall";
          type[i+2+128*(j+1)]="wall";
          type[i+3+128*(j+1)]="wall";
        } else if (type[i+128*j].startsWith("emptywallNoClipLineBottomRight")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="wallNoClip";
          type[i+128*(j+1)]="wallNoClip";
          type[i+1+128*(j+1)]="wallNoClip";
          type[i+2+128*(j+1)]="wallNoClip";
          type[i+3+128*(j+1)]="wallNoClip";
        } else if (type[i+128*j].startsWith("emptywallLineBottom")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="wall";
          type[i+2+128*(j+1)]="wall";
          type[i+3+128*(j+1)]="wall";
        } else if (type[i+128*j].startsWith("emptywallNoClipLineBottom")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="wallNoClip";
          type[i+1+128*(j+1)]="wallNoClip";
          type[i+2+128*(j+1)]="wallNoClip";
          type[i+3+128*(j+1)]="wallNoClip";
        } else if (type[i+128*j].startsWith("wallLineLeft")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="wall";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("wallNoClipLineLeft")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="wallNoClip";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (type[i+128*j].startsWith("emptywallLineRight")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="wall";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="wall";
        } else if (type[i+128*j].startsWith("emptywallNoClipLineRight")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="wallNoClip";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="wallNoClip";
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
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (i%4==0 && j%2==0 && j<37 && type[i+128*j].startsWith("emptyspike") && type[i+128*j].endsWith("Bottom")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="spike";
          type[i+1+128*(j+1)]="spike";
          type[i+2+128*(j+1)]="spike";
          type[i+3+128*(j+1)]="spike";
        } else if (j%2==0 && j<37 && type[i+128*j].startsWith("spike") && type[i+128*j].endsWith("Left")) {
          type[i+1+128*j]="spike";
          type[i+2+128*j]="empty";
          type[i+3+128*j]="empty";
          type[i+128*(j+1)]="spike";
          type[i+1+128*(j+1)]="spike";
          type[i+2+128*(j+1)]="empty";
          type[i+3+128*(j+1)]="empty";
        } else if (j%2==0 && j<37 && type[i+128*j].startsWith("emptyspike") && type[i+128*j].endsWith("Right")) {
          type[i+1+128*j]="empty";
          type[i+2+128*j]="spike";
          type[i+3+128*j]="spike";
          type[i+128*(j+1)]="empty";
          type[i+1+128*(j+1)]="empty";
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
      }
      if (x>50+8*i && x<50+(8*i+8) && y>50+16*j && y<50+(16*j+16) && x<1074 && y<=650) {
        type[i+128*j]=types;
      }
      if (type[i+128*j].equals("null") || type[i+128*j]=="null") {
        type[i+128*j]="empty";
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
      } else if (type[i+128*j].equals("wallRightPurple") ||type[i+128*j]=="wallRightPurple") {
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
      } else if (type[i+128*j].equals("wallRightRed") ||type[i+128*j]=="wallRightRed") {
        img=wallRed[20];
      } else if (type[i+128*j].equals("wallTopRed") ||type[i+128*j]=="wallTopRed") {
        img=wallRed[21];
      } else if (type[i+128*j].equals("wallTopLeftRed") || type[i+128*j]=="wallTopLeftRed") {
        img=wallRed[22];
      } else if (type[i+128*j].equals("wallTopLeftCornerRed") || type[i+128*j]=="wallTopLeftCornerRed") {
        img=wallRed[23];
      } else if (type[i+128*j].equals("wallTopRightRed") || type[i+128*j]=="wallTopRightRed") {
        img=wallRed[24];
      } else if (type[i+128*j].equals("wallTopRightCornerRed") || type[i+128*j]=="wallTopRightCornerRed") {
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
      } else if (type[i+128*j].equals("wallTopRightCornerDarkBlue") || type[i+128*j]=="wallTopRightCornerDarkBlue") {
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
      } else if (type[i+128*j].equals("wallNoClipBottomRightPurple") || type[i+128*j]=="wallNoClipBottomRightPurple") {
        img=wallPurple[3];
      } else if (type[i+128*j].equals("wallNoClipBottomRightCornerPurple") || type[i+128*j]=="wallNoClipBottomRightCornerPurple") {
        img=wallPurple[4];
      } else if (type[i+128*j].equals("wallNoClipCenterPurple") || type[i+128*j]=="wallNoClipCenterPurple") {
        img=wallPurple[5];
      } else if (type[i+128*j].equals("wallNoClipLeftPurple") || type[i+128*j]=="wallNoClipLeftPurple") {
        img=wallPurple[6];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomPurple") || type[i+128*j]=="emptywallNoClipLineBottomPurple") {
        img=wallPurple[7];
      } else if (type[i+128*j].equals("wallNoClipLineBottomLeftPurple") || type[i+128*j]=="wallNoClipLineBottomLeftPurple") {
        img=wallPurple[8];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomLeftCornerPurple") || type[i+128*j]=="emptywallNoClipLineBottomLeftCornerPurple") {
        img=wallPurple[9];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightPurple") ||type[i+128*j]=="emptywallNoClipLineBottomRightPurple") {
        img=wallPurple[10];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightCornerPurple") || type[i+128*j]=="emptywallNoClipLineBottomRightCornerPurple") {
        img=wallPurple[11];
      } else if (type[i+128*j].equals("wallNoClipLineLeftPurple") || type[i+128*j]=="wallNoClipLineLeftPurple") {
        img=wallPurple[12];
      } else if (type[i+128*j].equals("emptywallNoClipLineRightPurple") || type[i+128*j]=="emptywallNoClipLineRightPurple") {
        img=wallPurple[14];
      } else if (type[i+128*j].equals("wallNoClipLineTopPurple") || type[i+128*j]=="wallNoClipLineTopPurple") {
        img=wallPurple[15];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftPurple") || type[i+128*j]=="wallNoClipLineTopLeftPurple") {
        img=wallPurple[16];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftCornerPurple") || type[i+128*j]=="wallNoClipLineTopLeftCornerPurple") {
        img=wallPurple[17];
      } else if (type[i+128*j].equals("wallNoClipLineTopRightPurple") || type[i+128*j]=="wallNoClipLineTopRightPurple") {
        img=wallPurple[18];
      } else if (type[i+128*j].equals("emptywallNoClipLineTopRightCornerPurple") || type[i+128*j]=="emptywallNoClipLineTopRightCornerPurple") {
        img=wallPurple[13];
      } else if (type[i+128*j].equals("wallNoClipRightPurple") ||type[i+128*j]=="wallNoClipRightPurple") {
        img=wallPurple[20];
      } else if (type[i+128*j].equals("wallNoClipTopPurple") ||type[i+128*j]=="wallNoClipTopPurple") {
        img=wallPurple[21];
      } else if (type[i+128*j].equals("wallNoClipTopLeftPurple") || type[i+128*j]=="wallNoClipTopLeftPurple") {
        img=wallPurple[22];
      } else if (type[i+128*j].equals("wallNoClipTopLeftCornerPurple") || type[i+128*j]=="wallNoClipTopLeftCornerPurple") {
        img=wallPurple[23];
      } else if (type[i+128*j].equals("wallNoClipTopRightPurple") || type[i+128*j]=="wallNoClipTopRightPurple") {
        img=wallPurple[24];
      } else if (type[i+128*j].equals("wallNoClipTopRightCornerPurple") || type[i+128*j]=="wallNoClipTopRightCornerPurple") {
        img=wallPurple[25];
      } else if (type[i+128*j].equals("wallNoClipChiseledPurple") || type[i+128*j]=="wallNoClipChiseledPurple") {
        img=wallPurple[19];
      } else if (type[i+128*j].equals("wallNoClipBottomRed") || type[i+128*j]=="wallNoClipBottomRed") {
        img=wallRed[0];
      } else if (type[i+128*j].equals("wallNoClipBottomLeftRed") || type[i+128*j]=="wallNoClipBottomLeftRed") {
        img=wallRed[1];
      } else if (type[i+128*j].equals("wallNoClipBottomLeftCornerRed") || type[i+128*j]=="wallNoClipBottomLeftCornerRed") {
        img=wallRed[2];
      } else if (type[i+128*j].equals("wallNoClipBottomRightRed") || type[i+128*j]=="wallNoClipBottomRightRed") {
        img=wallRed[3];
      } else if (type[i+128*j].equals("wallNoClipBottomRightCornerRed") || type[i+128*j]=="wallNoClipBottomRightCornerRed") {
        img=wallRed[4];
      } else if (type[i+128*j].equals("wallNoClipCenterRed") || type[i+128*j]=="wallNoClipCenterRed") {
        img=wallRed[5];
      } else if (type[i+128*j].equals("wallNoClipLeftRed") || type[i+128*j]=="wallNoClipLeftRed") {
        img=wallRed[6];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRed") || type[i+128*j]=="emptywallNoClipLineBottomRed") {
        img=wallRed[7];
      } else if (type[i+128*j].equals("wallNoClipLineBottomLeftRed") || type[i+128*j]=="wallNoClipLineBottomLeftRed") {
        img=wallRed[8];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomLeftCornerRed") || type[i+128*j]=="emptywallNoClipLineBottomLeftCornerRed") {
        img=wallRed[9];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightRed") ||type[i+128*j]=="emptywallNoClipLineBottomRightRed") {
        img=wallRed[10];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightCornerRed") || type[i+128*j]=="emptywallNoClipLineBottomRightCornerRed") {
        img=wallRed[11];
      } else if (type[i+128*j].equals("wallNoClipLineLeftRed") || type[i+128*j]=="wallNoClipLineLeftRed") {
        img=wallRed[12];
      } else if (type[i+128*j].equals("emptywallNoClipLineRightRed") || type[i+128*j]=="emptywallNoClipLineRightRed") {
        img=wallRed[14];
      } else if (type[i+128*j].equals("wallNoClipLineTopRed") || type[i+128*j]=="wallNoClipLineTopRed") {
        img=wallRed[15];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftRed") || type[i+128*j]=="wallNoClipLineTopLeftRed") {
        img=wallRed[16];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftCornerRed") || type[i+128*j]=="wallNoClipLineTopLeftCornerRed") {
        img=wallRed[17];
      } else if (type[i+128*j].equals("wallNoClipLineTopRightRed") || type[i+128*j]=="wallNoClipLineTopRightRed") {
        img=wallRed[18];
      } else if (type[i+128*j].equals("emptywallNoClipLineTopRightCornerRed") || type[i+128*j]=="emptywallNoClipLineTopRightCornerRed") {
        img=wallRed[13];
      } else if (type[i+128*j].equals("wallNoClipRightRed") ||type[i+128*j]=="wallNoClipRightRed") {
        img=wallRed[20];
      } else if (type[i+128*j].equals("wallNoClipTopRed") ||type[i+128*j]=="wallNoClipTopRed") {
        img=wallRed[21];
      } else if (type[i+128*j].equals("wallNoClipTopLeftRed") || type[i+128*j]=="wallNoClipTopLeftRed") {
        img=wallRed[22];
      } else if (type[i+128*j].equals("wallNoClipTopLeftCornerRed") || type[i+128*j]=="wallNoClipTopLeftCornerRed") {
        img=wallRed[23];
      } else if (type[i+128*j].equals("wallNoClipTopRightRed") || type[i+128*j]=="wallNoClipTopRightRed") {
        img=wallRed[24];
      } else if (type[i+128*j].equals("wallNoClipTopRightCornerRed") || type[i+128*j]=="wallNoClipTopRightCornerRed") {
        img=wallRed[25];
      } else if (type[i+128*j].equals("wallNoClipChiseledRed") ||type[i+128*j]=="wallNoClipChiseledRed") {
        img=wallRed[19];
      } else if (type[i+128*j].equals("wallNoClipBottomDarkBlue") || type[i+128*j]=="wallNoClipBottomDarkBlue") {
        img=wallDarkBlue[0];
      } else if (type[i+128*j].equals("wallNoClipBottomLeftDarkBlue") || type[i+128*j]=="wallNoClipBottomLeftDarkBlue") {
        img=wallDarkBlue[1];
      } else if (type[i+128*j].equals("wallNoClipBottomLeftCornerDarkBlue") || type[i+128*j]=="wallNoClipBottomLeftCornerDarkBlue") {
        img=wallDarkBlue[2];
      } else if (type[i+128*j].equals("wallNoClipBottomRightDarkBlue") || type[i+128*j]=="wallNoClipBottomRightDarkBlue") {
        img=wallDarkBlue[3];
      } else if (type[i+128*j].equals("wallNoClipBottomRightCornerDarkBlue") || type[i+128*j]=="wallBottomRightCornerDarkBlue") {
        img=wallDarkBlue[4];
      } else if (type[i+128*j].equals("wallNoClipCenterDarkBlue") || type[i+128*j]=="wallNoClipCenterDarkBlue") {
        img=wallDarkBlue[5];
      } else if (type[i+128*j].equals("wallNoClipLeftDarkBlue") || type[i+128*j]=="wallNoClipLeftDarkBlue") {
        img=wallDarkBlue[6];
      } else if (type[i+128*j].equals("wallNoClipLineBottomDarkBlue") || type[i+128*j]=="wallNoClipLineBottomDarkBlue") {
        img=wallDarkBlue[7];
      } else if (type[i+128*j].equals("wallNoClipLineBottomLeftDarkBlue") || type[i+128*j]=="wallNoClipLineBottomLeftDarkBlue") {
        img=wallDarkBlue[8];
      } else if (type[i+128*j].equals("wallNoClipLineBottomLeftCornerDarkBlue") || type[i+128*j]=="wallNoClipLineBottomLeftCornerDarkBlue") {
        img=wallDarkBlue[9];
      } else if (type[i+128*j].equals("wallNoClipLineBottomRightDarkBlue") ||type[i+128*j]=="wallNoClipLineBottomRightDarkBlue") {
        img=wallDarkBlue[10];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightCornerDarkBlue") || type[i+128*j]=="emptywallNoClipLineBottomRightCornerDarkBlue") {
        img=wallDarkBlue[11];
      } else if (type[i+128*j].equals("wallNoClipLineLeftDarkBlue") || type[i+128*j]=="wallNoClipLineLeftDarkBlue") {
        img=wallDarkBlue[12];
      } else if (type[i+128*j].equals("emptywallNoClipLineRightDarkBlue") || type[i+128*j]=="emptywallNoClipLineRightDarkBlue") {
        img=wallDarkBlue[14];
      } else if (type[i+128*j].equals("wallNoClipLineTopDarkBlue") || type[i+128*j]=="wallNoClipLineTopDarkBlue") {
        img=wallDarkBlue[15];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftDarkBlue") || type[i+128*j]=="wallNoClipLineTopLeftDarkBlue") {
        img=wallDarkBlue[16];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftCornerDarkBlue") || type[i+128*j]=="wallNoClipLineTopLeftCornerDarkBlue") {
        img=wallDarkBlue[17];
      } else if (type[i+128*j].equals("wallNoClipLineTopRightDarkBlue") || type[i+128*j]=="wallNoClipLineTopRightDarkBlue") {
        img=wallDarkBlue[18];
      } else if (type[i+128*j].equals("emptywallNoClipLineTopRightCornerDarkBlue") || type[i+128*j]=="emptywallNoClipLineTopRightCornerDarkBlue") {
        img=wallDarkBlue[13];
      } else if (type[i+128*j].equals("wallNoClipRightDarkBlue") ||type[i+128*j]=="wallNoClipRightDarkBlue") {
        img=wallDarkBlue[20];
      } else if (type[i+128*j].equals("wallNoClipTopDarkBlue") ||type[i+128*j]=="wallNoClipTopDarkBlue") {
        img=wallDarkBlue[21];
      } else if (type[i+128*j].equals("wallNoClipTopLeftDarkBlue") || type[i+128*j]=="wallNoClipTopLeftDarkBlue") {
        img=wallDarkBlue[22];
      } else if (type[i+128*j].equals("wallNoClipTopLeftCornerDarkBlue") || type[i+128*j]=="wallNoClipTopLeftCornerDarkBlue") {
        img=wallDarkBlue[23];
      } else if (type[i+128*j].equals("wallNoClipTopRightDarkBlue") || type[i+128*j]=="wallNoClipTopRightDarkBlue") {
        img=wallDarkBlue[24];
      } else if (type[i+128*j].equals("wallNoClipTopRightCornerDarkBlue") || type[i+128*j]=="wallNoClipTopRightCornerDarkBlue") {
        img=wallDarkBlue[25];
      } else if (type[i+128*j].equals("wallNoClipChiseledDarkBlue") ||type[i+128*j]=="wallNoClipChiseledDarkBlue") {
        img=wallDarkBlue[19];
      } else if (type[i+128*j].equals("wallNoClipBottomLightBlue") || type[i+128*j]=="wallNoClipBottomLightBlue") {
        img=wallLightBlue[0];
      } else if (type[i+128*j].equals("wallNoClipBottomLeftLightBlue") || type[i+128*j]=="wallNoClipBottomLeftLightBlue") {
        img=wallLightBlue[1];
      } else if (type[i+128*j].equals("wallNoClipBottomLeftCornerLightBlue") || type[i+128*j]=="wallNoClipBottomLeftCornerLightBlue") {
        img=wallLightBlue[2];
      } else if (type[i+128*j].equals("wallNoClipBottomRightLightBlue") || type[i+128*j]=="wallNoClipBottomRightLightBlue") {
        img=wallLightBlue[3];
      } else if (type[i+128*j].equals("wallNoClipBottomRightCornerLightBlue") || type[i+128*j]=="wallNoClipBottomRightCornerLightBlue") {
        img=wallLightBlue[4];
      } else if (type[i+128*j].equals("wallNoClipCenterLightBlue") || type[i+128*j]=="wallNoClipCenterLightBlue") {
        img=wallLightBlue[5];
      } else if (type[i+128*j].equals("wallNoClipLeftLightBlue") || type[i+128*j]=="wallNoClipLeftLightBlue") {
        img=wallLightBlue[6];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomLightBlue") || type[i+128*j]=="emptywallNoClipLineBottomLightBlue") {
        img=wallLightBlue[7];
      } else if (type[i+128*j].equals("wallNoClipLineBottomLeftLightBlue") || type[i+128*j]=="wallNoClipLineBottomLeftLightBlue") {
        img=wallLightBlue[8];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomLeftCornerLightBlue") || type[i+128*j]=="emptywallNoClipLineBottomLeftCornerLightBlue") {
        img=wallLightBlue[9];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightLightBlue") ||type[i+128*j]=="emptywallLineBottomRightLightBlue") {
        img=wallLightBlue[10];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightCornerLightBlue") || type[i+128*j]=="emptywallNoClipLineBottomRightCornerLightBlue") {
        img=wallLightBlue[11];
      } else if (type[i+128*j].equals("wallNoClipLineLeftLightBlue") || type[i+128*j]=="wallNoClipLineLeftLightBlue") {
        img=wallLightBlue[12];
      } else if (type[i+128*j].equals("emptywallNoClipLineRightLightBlue") || type[i+128*j]=="emptywallNoClipLineRightLightBlue") {
        img=wallLightBlue[14];
      } else if (type[i+128*j].equals("wallNoClipLineTopLightBlue") || type[i+128*j]=="wallNoClipLineTopLightBlue") {
        img=wallLightBlue[15];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftLightBlue") || type[i+128*j]=="wallNoClipLineTopLeftLightBlue") {
        img=wallLightBlue[16];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftCornerLightBlue") || type[i+128*j]=="wallNoClipLineTopLeftCornerLightBlue") {
        img=wallLightBlue[17];
      } else if (type[i+128*j].equals("wallNoClipLineTopRightLightBlue") || type[i+128*j]=="wallNoClipLineTopRightLightBlue") {
        img=wallLightBlue[18];
      } else if (type[i+128*j].equals("emptywallNoClipLineTopRightCornerLightBlue") || type[i+128*j]=="emptywallNoClipLineTopRightCornerLightBlue") {
        img=wallLightBlue[13];
      } else if (type[i+128*j].equals("wallNoClipRightLightBlue") ||type[i+128*j]=="wallNoClipRightLightBlue") {
        img=wallLightBlue[20];
      } else if (type[i+128*j].equals("wallNoClipTopLightBlue") ||type[i+128*j]=="wallNoClipTopLightBlue") {
        img=wallLightBlue[21];
      } else if (type[i+128*j].equals("wallNoClipTopLeftLightBlue") || type[i+128*j]=="wallNoClipTopLeftLightBlue") {
        img=wallLightBlue[22];
      } else if (type[i+128*j].equals("wallNoClipTopLeftCornerLightBlue") || type[i+128*j]=="wallNoClipTopLeftCornerLightBlue") {
        img=wallLightBlue[23];
      } else if (type[i+128*j].equals("wallNoClipTopRightLightBlue") || type[i+128*j]=="wallNoClipTopRightLightBlue") {
        img=wallLightBlue[24];
      } else if (type[i+128*j].equals("wallNoClipTopRightCornerLightBlue") || type[i+128*j]=="wallNoClipTopRightCornerLightBlue") {
        img=wallLightBlue[25];
      } else if (type[i+128*j].equals("wallNoClipChiseledLightBlue") ||type[i+128*j]=="wallNoClipChiseledLightBlue") {
        img=wallLightBlue[19];
      } else if (type[i+128*j].equals("wallNoClipBottomGreen") || type[i+128*j]=="wallNoClipBottomGreen") {
        img=wallGreen[0];
      } else if (type[i+128*j].equals("wallNoClipBottomLeftGreen") || type[i+128*j]=="wallNoClipBottomLeftGreen") {
        img=wallGreen[1];
      } else if (type[i+128*j].equals("wallNoClipBottomLeftCornerGreen") || type[i+128*j]=="wallNoClipBottomLeftCornerGreen") {
        img=wallGreen[2];
      } else if (type[i+128*j].equals("wallNoClipBottomRightGreen") || type[i+128*j]=="wallNoClipBottomRightGreen") {
        img=wallGreen[3];
      } else if (type[i+128*j].equals("wallNoClipBottomRightCornerGreen") || type[i+128*j]=="wallNoClipBottomRightCornerGreen") {
        img=wallGreen[4];
      } else if (type[i+128*j].equals("wallNoClipCenterGreen") || type[i+128*j]=="wallNoClipCenterGreen") {
        img=wallGreen[5];
      } else if (type[i+128*j].equals("wallNoClipLeftGreen") || type[i+128*j]=="wallNoClipLeftGreen") {
        img=wallGreen[6];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomGreen") || type[i+128*j]=="emptywallNoClipLineBottomGreen") {
        img=wallGreen[7];
      } else if (type[i+128*j].equals("wallNoClipLineBottomLeftGreen") || type[i+128*j]=="wallNoClipLineBottomLeftGreen") {
        img=wallGreen[8];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomLeftCornerGreen") || type[i+128*j]=="emptywallNoClipLineBottomLeftCornerGreen") {
        img=wallGreen[9];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightGreen") ||type[i+128*j]=="emptywallNoClipLineBottomRightGreen") {
        img=wallGreen[10];
      } else if (type[i+128*j].equals("emptywallNoClipLineBottomRightCornerGreen") || type[i+128*j]=="emptywallNoClipLineBottomRightCornerGreen") {
        img=wallGreen[11];
      } else if (type[i+128*j].equals("wallNoClipLineLeftGreen") || type[i+128*j]=="wallNoClipLineLeftGreen") {
        img=wallGreen[12];
      } else if (type[i+128*j].equals("emptywallNoClipLineRightGreen") || type[i+128*j]=="emptywallNoClipLineRightGreen") {
        img=wallGreen[14];
      } else if (type[i+128*j].equals("wallNoClipLineTopGreen") || type[i+128*j]=="wallNoClipLineTopGreen") {
        img=wallGreen[15];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftGreen") || type[i+128*j]=="wallNoClipLineTopLeftGreen") {
        img=wallGreen[16];
      } else if (type[i+128*j].equals("wallNoClipLineTopLeftCornerGreen") || type[i+128*j]=="wallNoClipLineTopLeftCornerGreen") {
        img=wallGreen[17];
      } else if (type[i+128*j].equals("wallNoClipLineTopRightGreen") || type[i+128*j]=="wallNoClipLineTopRightGreen") {
        img=wallGreen[18];
      } else if (type[i+128*j].equals("emptywallNoClipLineTopRightCornerGreen") || type[i+128*j]=="emptywallNoClipLineTopRightCornerGreen") {
        img=wallGreen[13];
      } else if (type[i+128*j].equals("wallNoClipRightGreen") ||type[i+128*j]=="wallNoClipRightGreen") {
        img=wallGreen[20];
      } else if (type[i+128*j].equals("wallNoClipTopGreen") ||type[i+128*j]=="wallNoClipTopGreen") {
        img=wallGreen[21];
      } else if (type[i+128*j].equals("wallNoClipTopLeftGreen") || type[i+128*j]=="wallNoClipTopLeftGreen") {
        img=wallGreen[22];
      } else if (type[i+128*j].equals("wallNoClipTopLeftCornerGreen") || type[i+128*j]=="wallNoClipTopLeftCornerGreen") {
        img=wallGreen[23];
      } else if (type[i+128*j].equals("wallNoClipTopRightGreen") || type[i+128*j]=="wallNoClipTopRightGreen") {
        img=wallGreen[24];
      } else if (type[i+128*j].equals("wallNoClipTopRightCornerGreen") || type[i+128*j]=="wallNoClipTopRightCornerGreen") {
        img=wallGreen[25];
      } else if (type[i+128*j].equals("wallNoClipChiseledGreen") ||type[i+128*j]=="wallNoClipChiseledGreen") {
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
        fill(120, 120, 120, 150);
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
    save.save("../data/levels/lvlsPrint/"+lvl+".png");
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
