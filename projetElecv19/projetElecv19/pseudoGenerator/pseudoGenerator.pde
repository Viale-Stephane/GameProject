int x, y;
char GAUCHE='q', DROITE='d', BAS='s', HAUT='z', VALIDATE='j';
int line=1, column=1;
String pseudo="";
String charChosen;

void setup() {
  size(1024, 600);
}

void draw() {
  background(0, 0, 0);
  textSize(13);
  fill(255, 255, 255);
  text(x, 10, 10);
  text(y, 50, 10);
  visualKeyboard();
  println("line :"+line);
  println("column :"+column);
  println("pseudo :"+pseudo);
}


void mousePressed() {
  if (mousePressed==true) {
    x=mouseX;
    y=mouseY;
  }
}

void visualKeyboard() {
  fill(100, 100, 100, 100);
  stroke(100, 100, 100);
  for (int i=0; i<10; i++) {
    rect(25+i*100, 150, 75, 75, 5);
  }
  for (int i=0; i<10; i++) {
    rect(25+i*100, 250, 75, 75, 5);
  }
  for (int i=0; i<6; i++) {
    rect(225+i*100, 350, 75, 75, 5);
  }
  for (int i=0; i<2; i++) {
    rect(275+i*250, 450, 225, 75, 5);
  }
  textSize(22);
  text('A', 25+30, 150+45);
  text('Z', 125+30, 150+45);
  text('E', 225+30, 150+45);
  text('R', 325+30, 150+45);
  text('T', 425+30, 150+45);
  text('Y', 525+30, 150+45);
  text('U', 625+30, 150+45);
  text('I', 725+30, 150+45);
  text('O', 825+30, 150+45);
  text('P', 925+30, 150+45);
  text('Q', 25+30, 250+45);
  text('S', 125+30, 250+45);
  text('D', 225+30, 250+45);
  text('F', 325+30, 250+45);
  text('G', 425+30, 250+45);
  text('H', 525+30, 250+45);
  text('J', 625+30, 250+45);
  text('K', 725+30, 250+45);
  text('L', 825+30, 250+45);
  text('M', 925+30, 250+45);
  text('W', 225+30, 350+45);
  text('X', 325+30, 350+45);
  text('C', 425+30, 350+45);
  text('V', 525+30, 350+45);
  text('B', 625+30, 350+45);
  text('N', 725+30, 350+45);
  text("DELETE", 275+75, 450+45);
  text("FINISH", 275+250+75, 450+45);
  for (int i=0; i<9; i++) {
    line(63+i*100, 120, 138+i*100, 120);
  }
  stroke(0, 255, 0);
  fill(0, 255, 0, 100);
  switch (column) {
  case 1:
    switch(line) {
    case 1:
      rect(25, 150, 75, 75, 5);
      text('A', 55, 195);
      charChosen="A";
      break;
    case 2:
      rect(125, 150, 75, 75, 5);
      text('Z', 155, 195);
      charChosen="Z";
      break;
    case 3:
      rect(225, 150, 75, 75, 5);
      text('E', 255, 195);
      charChosen="E";
      break;
    case 4:
      rect(325, 150, 75, 75, 5);
      text('R', 355, 195);
      charChosen="R";
      break;
    case 5:
      rect(425, 150, 75, 75, 5);
      text('T', 455, 195);
      charChosen="T";
      break;
    case 6:
      rect(525, 150, 75, 75, 5);
      text('Y', 555, 195);
      charChosen="Y";
      break;
    case 7:
      rect(625, 150, 75, 75, 5);
      text('U', 655, 195);
      charChosen="U";
      break;
    case 8:
      rect(725, 150, 75, 75, 5);
      text('I', 755, 195);
      charChosen="I";
      break;
    case 9:
      rect(825, 150, 75, 75, 5);
      text('O', 855, 195);
      charChosen="O";
      break;
    case 10:
      rect(925, 150, 75, 75, 5);
      text('P', 955, 195);
      charChosen="P";
      break;
    }
    break;
  case 2:
    switch(line) {
    case 1:
      rect(25, 250, 75, 75, 5);
      text('Q', 55, 295);
      charChosen="Q";
      break;
    case 2:
      rect(125, 250, 75, 75, 5);
      text('S', 155, 295);
      charChosen="S";
      break;
    case 3:
      rect(225, 250, 75, 75, 5);
      text('D', 255, 295);
      charChosen="D";
      break;
    case 4:
      rect(325, 250, 75, 75, 5);
      text('F', 355, 295);
      charChosen="F";
      break;
    case 5:
      rect(425, 250, 75, 75, 5);
      text('G', 455, 295);
      charChosen="G";
      break;
    case 6:
      rect(525, 250, 75, 75, 5);
      text('H', 555, 295);
      charChosen="H";
      break;
    case 7:
      rect(625, 250, 75, 75, 5);
      text('J', 655, 295);
      charChosen="J";
      break;
    case 8:
      rect(725, 250, 75, 75, 5);
      text('K', 755, 295);
      charChosen="K";
      break;
    case 9:
      rect(825, 250, 75, 75, 5);
      text('L', 855, 295);
      charChosen="L";
      break;
    case 10:
      rect(925, 250, 75, 75, 5);
      text('M', 955, 295);
      charChosen="M";
      break;
    }
    break;
  case 3:
    switch(line) {
    case 1:
      rect(225, 350, 75, 75, 5);
      text('W', 255, 395);
      charChosen="W";
      break;
    case 2:
      rect(325, 350, 75, 75, 5);
      text('X', 355, 395);
      charChosen="X";
      break;
    case 3:
      rect(425, 350, 75, 75, 5);
      text('C', 455, 395);
      charChosen="C";
      break;
    case 4:
      rect(525, 350, 75, 75, 5);
      text('V', 555, 395);
      charChosen="V";
      break;
    case 5:
      rect(625, 350, 75, 75, 5);
      text('B', 655, 395);
      charChosen="B";
      break;
    case 6:
      rect(725, 350, 75, 75, 5);
      text('N', 755, 395);
      charChosen="N";
      break;
    }
    break;
  case 4:
    switch(line) {
    case 1:
      rect(275, 450, 225, 75, 5);
      text("DELETE", 350, 495);
      charChosen="DELETE";
      break;
    case 2:
      rect(525, 450, 225, 75, 5);
      text("FINISH", 600, 495);
      charChosen="FINISH";
      break;
    }
    break;
  }
  char[] arrayPseudo=pseudo.toCharArray();
  textSize(44);
  for(int i=0;i<arrayPseudo.length;i++){
    text(arrayPseudo[i],85+i*100,115);
  }
}

void logicalKeyboard() {
}


void keyPressed() {
  if (key==DROITE) {
    if ((line>=10 && (column==1 || column==2))||(line>=6 && column==3) || line>=2 && column==4) {
      line=1;
    } else {
      line++;
    }
  }
  if (key==GAUCHE) {
    if ((line<=1 && column<=2)) {
      line=10;
    } else if (line<=1 && column==3) {
      line=6;
    } else if (line<=1 && column==4) {
      line=2;
    } else {
      line--;
    }
  }
  if (key==BAS) {
    if (column==2 && line<=2) {
      line=1;
      column=3;
    } else if (column==2 && line>=9) {
      line=6;
      column=3;
    } else if (column==2) {
      line-=2;
      column=3;
    } else if (column==3 && line<=3) {
      line=1;
      column=4;
    } else if (column==3 && line>=4) {
      line=2;
      column=4;
    } else if (column==4 && line==1) {
      line=4;
      column=1;
    } else if (column==4 && line==2) {
      line=7;
      column=1;
    } else {
      column++;
    }
  }
  if (key==HAUT) {
    if (column==1 && line<=5) {
      line=1;
      column=4;
    } else if (column==1 && line>=6) {
      line=2;
      column=4;
    } else if (column==3) {
      line+=2;
      column=2;
    } else if (column==4 && line==1) {
      line=2;
      column=3;
    } else if (column==4 && line==2) {
      line=5;
      column=3;
    } else {
      column--;
    }
  }
  if (key==VALIDATE) {
    if (charChosen=="DELETE" && pseudo.length()>=1) {
      pseudo=pseudo.substring(0, pseudo.length()-1);
    } else {
      pseudo+=charChosen;
    }
  }
}