int x, y;
String []type=new String[0];
String types="empty";
String fichActuel="lvl1.txt";
PImage lvl1;
void setup() {
  size(1524, 800);
  lvl1=loadImage("testscene.png");
  type=loadStrings(fichActuel);
  if (type.length!=128*38) {
    for (int i=0; i<128*38; i++) {
      type=append(type, types);
    }
  }
}

void draw() {
  background(0);
  image(lvl1, 50, 50);
  for (int i=0; i<128; i++) {
    for (int j=0; j<38; j++) {
      stroke(0);
      fill(255, 255, 255, 0);
      if (x>50+8*i && x<50+(8*i+8) && y>50+16*j && y<50+(16*j+16) && x<1074 && y<=650) {
        type[i+128*j]=types;
      }
      if (type[i+128*j].equals("wall") || type[i+128*j]=="wall") {
        fill(0, 0, 255, 150);
      } else if (type[i+128*j].equals("BJump") || type[i+128*j]=="BJump") {
        fill(255, 255, 0, 150);
      } else if (type[i+128*j].equals("BnoClip") || type[i+128*j]=="BnoClip") {
        fill(255, 255, 255);
      } else if (type[i+128*j].equals("BDash") || type[i+128*j]=="BDash"){
       fill(140,24,202,150); 
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
  textSize(32);
  fill(255, 255, 255);
  text("x="+x, 980, 650);
  text("y="+y, 1110, 650);
  text("BJump", 1184, 45);
  text("BnoClip", 1384, 45);
  text("BDash", 1384,125);
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
  stroke(140,24,202);
  fill(140,24,202,100);
  rect(1334,90,50,50);
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
  if(x>=1334 && x<=1384 && y>=10 && y<=60){
   types="BnoClip"; 
  }
  if(x>=1334 && x<=1384 && y>=90 && y<=140){
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
  click();
}

void mouseDragged() {
  click();
}