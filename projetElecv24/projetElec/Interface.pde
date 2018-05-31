class Interface {
  boolean ecranTitre=true, setUsername=false, load=false, credit=false, firstLoad=true;
  int line=1, column=1;
  int actualPage=1, usernameNumber=0;
  float nbPage;
  String pseudo="", charChosen;
  String[]playerBase;
  String[] player;
  String[] users=new String[0];


  public void ecranTitre() {
    image(menuPNG, 0, 0);
    switch(column) {
    case 1:
      strokeWeight(4);
      textFont(font52);
      fill(50, 50, 50, 150);
      stroke(255, 102, 0);
      fill(255, 102, 0, 50);
      rect(200, 200, 600, 100, 20);
      fill(255, 102, 0);
      text("PLAY", 400, 272);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 320, 600, 100, 20);
      rect(200, 440, 600, 100, 20);
      fill(255);
      text("LOAD", 400, 392);  
      text("CREDIT", 352, 512);
      break;
    case 2:
      strokeWeight(4);
      textFont(font52);
      fill(50, 50, 50, 150);
      stroke(255, 102, 0);
      fill(255, 102, 0, 50);
      rect(200, 320, 600, 100, 20);
      fill(255, 102, 0);
      text("LOAD", 400, 392);  
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 100, 20);
      rect(200, 440, 600, 100, 20);
      fill(255);
      text("PLAY", 400, 272);
      text("CREDIT", 352, 512);
      break;
    case 3:
      strokeWeight(4);
      textFont(font52);
      fill(50, 50, 50, 150);
      stroke(255, 102, 0);
      fill(255, 102, 0, 50);
      rect(200, 440, 600, 100, 20);
      fill(255, 102, 0);
      text("CREDIT", 352, 512);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 100, 20);
      rect(200, 320, 600, 100, 20);
      fill(255);
      text("PLAY", 400, 272);
      text("LOAD", 400, 392);  
      break;
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
    textFont(font);
    fill(255);
    text('A', 25+29, 150+45);
    text('Z', 125+29, 150+45);
    text('E', 225+29, 150+45);
    text('R', 325+29, 150+45);
    text('T', 425+29, 150+45);
    text('Y', 525+29, 150+45);
    text('U', 625+29, 150+45);
    text('I', 725+29, 150+45);
    text('O', 825+29, 150+45);
    text('P', 925+29, 150+45);
    text('Q', 25+29, 250+45);
    text('S', 125+29, 250+45);
    text('D', 225+29, 250+45);
    text('F', 325+29, 250+45);
    text('G', 425+29, 250+45);
    text('H', 525+29, 250+45);
    text('J', 625+29, 250+45);
    text('K', 725+29, 250+45);
    text('L', 825+29, 250+45);
    text('M', 925+29, 250+45);
    text('W', 225+29, 350+45);
    text('X', 325+29, 350+45);
    text('C', 425+29, 350+45);
    text('V', 525+29, 350+45);
    text('B', 625+29, 350+45);
    text('N', 725+29, 350+45);
    text("DELETE", 275+50, 450+45);
    text("FINISH", 275+250+50, 450+45);
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
        text('A', 54, 195);
        charChosen="A";
        break;
      case 2:
        rect(125, 150, 75, 75, 5);
        text('Z', 154, 195);
        charChosen="Z";
        break;
      case 3:
        rect(225, 150, 75, 75, 5);
        text('E', 254, 195);
        charChosen="E";
        break;
      case 4:
        rect(325, 150, 75, 75, 5);
        text('R', 354, 195);
        charChosen="R";
        break;
      case 5:
        rect(425, 150, 75, 75, 5);
        text('T', 454, 195);
        charChosen="T";
        break;
      case 6:
        rect(525, 150, 75, 75, 5);
        text('Y', 554, 195);
        charChosen="Y";
        break;
      case 7:
        rect(625, 150, 75, 75, 5);
        text('U', 654, 195);
        charChosen="U";
        break;
      case 8:
        rect(725, 150, 75, 75, 5);
        text('I', 754, 195);
        charChosen="I";
        break;
      case 9:
        rect(825, 150, 75, 75, 5);
        text('O', 854, 195);
        charChosen="O";
        break;
      case 10:
        rect(925, 150, 75, 75, 5);
        text('P', 954, 195);
        charChosen="P";
        break;
      }
      break;
    case 2:
      switch(line) {
      case 1:
        rect(25, 250, 75, 75, 5);
        text('Q', 54, 295);
        charChosen="Q";
        break;
      case 2:
        rect(125, 250, 75, 75, 5);
        text('S', 154, 295);
        charChosen="S";
        break;
      case 3:
        rect(225, 250, 75, 75, 5);
        text('D', 254, 295);
        charChosen="D";
        break;
      case 4:
        rect(325, 250, 75, 75, 5);
        text('F', 354, 295);
        charChosen="F";
        break;
      case 5:
        rect(425, 250, 75, 75, 5);
        text('G', 454, 295);
        charChosen="G";
        break;
      case 6:
        rect(525, 250, 75, 75, 5);
        text('H', 554, 295);
        charChosen="H";
        break;
      case 7:
        rect(625, 250, 75, 75, 5);
        text('J', 654, 295);
        charChosen="J";
        break;
      case 8:
        rect(725, 250, 75, 75, 5);
        text('K', 754, 295);
        charChosen="K";
        break;
      case 9:
        rect(825, 250, 75, 75, 5);
        text('L', 854, 295);
        charChosen="L";
        break;
      case 10:
        rect(925, 250, 75, 75, 5);
        text('M', 954, 295);
        charChosen="M";
        break;
      }
      break;
    case 3:
      switch(line) {
      case 1:
        rect(225, 350, 75, 75, 5);
        text('W', 254, 395);
        charChosen="W";
        break;
      case 2:
        rect(325, 350, 75, 75, 5);
        text('X', 354, 395);
        charChosen="X";
        break;
      case 3:
        rect(425, 350, 75, 75, 5);
        text('C', 454, 395);
        charChosen="C";
        break;
      case 4:
        rect(525, 350, 75, 75, 5);
        text('V', 554, 395);
        charChosen="V";
        break;
      case 5:
        rect(625, 350, 75, 75, 5);
        text('B', 654, 395);
        charChosen="B";
        break;
      case 6:
        rect(725, 350, 75, 75, 5);
        text('N', 754, 395);
        charChosen="N";
        break;
      }
      break;
    case 4:
      switch(line) {
      case 1:
        rect(275, 450, 225, 75, 5);
        text("DELETE", 325, 495);
        charChosen="DELETE";
        break;
      case 2:
        rect(525, 450, 225, 75, 5);
        text("FINISH", 575, 495);
        charChosen="FINISH";
        break;
      }
      break;
    }
    char[] arrayPseudo=pseudo.toCharArray();
    textSize(44);
    fill(0, 255, 0, 180);
    for (int i=0; i<arrayPseudo.length; i++) {
      text(arrayPseudo[i], 85+i*100, 115);
    }
  }

  void load() {
    for (int i=0; i<playerBase.length-1; i++) {
      String[] pseudo=split(playerBase[i+1], '|');
      users=append(users, pseudo[0]);
    }
    if (firstLoad==true) {
      nbPage=(float)users.length/21;
      if (nbPage-(int)nbPage!=0) {
        nbPage=(int)nbPage+1;
        println((int)nbPage+1);
      }
      int usersLength=users.length;
      for (int i=0; i<(21*nbPage)-usersLength; i++) {
        users=append(users, "    \'empty\'");
      }
      firstLoad=false;
    }
    fill(100, 100, 100, 100);
    stroke(100, 100, 100);
    for (int i=0; i<7  && i<users.length/3; i++) {
      rect(80, 20+(60*i), 250, 50, 20);
      rect(380, 20+(60*i), 250, 50, 20);
      rect(680, 20+(60*i), 250, 50, 20);
    }

    fill(255);
    textSize(13);
    for (int i=0; i<21 && i<users.length-1; i+=3) {
      text(users[i+(21*(actualPage-1))], 100, 50+(i*20));
      text(users[i+1+(21*(actualPage-1))], 400, 50+(i*20));
      text(users[i+2+(21*(actualPage-1))], 700, 50+(i*20));
    }
    fill(100, 100, 100, 100);
    rect(150, 450, 650, 100, 20);
    rect(10, 15, 50, 415, 20);
    rect(964, 15, 50, 415, 20);
    stroke(255);
    line(20, 220, 50, 160);
    line(20, 220, 50, 280);
    line(1004, 220, 974, 160);
    line(1004, 220, 974, 280);
    fill(255);
    textSize(52);
    text("RETOUR", 320, 520);
    stroke(0, 255, 0);
    textSize(13);
    fill(0, 255, 0, 100);
    switch(column) {
    case 1:
      switch(line) {
      case 1:
        rect(10, 15, 50, 415, 20);
        line(20, 220, 50, 160);
        line(20, 220, 50, 280);
        break;
      case 8:
        rect(150, 450, 650, 100, 20);
        textSize(52);
        text("RETOUR", 320, 520);
        break;
      }
      break;
    case 2:
      switch(line) {
      case 1:
        rect(80, 20, 250, 50, 20);
        text(users[0+(21*(actualPage-1))], 100, 50);
        usernameNumber=0+(21*(actualPage-1));
        break;
      case 2:
        rect(80, 80, 250, 50, 20);
        text(users[3+(21*(actualPage-1))], 100, 110);
        usernameNumber=3+(21*(actualPage-1));
        break;
      case 3:
        rect(80, 140, 250, 50, 20);
        text(users[6+(21*(actualPage-1))], 100, 170);
        usernameNumber=6+(21*(actualPage-1));
        break;
      case 4:
        rect(80, 200, 250, 50, 20);
        text(users[9+(21*(actualPage-1))], 100, 230);
        usernameNumber=9+(21*(actualPage-1));
        break;
      case 5:
        rect(80, 260, 250, 50, 20);
        text(users[12+(21*(actualPage-1))], 100, 290);
        usernameNumber=12+(21*(actualPage-1));
        break;
      case 6:
        rect(80, 320, 250, 50, 20);
        text(users[15+(21*(actualPage-1))], 100, 350);
        usernameNumber=15+(21*(actualPage-1));
        break;
      case 7:
        rect(80, 380, 250, 50, 20);
        text(users[18+(21*(actualPage-1))], 100, 410);
        usernameNumber=18+(21*(actualPage-1));
        break;
      case 8:
        rect(150, 450, 650, 100, 20);
        textSize(52);
        text("RETOUR", 320, 520);
        break;
      }
      break;
    case 3:
      switch(line) {
      case 1:
        rect(380, 20, 250, 50, 20);
        text(users[1+(21*(actualPage-1))], 400, 50);
        usernameNumber=1+(21*(actualPage-1));
        break;
      case 2:
        rect(380, 80, 250, 50, 20);
        text(users[4+(21*(actualPage-1))], 400, 110);
        usernameNumber=4+(21*(actualPage-1));
        break;
      case 3:
        rect(380, 140, 250, 50, 20);
        text(users[7+(21*(actualPage-1))], 400, 170);
        usernameNumber=7+(21*(actualPage-1));
        break;
      case 4:
        rect(380, 200, 250, 50, 20);
        text(users[10+(21*(actualPage-1))], 400, 230);
        usernameNumber=10+(21*(actualPage-1));
        break;
      case 5:
        rect(380, 260, 250, 50, 20);
        text(users[13+(21*(actualPage-1))], 400, 290);
        usernameNumber=13+(21*(actualPage-1));
        break;
      case 6:
        rect(380, 320, 250, 50, 20);
        text(users[16+(21*(actualPage-1))], 400, 350);
        usernameNumber=16+(21*(actualPage-1));
        break;
      case 7:
        rect(380, 380, 250, 50, 20);
        text(users[19+(21*(actualPage-1))], 400, 410);
        usernameNumber=19+(21*(actualPage-1));
        break;
      case 8:
        rect(150, 450, 650, 100, 20);
        textSize(52);
        text("RETOUR", 320, 520);
        break;
      }
      break;
    case 4:
      switch(line) {
      case 1:
        rect(680, 20, 250, 50, 20);
        text(users[2+(21*(actualPage-1))], 700, 50);
        usernameNumber=2+(21*(actualPage-1));
        break;
      case 2:
        rect(680, 80, 250, 50, 20);
        text(users[5+(21*(actualPage-1))], 700, 110);
        usernameNumber=5+(21*(actualPage-1));
        break;
      case 3:
        rect(680, 140, 250, 50, 20);
        text(users[8+(21*(actualPage-1))], 700, 170);
        usernameNumber=8+(21*(actualPage-1));
        break;
      case 4:
        rect(680, 200, 250, 50, 20);
        text(users[11+(21*(actualPage-1))], 700, 230);
        usernameNumber=11+(21*(actualPage-1));
        break;
      case 5:
        rect(680, 260, 250, 50, 20);
        text(users[14+(21*(actualPage-1))], 700, 290);
        usernameNumber=14+(21*(actualPage-1));
        break;
      case 6:
        rect(680, 320, 250, 50, 20);
        text(users[17+(21*(actualPage-1))], 700, 350);
        usernameNumber=17+(21*(actualPage-1));
        break;
      case 7:
        rect(680, 380, 250, 50, 20);
        text(users[20+(21*(actualPage-1))], 700, 410);
        usernameNumber=20+(21*(actualPage-1));
        break;
      case 8:
        rect(150, 450, 650, 100, 20);
        textSize(52);
        text("RETOUR", 320, 520);
        break;
      }
      break;
    case 5:
      switch(line) {
      case 1:
        rect(964, 15, 50, 415, 20);
        line(1004, 220, 974, 160);
        line(1004, 220, 974, 280);
        break;
      case 8:
        rect(150, 450, 650, 100, 20);
        textSize(52);
        text("RETOUR", 320, 520);
        break;
      }
      break;
    }
  }




  void leftAction() {
    if (interfaces.load==true) {
      if (key==GAUCHE) {
        if (column==1) {
          column=5;
        } else if (column==2) {
          line=1;
          column=1;
        } else if (column==5) {
          column=4;
          line=4;
        } else {
          column--;
        }
      }
    } else if (interfaces.setUsername==true) {
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
    }
  }
  void rightAction() {
    if (interfaces.load==true) {
      if (key==DROITE) {
        if (column==5) {
          column=1;
        } else if (column==4) {
          column=5;
          line=1;
        } else if (column==1) {
          column=2;
          line=4;
        } else {
          column++;
        }
      }
    } else if (interfaces.setUsername==true) {
      if (key==DROITE) {
        if ((line>=10 && (column==1 || column==2))||(line>=6 && column==3) || line>=2 && column==4) {
          line=1;
        } else {
          line++;
        }
      }
    }
  }
  void topAction() {
    if (interfaces.ecranTitre==true) {
      if (key==HAUT) {
        if (column==1) {
          column=3;
        } else {
          column--;
        }
      }
    } else if (interfaces.load==true) {
      if (key==HAUT) {
        if (line==1) {
          line=8;
          column=1;
        } else if (line==1 && (column==5 || column==1)) {
          line=2;
          column=3;
        } else if (line==8) {
          line=7;
          column=3;
        } else {
          line--;
        }
      }
    } else if (interfaces.ecranTitre==false && interfaces.setUsername==true) {
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
    }
  }
  void bottomAction() {
    if (interfaces.ecranTitre==true) {
      if (key==BAS) {
        if (column==3) {
          column=1;
        } else {
          column++;
        }
      }
    } else if (interfaces.load==true) {
      if (key==BAS) {
        if (line==8) {
          line=1;
          column=3;
        } else if ((column==1 || column==5) && line==1) {
          line=8;
          column=3;
        } else {
          line++;
        }
      }
    } else if (interfaces.ecranTitre==false && interfaces.setUsername==true) {
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
    }
  }
  void confirmAction() {
    if (interfaces.ecranTitre==true) {
      if (key==ACTION) {
        switch(column) {
        case 1:
          interfaces.ecranTitre=false;
          interfaces.setUsername=true;
          line=1;
          column=1;
          break;
        case 2:
          interfaces.ecranTitre=false;
          interfaces.load=true;
          break;
        case 3:
          interfaces.ecranTitre=false;
          interfaces.credit=true;
          break;
        }
      }
    } else if (interfaces.ecranTitre==false && interfaces.setUsername==true) {
      if (key==ACTION) {
        if (charChosen=="DELETE" && pseudo.length()>=1) {
          pseudo=pseudo.substring(0, pseudo.length()-1);
        } else if (charChosen=="DELETE" && pseudo.length()==0) {
        } else if (charChosen=="FINISH") {
          String[] line=new String[2];
          boolean sameUsername=true;
          line[0]="username|coins|actualLevel|timer";
          line[1]=pseudo+"|0 |1 |00:00:00";
          saveStrings("data/actualPseudo.txt", line);
          String[] username;//=split(playerBase[1],"|");
          //for(int i=0;i<username.length;i++){
          // println(username[i]); 
          //}
          for (int i=0; i<playerBase.length-1; i++) {
            username=split(playerBase[i+1], "|");
            println(username[0]);
            if (username[0]==pseudo) {
              sameUsername=false;
            }
          }
          if (sameUsername==true) {
            playerBase=append(playerBase, line[1]);
          }
          setUsername=false;
          saveStrings("data/playerBase.txt", playerBase);
          initialTime=millis();
        } else {
          pseudo+=charChosen;
        }
      }
    } else if (interfaces.load==true) {
      if (key==ACTION) {
        if (line==1 && column==1 && actualPage==1) {
          actualPage=(int)nbPage;
        } else if (line==1 && column==1) {
          actualPage--;
        } else if (line==1 && column==5 && actualPage==nbPage) {
          actualPage=1;
        } else if (line==1 && column==5) {
          actualPage++;
        } else if ((line==8 && column==1) ||(line==8 && column==3)) {
          interfaces.load=false;
          interfaces.ecranTitre=true;
          line=1;
          column=1;
        } else {
          if (playerBase.length>usernameNumber) {
            player=split(playerBase[usernameNumber+1], "|");
            levelNumber=Integer.parseInt(player[2])-1;
            bonusPoints.nbPoints=Integer.parseInt(player[1]);
            interfaces.load=false;
          }
        }
      }
    }
  }
}