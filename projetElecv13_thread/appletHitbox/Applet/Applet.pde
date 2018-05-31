int x, y;
String []type=new String[0];
String types="empty";
String fichActuel="lvl1.txt";
PImage[] wallRed=new PImage[25], wallDarkBlue=new PImage[25], wallLightBlue=new PImage[25], wallGreen=new PImage[25], wallPurple=new PImage[25];
PImage lvl1, img, empty;
void setup() {
  size(1624, 800);
  lvl1=loadImage("testscene.png");
  for (int i=0; i<25; i++) {
    wallRed[i]=loadImage("BLOCKS/Red/Red"+i+".png");
    wallDarkBlue[i]=loadImage("BLOCKS/DarkBlue/DarkBlue"+i+".png");
    wallLightBlue[i]=loadImage("BLOCKS/LightBlue/LightBlue"+i+".png");
    wallGreen[i]=loadImage("BLOCKS/Green/Green"+i+".png");
    wallPurple[i]=loadImage("BLOCKS/Purple/Purple"+i+".png");
  }
  img=loadImage("BLOCKS/Empty.png");
  empty=loadImage("BLOCKS/Empty.png");

  type=loadStrings(fichActuel);
  if (type.length!=128*38) {
    for (int i=0; i<128*38; i++) {
      type=append(type, types);
    }
  }
  image(lvl1, 50, 50);
}

void draw() {
  background(40, 10, 10);
  image(lvl1, 50, 50);
  printImage();
}

void hitbox() {
  x=mouseX;
  y=mouseY;
  if (x>=1100 && x<=1132 && y>=50 && y<=82) {
    types="wallPurpleBottom";
  }
  if (x>=1100 && x<=1132 && y>=90 && y<=122) {
    types="wallPurpleBottomLeft";
  }
  if (x>=1100 && x<=1132 && y>=130 && y<=162) {
    types="wallPurpleBottomLeftCorner";
  }
  if (x>=1100 && x<=1132 && y>=170 && y<=202) {
    types="wallPurpleBottomRight";
  }
  if (x>=1100 && x<=1132 && y>=210 && y<=242) {
    types="wallPurpleBottomRightCorner";
  }
  if (x>=1100 && x<=1132 && y>=250 && y<=282) {
    types="wallPurpleCenter";
  }
  if (x>=1100 && x<=1132 && y>=290 && y<=322) {
    types="wallPurpleLeft";
  }
  if (x>=1100 && x<=1132 && y>=330 && y<=362) {
    types="wallPurpleLineBottom";
  }
  if (x>=1100 && x<=1132 && y>=370 && y<=402) {
    types="wallPurpleLineBottomLeft";
  }
  if (x>=1100 && x<=1132 && y>=410 && y<=442) {
    types="wallPurpleLineBottomLeftCorner";
  }
  if (x>=1100 && x<=1132 && y>=450 && y<=482) {
    types="wallPurpleLineBottomRight";
  }
  if (x>=1100 && x<=1132 && y>=490 && y<=522) {
    types="wallPurpleLineBottomRightCorner";
  }
  if (x>=1125 && x<=1157 && y>=530 && y<=562) {
    types="wallPurpleLineLeft";
  }
  if (x>=1150 && x<=1182 && y>=490 && y<=522) {
    types="wallPurpleLineRight";
  }
  if (x>=1150 && x<=1182 && y>=450 && y<=482) {
    types="wallPurpleLineTop";
  }
  if (x>=1150 && x<=1182 && y>=410 && y<=442) {
    types="wallPurpleLineTopLeft";
  }
  if (x>=1150 && x<=1182 && y>=370 && y<=402) {
    types="wallPurpleLineTopLeftCorner";
  }
  if (x>=1150 && x<=1182 && y>=330 && y<=362) {
    types="wallPurpleLineTopRight";
  }
  if (x>=1150 && x<=1182 && y>=290 && y<=322) {
    types="wallPurpleLineTopRightCorner";
  }
  if (x>=1150 && x<=1182 && y>=250 && y<=282) {
    types="wallPurpleRight";
  }
  if (x>=1150 && x<=1182 && y>=210 && y<=242) {
    types="wallPurpleTop";
  }
  if (x>=1150 && x<=1182 && y>=170 && y<=202) {
    types="wallPurpleTopLeft";
  }
  if (x>=1150 && x<=1182 && y>=130 && y<=162) {
    types="wallPurpleTopLeftCorner";
  }
  if (x>=1150 && x<=1182 && y>=90 && y<=122) {
    types="wallPurpleTopRight";
  }
  if (x>=1150 && x<=1182 && y>=50 && y<=82) {
    types="wallPurpleTopRightCorner";
  } ////////////////////////////////////////////// 
  if (x>=1200 && x<=1232 && y>=50 && y<=82) {
    types="wallRedBottom";
  }
  if (x>=1200 && x<=1232 && y>=90 && y<=122) {
    types="wallRedBottomLeft";
  }
  if (x>=1200 && x<=1232 && y>=130 && y<=162) {
    types="wallRedBottomLeftCorner";
  }
  if (x>=1200 && x<=1232 && y>=170 && y<=202) {
    types="wallRedBottomRight";
  }
  if (x>=1200 && x<=1232 && y>=210 && y<=242) {
    types="wallRedBottomRightCorner";
  }
  if (x>=1200 && x<=1232 && y>=250 && y<=282) {
    types="wallRedCenter";
  }
  if (x>=1200 && x<=1232 && y>=290 && y<=322) {
    types="wallRedLeft";
  }
  if (x>=1200 && x<=1232 && y>=330 && y<=362) {
    types="wallRedLineBottom";
  }
  if (x>=1200 && x<=1232 && y>=370 && y<=402) {
    types="wallRedLineBottomLeft";
  }
  if (x>=1200 && x<=1232 && y>=410 && y<=442) {
    types="wallRedLineBottomLeftCorner";
  }
  if (x>=1200 && x<=1232 && y>=450 && y<=482) {
    types="wallRedLineBottomRight";
  }
  if (x>=1200 && x<=1232 && y>=490 && y<=522) {
    types="wallRedLineBottomRightCorner";
  }
  if (x>=1225 && x<=1257 && y>=530 && y<=562) {
    types="wallRedLineLeft";
  }
  if (x>=1250 && x<=1282 && y>=490 && y<=522) {
    types="wallRedLineRight";
  }
  if (x>=1250 && x<=1282 && y>=450 && y<=482) {
    types="wallRedLineTop";
  }
  if (x>=1250 && x<=1282 && y>=410 && y<=442) {
    types="wallRedLineTopLeft";
  }
  if (x>=1250 && x<=1282 && y>=370 && y<=402) {
    types="wallRedLineTopLeftCorner";
  }
  if (x>=1250 && x<=1282 && y>=330 && y<=362) {
    types="wallRedLineTopRight";
  }
  if (x>=1250 && x<=1282 && y>=290 && y<=322) {
    types="wallRedLineTopRightCorner";
  }
  if (x>=1250 && x<=1282 && y>=250 && y<=282) {
    types="wallRedRight";
  }
  if (x>=1250 && x<=1282 && y>=210 && y<=242) {
    types="wallRedTop";
  }
  if (x>=1250 && x<=1282 && y>=170 && y<=202) {
    types="wallRedTopLeft";
  }
  if (x>=1250 && x<=1282 && y>=130 && y<=162) {
    types="wallRedTopLeftCorner";
  }
  if (x>=1250 && x<=1282 && y>=90 && y<=122) {
    types="wallRedTopRight";
  }
  if (x>=1250 && x<=1282 && y>=50 && y<=82) {
    types="wallRedTopRightCorner";
  }/////////////////////////
  if (x>=1300 && x<=1332 && y>=50 && y<=82) {
    types="wallDarkBlueBottom";
  }
  if (x>=1300 && x<=1332 && y>=90 && y<=122) {
    types="wallDarkBlueBottomLeft";
  }
  if (x>=1300 && x<=1332 && y>=130 && y<=162) {
    types="wallDarkBlueBottomLeftCorner";
  }
  if (x>=1300 && x<=1332 && y>=170 && y<=202) {
    types="wallDarkBlueBottomRight";
  }
  if (x>=1300 && x<=1332 && y>=210 && y<=242) {
    types="wallDarkBlueBottomRightCorner";
  }
  if (x>=1300 && x<=1332 && y>=250 && y<=282) {
    types="wallDarkBlueCenter";
  }
  if (x>=1300 && x<=1332 && y>=290 && y<=322) {
    types="wallDarkBlueLeft";
  }
  if (x>=1300 && x<=1332 && y>=330 && y<=362) {
    types="wallDarkBlueLineBottom";
  }
  if (x>=1300 && x<=1332 && y>=370 && y<=402) {
    types="wallDarkBlueLineBottomLeft";
  }
  if (x>=1300 && x<=1332 && y>=410 && y<=442) {
    types="wallDarkBlueLineBottomLeftCorner";
  }
  if (x>=1300 && x<=1332 && y>=450 && y<=482) {
    types="wallDarkBlueLineBottomRight";
  }
  if (x>=1300 && x<=1332 && y>=490 && y<=522) {
    types="wallDarkBlueLineBottomRightCorner";
  }
  if (x>=1325 && x<=1357 && y>=530 && y<=562) {
    types="wallDarkBlueLineLeft";
  }
  if (x>=1350 && x<=1382 && y>=490 && y<=522) {
    types="wallDarkBlueLineRight";
  }
  if (x>=1350 && x<=1382 && y>=450 && y<=482) {
    types="wallDarkBlueLineTop";
  }
  if (x>=1350 && x<=1382 && y>=410 && y<=442) {
    types="wallDarkBlueLineTopLeft";
  }
  if (x>=1350 && x<=1382 && y>=370 && y<=402) {
    types="wallDarkBlueLineTopLeftCorner";
  }
  if (x>=1350 && x<=1382 && y>=330 && y<=362) {
    types="wallDarkBlueLineTopRight";
  }
  if (x>=1350 && x<=1382 && y>=290 && y<=322) {
    types="wallDarkBlueLineTopRightCorner";
  }
  if (x>=1350 && x<=1382 && y>=250 && y<=282) {
    types="wallDarkBlueRight";
  }
  if (x>=1350 && x<=1382 && y>=210 && y<=242) {
    types="wallDarkBlueTop";
  }
  if (x>=1350 && x<=1382 && y>=170 && y<=202) {
    types="wallDarkBlueTopLeft";
  }
  if (x>=1350 && x<=1382 && y>=130 && y<=162) {
    types="wallDarkBlueTopLeftCorner";
  }
  if (x>=1350 && x<=1382 && y>=90 && y<=122) {
    types="wallDarkBlueTopRight";
  }
  if (x>=1350 && x<=1382 && y>=50 && y<=82) {
    types="wallDarkBlueTopRightCorner";
  }////////////////////////////////
  if (x>=1400 && x<=1432 && y>=50 && y<=82) {
    types="wallLightBlueBottom";
  }
  if (x>=1400 && x<=1432 && y>=90 && y<=122) {
    types="wallLightBlueBottomLeft";
  }
  if (x>=1400 && x<=1432 && y>=130 && y<=162) {
    types="wallLightBlueBottomLeftCorner";
  }
  if (x>=1400 && x<=1432 && y>=170 && y<=202) {
    types="wallLightBlueBottomRight";
  }
  if (x>=1400 && x<=1432 && y>=210 && y<=242) {
    types="wallLightBlueBottomRightCorner";
  }
  if (x>=1100 && x<=1432 && y>=250 && y<=282) {
    types="wallLightBlueCenter";
  }
  if (x>=1400 && x<=1432 && y>=290 && y<=322) {
    types="wallLightBlueLeft";
  }
  if (x>=1400 && x<=1432 && y>=330 && y<=362) {
    types="wallLightBlueLineBottom";
  }
  if (x>=1400 && x<=1432 && y>=370 && y<=402) {
    types="wallLightBlueLineBottomLeft";
  }
  if (x>=1400 && x<=1432 && y>=410 && y<=442) {
    types="wallLightBlueLineBottomLeftCorner";
  }
  if (x>=1400 && x<=1432 && y>=450 && y<=482) {
    types="wallLightBlueLineBottomRight";
  }
  if (x>=1400 && x<=1432 && y>=490 && y<=522) {
    types="wallLightBlueLineBottomRightCorner";
  }
  if (x>=1425 && x<=1457 && y>=530 && y<=562) {
    types="wallLightBlueLineLeft";
  }
  if (x>=1450 && x<=1482 && y>=490 && y<=522) {
    types="wallLightBlueLineRight";
  }
  if (x>=1450 && x<=1482 && y>=450 && y<=482) {
    types="wallLightBlueLineTop";
  }
  if (x>=1450 && x<=1482 && y>=410 && y<=442) {
    types="wallLightBlueLineTopLeft";
  }
  if (x>=1450 && x<=1482 && y>=370 && y<=402) {
    types="wallLightBlueLineTopLeftCorner";
  }
  if (x>=1450 && x<=1482 && y>=330 && y<=362) {
    types="wallLightBlueLineTopRight";
  }
  if (x>=1450 && x<=1482 && y>=290 && y<=322) {
    types="wallLightBlueLineTopRightCorner";
  }
  if (x>=1450 && x<=1482 && y>=250 && y<=282) {
    types="wallLightBlueRight";
  }
  if (x>=1450 && x<=1482 && y>=210 && y<=242) {
    types="wallLightBlueTop";
  }
  if (x>=1450 && x<=1482 && y>=170 && y<=202) {
    types="wallLightBlueTopLeft";
  }
  if (x>=1450 && x<=1482 && y>=130 && y<=162) {
    types="wallLightBlueTopLeftCorner";
  }
  if (x>=1450 && x<=1482 && y>=90 && y<=122) {
    types="wallLightBlueTopRight";
  }
  if (x>=1450 && x<=1482 && y>=50 && y<=82) {
    types="wallLightBlueTopRightCorner";
  }///////////////////////////
  if (x>=1500 && x<=1532 && y>=50 && y<=82) {
    types="wallGreenBottom";
  }
  if (x>=1500 && x<=1532 && y>=90 && y<=122) {
    types="wallGreenBottomLeft";
  }
  if (x>=1500 && x<=1532 && y>=130 && y<=162) {
    types="wallGreenBottomLeftCorner";
  }
  if (x>=1500 && x<=1532 && y>=170 && y<=202) {
    types="wallGreenBottomRight";
  }
  if (x>=1500 && x<=1532 && y>=210 && y<=242) {
    types="wallGreenBottomRightCorner";
  }
  if (x>=1500 && x<=1532 && y>=250 && y<=282) {
    types="wallGreenCenter";
  }
  if (x>=1500 && x<=1532 && y>=290 && y<=322) {
    types="wallGreenLeft";
  }
  if (x>=1500 && x<=1532 && y>=330 && y<=362) {
    types="wallGreenLineBottom";
  }
  if (x>=1500 && x<=1532 && y>=370 && y<=402) {
    types="wallGreenLineBottomLeft";
  }
  if (x>=1500 && x<=1532 && y>=410 && y<=442) {
    types="wallGreenLineBottomLeftCorner";
  }
  if (x>=1500 && x<=1532 && y>=450 && y<=482) {
    types="wallGreenLineBottomRight";
  }
  if (x>=1500 && x<=1532 && y>=490 && y<=522) {
    types="wallGreenLineBottomRightCorner";
  }
  if (x>=1525 && x<=1557 && y>=530 && y<=562) {
    types="wallGreenLineLeft";
  }
  if (x>=1550 && x<=1582 && y>=490 && y<=522) {
    types="wallGreenLineRight";
  }
  if (x>=1550 && x<=1582 && y>=450 && y<=482) {
    types="wallGreenLineTop";
  }
  if (x>=1550 && x<=1582 && y>=410 && y<=442) {
    types="wallGreenLineTopLeft";
  }
  if (x>=1550 && x<=1582 && y>=370 && y<=402) {
    types="wallGreenLineTopLeftCorner";
  }
  if (x>=1550 && x<=1582 && y>=330 && y<=362) {
    types="wallGreenLineTopRight";
  }
  if (x>=1550 && x<=1582 && y>=290 && y<=322) {
    types="wallGreenLineTopRightCorner";
  }
  if (x>=1550 && x<=1582 && y>=250 && y<=282) {
    types="wallGreenRight";
  }
  if (x>=1550 && x<=1582 && y>=210 && y<=242) {
    types="wallGreenTop";
  }
  if (x>=1550 && x<=1582 && y>=170 && y<=202) {
    types="wallGreenTopLeft";
  }
  if (x>=1550 && x<=1582 && y>=130 && y<=162) {
    types="wallGreenTopLeftCorner";
  }
  if (x>=1550 && x<=1582 && y>=90 && y<=122) {
    types="wallGreenTopRight";
  }
  if (x>=1550 && x<=1582 && y>=50 && y<=82) {
    types="wallGreenTopRightCorner";
  }
/////////////////////////////////////////////////////////////
  if(x>=1100 && x<=1150 && y>=570 && y<=620){
    types="BJump";
  }
  if(x>=1160 && x<=1210 && y>=570 && y<=620){
    types="empty";
  }
  if(x>=1220 && x<=1270 && y>=570 && y<=620){
    types="spike";
  }
  if(x>=1280 && x<=1330 && y>=570 && y<=620){
    types="noClip";
  }
  if(x>=1340 && x<=1390 && y>=570 && y<=620){
    types="BnoClip";
  }
  if(x>=1400 && x<=1450 && y>=570 && y<=620){
    types="hero";
  }
  if(x>=1460 && x<=1510 && y>=570 && y<=620){
    types="BDash";
  }
  if(x>=1520 && x<=1570 && y>=570 && y<=620){
    types="end";
  }


  if (x>=980 && x<=1200 && y>=700 && y<=750) {
    saveStrings(fichActuel, type);
  }
  if (x>=100 && x<=390 && y>=700 && y<=750) {
    type=loadStrings(fichActuel);
  }
}
void printImage() {
  for (int i=0; i<12; i++) {
    image(wallPurple[i], 1100, (i*40)+50);
    image(wallPurple[24-i], 1150, i*40+50);
    image(wallRed[i], 1200, 50+i*40);
    image(wallRed[24-i], 1250, 50+i*40);
    image(wallDarkBlue[i], 1300, (i*40)+50);
    image(wallDarkBlue[24-i], 1350, (i*40)+50);
    image(wallLightBlue[i], 1400, (i*40)+50);
    image(wallLightBlue[24-i], 1450, (i*40)+50);
    image(wallGreen[i], 1500, (i*40)+50);
    image(wallGreen[24-i], 1550, (i*40)+50);
  }
  image(wallPurple[12], 1125, 12*40+50);
  image(wallRed[12], 1225, 12*40+50);
  image(wallDarkBlue[12], 1325, 12*40+50);
  image(wallLightBlue[12], 1425, 12*40+50);
  image(wallGreen[12], 1525, 12*40+50);
  fill(255, 255, 255);
  text("x="+x, 1110, 650);
  text("y="+y, 1210, 650);
  text("sauvegarde", 1000, 730);
  text("actualiser", 120, 730);
  textSize(18);
  text(types, 1290, 650);
  textSize(13);
  text("BJump", 1104, 600);
  text("empty", 1165, 600);
  text("spike", 1227, 600);
  text("noClip", 1284, 600);
  text("BnoClip", 1342, 600);
  text("hero", 1411, 600);
  text("BDash", 1466, 600);
  text("end", 1532, 600);
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
  rect(1520, 570, 50, 50);
  stroke(255, 255, 255);
  fill(255, 255, 255, 100);
  rect(980, 700, 220, 50, 8);
  rect(100, 700, 190, 50, 8);
  textSize(22);


  for (int i=0; i<128; i++) {
    for (int j=0; j<38; j++) {
      stroke(0);
      fill(255, 255, 255, 0);
      if (i%4==0 && j%2==0 &&j<37 && type[i+128*j].startsWith("wall")) {//&& type[i%4+128*j].startsWith("wall") && j<37){
        type[i+1+128*j]="wall";
        type[i+2+128*j]="wall";
        type[i+3+128*j]="wall";
        type[i+128*(j+1)]="wall";
        type[i+1+128*(j+1)]="wall";
        type[i+2+128*(j+1)]="wall";
        type[i+3+128*(j+1)]="wall";
      }
      if (x>50+8*i && x<50+(8*i+8) && y>50+16*j && y<50+(16*j+16) && x<1074 && y<=650) {
        type[i+128*j]=types;
      }
      if (type[i+128*j].equals("wallPurpleBottom") || type[i+128*j]=="wallPurpleBottom") {
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
        img=wallPurple[13];
      } else if (type[i+128*j].equals("wallPurpleLineTop") || type[i+128*j]=="wallPurpleLineTop") {
        img=wallPurple[14];
      } else if (type[i+128*j].equals("wallPurpleLineTopLeft") || type[i+128*j]=="wallPurpleLineTopLeft") {
        img=wallPurple[15];
      } else if (type[i+128*j].equals("wallPurpleLineTopLeftCorner") || type[i+128*j]=="wallPurpleLineTopLeftCorner") {
        img=wallPurple[16];
      } else if (type[i+128*j].equals("wallPurpleLineTopRight") || type[i+128*j]=="wallPurpleLineTopRight") {
        img=wallPurple[17];
      } else if (type[i+128*j].equals("wallPurpleLineTopRightCorner") || type[i+128*j]=="wallPurpleLineTopRightCorner") {
        img=wallPurple[18];
      } else if (type[i+128*j].equals("wallPurpleRight") ||type[i+128*j]=="wallPurpleRight") {
        img=wallPurple[19];
      } else if (type[i+128*j].equals("wallPurpleTop") ||type[i+128*j]=="wallPurpleTop") {
        img=wallPurple[20];
      } else if (type[i+128*j].equals("wallPurpleTopLeft") || type[i+128*j]=="wallPurpleTopLeft") {
        img=wallPurple[21];
      } else if (type[i+128*j].equals("wallPurpleTopLeftCorner") || type[i+128*j]=="wallPurpleTopLeftCorner") {
        img=wallPurple[22];
      } else if (type[i+128*j].equals("wallPurpleTopRight") || type[i+128*j]=="wallPurpleTopRight") {
        img=wallPurple[23];
      } else if (type[i+128*j].equals("wallPurpleTopRightCorner") || type[i+128*j]=="wallPurpleTopRightCorner") {
        img=wallPurple[24];
      } /////////////////////////////////////////

      if (type[i+128*j].equals("wallRedBottom") || type[i+128*j]=="wallRedBottom") {
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
        img=wallRed[13];
      } else if (type[i+128*j].equals("wallRedLineTop") || type[i+128*j]=="wallRedLineTop") {
        img=wallRed[14];
      } else if (type[i+128*j].equals("wallRedLineTopLeft") || type[i+128*j]=="wallRedLineTopLeft") {
        img=wallRed[15];
      } else if (type[i+128*j].equals("wallRedLineTopLeftCorner") || type[i+128*j]=="wallRedLineTopLeftCorner") {
        img=wallRed[16];
      } else if (type[i+128*j].equals("wallRedLineTopRight") || type[i+128*j]=="wallRedLineTopRight") {
        img=wallRed[17];
      } else if (type[i+128*j].equals("wallRedLineTopRightCorner") || type[i+128*j]=="wallRedLineTopRightCorner") {
        img=wallRed[18];
      } else if (type[i+128*j].equals("wallRedRight") ||type[i+128*j]=="wallRedRight") {
        img=wallRed[19];
      } else if (type[i+128*j].equals("wallRedTop") ||type[i+128*j]=="wallRedTop") {
        img=wallRed[20];
      } else if (type[i+128*j].equals("wallRedTopLeft") || type[i+128*j]=="wallRedTopLeft") {
        img=wallRed[21];
      } else if (type[i+128*j].equals("wallRedTopLeftCorner") || type[i+128*j]=="wallRedTopLeftCorner") {
        img=wallRed[22];
      } else if (type[i+128*j].equals("wallRedTopRight") || type[i+128*j]=="wallRedTopRight") {
        img=wallRed[23];
      } else if (type[i+128*j].equals("wallRedTopRightCorner") || type[i+128*j]=="wallRedTopRightCorner") {
        img=wallRed[24];
      }///////////////////////////////
      if (type[i+128*j].equals("wallDarkBlueBottom") || type[i+128*j]=="wallDarkBlueBottom") {
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
        img=wallDarkBlue[13];
      } else if (type[i+128*j].equals("wallDarkBlueLineTop") || type[i+128*j]=="wallDarkBlueLineTop") {
        img=wallDarkBlue[14];
      } else if (type[i+128*j].equals("wallDarkBlueLineTopLeft") || type[i+128*j]=="wallDarkBlueLineTopLeft") {
        img=wallDarkBlue[15];
      } else if (type[i+128*j].equals("wallDarkBlueLineTopLeftCorner") || type[i+128*j]=="wallDarkBlueLineTopLeftCorner") {
        img=wallDarkBlue[16];
      } else if (type[i+128*j].equals("wallDarkBlueLineTopRight") || type[i+128*j]=="wallDarkBlueLineTopRight") {
        img=wallDarkBlue[17];
      } else if (type[i+128*j].equals("wallDarkBlueLineTopRightCorner") || type[i+128*j]=="wallDarkBlueLineTopRightCorner") {
        img=wallDarkBlue[18];
      } else if (type[i+128*j].equals("wallDarkBlueRight") ||type[i+128*j]=="wallDarkBlueRight") {
        img=wallDarkBlue[19];
      } else if (type[i+128*j].equals("wallDarkBlueTop") ||type[i+128*j]=="wallDarkBlueTop") {
        img=wallDarkBlue[20];
      } else if (type[i+128*j].equals("wallDarkBlueTopLeft") || type[i+128*j]=="wallDarkBlueTopLeft") {
        img=wallDarkBlue[21];
      } else if (type[i+128*j].equals("wallDarkBlueTopLeftCorner") || type[i+128*j]=="wallDarkBlueTopLeftCorner") {
        img=wallDarkBlue[22];
      } else if (type[i+128*j].equals("wallDarkBlueTopRight") || type[i+128*j]=="wallDarkBlueTopRight") {
        img=wallDarkBlue[23];
      } else if (type[i+128*j].equals("wallDarkBlueTopRightCorner") || type[i+128*j]=="wallDarkBlueTopRightCorner") {
        img=wallDarkBlue[24];
      } ////////////////////////////////
      if (type[i+128*j].equals("wallLightBlueBottom") || type[i+128*j]=="wallLightBlueBottom") {
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
        img=wallLightBlue[13];
      } else if (type[i+128*j].equals("wallLightBlueLineTop") || type[i+128*j]=="wallLightBlueLineTop") {
        img=wallLightBlue[14];
      } else if (type[i+128*j].equals("wallLightBlueLineTopLeft") || type[i+128*j]=="wallLightBlueLineTopLeft") {
        img=wallLightBlue[15];
      } else if (type[i+128*j].equals("wallLightBlueLineTopLeftCorner") || type[i+128*j]=="wallLightBlueLineTopLeftCorner") {
        img=wallLightBlue[16];
      } else if (type[i+128*j].equals("wallLightBlueLineTopRight") || type[i+128*j]=="wallLightBlueLineTopRight") {
        img=wallLightBlue[17];
      } else if (type[i+128*j].equals("wallLightBlueLineTopRightCorner") || type[i+128*j]=="wallLightBlueLineTopRightCorner") {
        img=wallLightBlue[18];
      } else if (type[i+128*j].equals("wallLightBlueRight") ||type[i+128*j]=="wallLightBlueRight") {
        img=wallLightBlue[19];
      } else if (type[i+128*j].equals("wallLightBlueTop") ||type[i+128*j]=="wallLightBlueTop") {
        img=wallLightBlue[20];
      } else if (type[i+128*j].equals("wallLightBlueTopLeft") || type[i+128*j]=="wallLightBlueTopLeft") {
        img=wallLightBlue[21];
      } else if (type[i+128*j].equals("wallLightBlueTopLeftCorner") || type[i+128*j]=="wallLightBlueTopLeftCorner") {
        img=wallLightBlue[22];
      } else if (type[i+128*j].equals("wallLightBlueTopRight") || type[i+128*j]=="wallLightBlueTopRight") {
        img=wallLightBlue[23];
      } else if (type[i+128*j].equals("wallLightBlueTopRightCorner") || type[i+128*j]=="wallLightBlueTopRightCorner") {
        img=wallLightBlue[24];
      } //////////////////////////////////////
      if (type[i+128*j].equals("wallGreenBottom") || type[i+128*j]=="wallGreenBottom") {
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
        img=wallGreen[13];
      } else if (type[i+128*j].equals("wallGreenLineTop") || type[i+128*j]=="wallGreenLineTop") {
        img=wallGreen[14];
      } else if (type[i+128*j].equals("wallGreenLineTopLeft") || type[i+128*j]=="wallGreenLineTopLeft") {
        img=wallGreen[15];
      } else if (type[i+128*j].equals("wallGreenLineTopLeftCorner") || type[i+128*j]=="wallGreenLineTopLeftCorner") {
        img=wallGreen[16];
      } else if (type[i+128*j].equals("wallGreenLineTopRight") || type[i+128*j]=="wallGreenLineTopRight") {
        img=wallGreen[17];
      } else if (type[i+128*j].equals("wallGreenLineTopRightCorner") || type[i+128*j]=="wallGreenLineTopRightCorner") {
        img=wallGreen[18];
      } else if (type[i+128*j].equals("wallGreenRight") ||type[i+128*j]=="wallGreenRight") {
        img=wallGreen[19];
      } else if (type[i+128*j].equals("wallGreenTop") ||type[i+128*j]=="wallGreenTop") {
        img=wallGreen[20];
      } else if (type[i+128*j].equals("wallGreenTopLeft") || type[i+128*j]=="wallGreenTopLeft") {
        img=wallGreen[21];
      } else if (type[i+128*j].equals("wallGreenTopLeftCorner") || type[i+128*j]=="wallGreenTopLeftCorner") {
        img=wallGreen[22];
      } else if (type[i+128*j].equals("wallGreenTopRight") || type[i+128*j]=="wallGreenTopRight") {
        img=wallGreen[23];
      } else if (type[i+128*j].equals("wallGreenTopRightCorner") || type[i+128*j]=="wallGreenTopRightCorner") {
        img=wallGreen[24];
      } else if (type[i+128*j].equals("BJump") || type[i+128*j]=="BJump") {
        fill(255, 255, 0, 150);
      } else if (type[i+128*j].equals("BnoClip") || type[i+128*j]=="BnoClip") {
        fill(255, 255, 255);
      } else if (type[i+128*j].equals("BDash") || type[i+128*j]=="BDash") {
        fill(140, 24, 202, 150);
      } else if (type[i+128*j].equals("empty") || type[i+128*j]=="empty") {
        fill(0, 255, 0, 150);
      } else if (type[i+128*j].equals("spike") || type[i+128*j]=="spike") {
        fill(255, 0, 0, 150);
      } else if (type[i+128*j].equals("noClip") || type[i+128*j]=="noClip") {
        fill(100, 100, 100, 150);
      } else if (type[i+128*j].equals("hero") || type[i+128*j]=="hero") {
        fill(255, 20, 147, 150);
      } else if (type[i+128*j].equals("end") || type[i+128*j]=="end") {
        fill(0, 255, 255, 150);
      }
      if (!type[i+128*j].equals("wall") && type[i+128*j].startsWith("wall")) {
        image(img, 50+8*i, 50+16*j);
      }
      rect(50+8*i, 50+16*j, 8, 16);
      //img=empty;
      // rect(50+8*i, 50+16*j, 8, 16);
      //line(32*i,0,32*i,608);
      //line(0,16*i,1024,16*i);
    }
  }
}

void printImagev1() {  
  for (int i=0; i<128; i++) {
    for (int j=0; j<38; j++) {
      stroke(0);
      fill(255, 255, 255, 0);
      if (x>50+8*i && x<50+(8*i+8) && y>50+16*j && y<50+(16*j+16) && x<1074 && y<=650) {
        type[i+128*j]=types;
      }
      if (i%4==0 && j%2==0 &&j<37 && type[i+128*j].startsWith("wall")) {//&& type[i%4+128*j].startsWith("wall") && j<37){
        type[i+1+128*j]="wall";
        type[i+2+128*j]="wall";
        type[i+3+128*j]="wall";
        type[i+128*(j+1)]="wall";
        type[i+1+128*(j+1)]="wall";
        type[i+2+128*(j+1)]="wall";
        type[i+3+128*(j+1)]="wall";
      }
      if (type[i+128*j].equals("wall") || type[i+128*j]=="wall") {
        fill(0, 0, 255, 150);
      } else if (type[i+128*j].equals("BJump") || type[i+128*j]=="BJump") {
        fill(255, 255, 0, 150);
      } else if (type[i+128*j].equals("BnoClip") || type[i+128*j]=="BnoClip") {
        fill(255, 255, 255);
      } else if (type[i+128*j].equals("BDash") || type[i+128*j]=="BDash") {
        fill(140, 24, 202, 150);
      } else if (type[i+128*j].equals("empty") || type[i+128*j]=="empty") {
        fill(0, 255, 0, 150);
      } else if (type[i+128*j].equals("spike") || type[i+128*j]=="spike") {
        fill(255, 0, 0, 150);
      } else if (type[i+128*j].equals("noClip") || type[i+128*j]=="noClip") {
        fill(100, 100, 100, 150);
      } else if (type[i+128*j].equals("hero") || type[i+128*j]=="hero") {
        fill(255, 20, 147, 150);
      } else if (type[i+128*j].equals("end") || type[i+128*j]=="end") {
        fill(0, 255, 255, 150);
      }
      rect(50+8*i, 50+16*j, 8, 16);
      //line(32*i,0,32*i,608);
      //line(0,16*i,1024,16*i);
    }
  }
  fill(255, 255, 255);
  text("x="+x, 980, 650);
  text("y="+y, 1110, 650);
  text("BJump", 1184, 45);
  text("BnoClip", 1384, 45);
  text("BDash", 1384, 125);
  text("wall", 1184, 125);
  text("empty", 1184, 205);
  text("spike", 1184, 285);
  text("noClip", 1184, 365);
  text("hero", 1184, 445);
  text("end", 1184, 525);
  text("sauvegarde", 1000, 730);
  text("actualiser", 120, 730);
  stroke(255, 255, 0);
  rect(1334, 10, 50, 50);
  fill(255, 255, 0, 100);
  rect(1134, 10, 50, 50);
  stroke(0, 0, 255);
  fill(0, 0, 255, 100);
  rect(1134, 90, 50, 50);
  stroke(140, 24, 202);
  fill(140, 24, 202, 100);
  rect(1334, 90, 50, 50);
  stroke(0, 255, 0);
  fill(0, 255, 0, 100);
  rect(1134, 170, 50, 50);
  stroke(153, 0, 0);
  fill(153, 0, 0, 100);  
  rect(1134, 250, 50, 50);
  stroke(255, 255, 255);
  fill(100, 100, 100, 100);
  rect(1134, 330, 50, 50);
  stroke(255, 20, 147);
  fill(255, 20, 147, 100);
  rect(1134, 410, 50, 50);
  stroke(0, 255, 255);
  fill(0, 255, 255, 100);
  rect(1134, 490, 50, 50);
  stroke(255, 255, 255);
  fill(255, 255, 255, 100);
  rect(980, 700, 220, 50, 8);
  rect(100, 700, 190, 50, 8);
  println(types);
  textSize(22);
}

void click() {
  x= mouseX;
  y=mouseY;

  if (x>=1134 && x<=1184 && y>=10 && y<=60) {
    types="BJump";
  }
  if (x>=1134 && x<=1184 && y>=90 && y<=140) {
    types="wall";
  }
  if (x>=1134 && x<=1184 && y>=170 && y<=220) {
    types="empty";
  }
  if (x>=1134 && x<=1184 && y>=250 && y<=300) {
    types="spike";
  }
  if (x>=1134 && x<=1184 && y>=330 && y<=380) {
    types="noClip";
  }
  if (x>=1134 && x<=1184 && y>=410 && y<=460) {
    types="hero";
  }
  if (x>=1134 && x<=1184 && y>=490 && y<=540) {
    types="end";
  }
  if (x>=1334 && x<=1384 && y>=10 && y<=60) {
    types="BnoClip";
  }
  if (x>=1334 && x<=1384 && y>=90 && y<=140) {
    types="BDash";
  }
  if (x>=980 && x<=1200 && y>=700 && y<=750) {
    saveStrings(fichActuel, type);
  }
  if (x>=100 && x<=390 && y>=700 && y<=750) {
    type=loadStrings(fichActuel);
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