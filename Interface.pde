class Interface {
  boolean firstScreen=true,ecranTitre=false, setUsername=false, load=false, credit=false, leaderboard=false, firstLoad=true, firstLeaderboard=true, save=false;
  int line=1, column=1;
  int actualPage=1, usernameNumber=0;
  int testedValue=1;
  int loadedHour=0, loadedMinute=0, loadedSecond=0, loadedMillis=0, firstLoadedMillis=0, stepMillisIntegration=0, is1000=0;
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
      stroke(255, 102, 0);
      fill(255, 102, 0, 50);
      rect(200, 200, 600, 80, 20);
      fill(255, 102, 0);
      text("PLAY", 400, 262);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 300, 600, 80, 20);
      rect(200, 400, 600, 80, 20);
      rect(200, 500, 600, 80, 20);
      fill(255);
      text("LOAD", 400, 362);  
      text("LEADERBOARD", 222, 462);
      text("CREDIT", 352, 562);
      break;
    case 2:
      strokeWeight(4);
      textFont(font52);
      stroke(255, 102, 0);
      fill(255, 102, 0, 50);
      rect(200, 300, 600, 80, 20);
      fill(255, 102, 0);
      text("LOAD", 400, 362);  
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 80, 20);
      rect(200, 400, 600, 80, 20);
      rect(200, 500, 600, 80, 20);
      fill(255);
      text("PLAY", 400, 262);
      text("LEADERBOARD", 222, 462);
      text("CREDIT", 352, 562);
      break;
    case 3:
      strokeWeight(4);
      textFont(font52);
      stroke(255, 102, 0);
      fill(255, 102, 0, 50);
      rect(200, 400, 600, 80, 20);
      fill(255, 102, 0);
      text("LEADERBOARD", 222, 462);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 80, 20);
      rect(200, 300, 600, 80, 20);
      rect(200, 500, 600, 80, 20);
      fill(255);
      text("PLAY", 400, 262);
      text("LOAD", 400, 362);  
      text("CREDIT", 352, 562);
      break;
    case 4:
      strokeWeight(4);
      textFont(font52);
      stroke(255, 102, 0);
      fill(255, 102, 0, 50);
      rect(200, 500, 600, 80, 20);
      fill(255, 102, 0);
      text("CREDIT", 352, 562);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 80, 20);
      rect(200, 300, 600, 80, 20);
      rect(200, 400, 600, 80, 20);
      fill(255);
      text("PLAY", 400, 262);
      text("LOAD", 400, 362);  
      text("LEADERBOARD", 222, 462);
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

  void save() {
    load();
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
      }
      int usersLength=users.length;
      for (int i=0; i<(21*nbPage)-usersLength; i++) {
        users=append(users, "    \'empty\'");
      }
      firstLoad=false;
    }
    fill(100, 100, 100, 100);
    stroke(100, 100, 100);
    strokeWeight(4);
    for (int i=0; i<7  && i<users.length/3; i++) {
      rect(80, 20+(60*i), 250, 50, 20);
      rect(380, 20+(60*i), 250, 50, 20);
      rect(680, 20+(60*i), 250, 50, 20);
    }

    fill(255);
    textSize(13);
    for (int i=0; i<21 && i<users.length-1; i+=3) {
      text(users[i+(21*(actualPage-1))], 100, 40+(i*20));
      text(users[i+1+(21*(actualPage-1))], 400, 40+(i*20));
      text(users[i+2+(21*(actualPage-1))], 700, 40+(i*20));
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

    textSize(10);
    stroke(80, 120, 200);
    strokeWeight(2);
    for (int i=0; 21*(actualPage-1)+3*i+3<playerBase.length && i<7; i++) {
      player=split(playerBase[21*(actualPage-1)+3*i+1], "|");
      line(95, 25+(i*60), 105, 25+(i*60));
      line(95, 25+(i*60), 95, 35+(i*60));
      line(220, 42+(i*60), 220, 32+(i*60));
      line(220, 42+(i*60), 210, 42+(i*60));
      line(395, 25+(i*60), 405, 25+(i*60));
      line(395, 25+(i*60), 395, 35+(i*60));
      line(520, 42+(i*60), 520, 32+(i*60));
      line(520, 42+(i*60), 510, 42+(i*60));
      line(695, 25+(i*60), 705, 25+(i*60));
      line(695, 25+(i*60), 695, 35+(i*60));
      line(820, 42+(i*60), 820, 32+(i*60));
      line(820, 42+(i*60), 810, 42+(i*60));
      String[] time=split(player[3], ":");
      image(timer, 100, 45+60*i, 24, 24);
      image(deathPNG, 220, 45+60*i, 24, 24);
      image(coin, 225, 25+60*i, 16, 16);
      text(player[1], 245, 40+60*i);
      text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 120, 60*(i+1));
      text(player[4], 245, 60*(i+1));
      player=split(playerBase[21*(actualPage-1)+(3*i+1)+1], "|");
      time=split(player[3], ":");
      image(timer, 400, 45+60*i, 24, 24);
      image(deathPNG, 520, 45+60*i, 24, 24);
      image(coin, 525, 25+60*i, 16, 16);
      text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 420, 60*(i+1));     
      text(player[4], 545, 60*(i+1));
      text(player[1], 545, 40+60*i);
      player=split(playerBase[21*(actualPage-1)+(3*i+2)+1], "|");
      time=split(player[3], ":");
      image(timer, 700, 45+60*i, 24, 24);
      image(deathPNG, 820, 45+60*i, 24, 24);      
      image(coin, 825, 25+60*i, 16, 16);
      text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 720, 60*(i+1));
      text(player[4], 845, 60*(i+1));
      text(player[1], 845, 40+60*i);
      if (4*i==playerBase.length-21*(actualPage-1)-3-2) {
        line(95, 25+((i+1)*60), 105, 25+((i+1)*60));
        line(95, 25+((i+1)*60), 95, 35+((i+1)*60));
        line(220, 42+((i+1)*60), 220, 32+((i+1)*60));
        line(220, 42+((i+1)*60), 210, 42+((i+1)*60));
        line(395, 25+((i+1)*60), 405, 25+((i+1)*60));
        line(395, 25+((i+1)*60), 395, 35+((i+1)*60));
        line(520, 42+((i+1)*60), 520, 32+((i+1)*60));
        line(520, 42+((i+1)*60), 510, 42+((i+1)*60));
        player=split(playerBase[playerBase.length-2], "|");
        time=split(player[3], ":");
        image(timer, 100, 45+60*(i+1), 24, 24);
        image(deathPNG, 220, 45+60*(i+1), 24, 24);
        image(coin, 225, 25+60*(i+1), 16, 16);
        text(player[1], 245, 40+60*(i+1));
        text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 120, 60*(i+2));
        text(player[4], 245, 60*(i+2));
        player=split(playerBase[playerBase.length-1], "|");
        time=split(player[3], ":");
        image(timer, 400, 45+60*(i+1), 24, 24);
        image(deathPNG, 520, 45+60*(1+i), 24, 24);
        image(coin, 525, 25+60*(i+1), 16, 16);
        text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 420, 60*(i+2));     
        text(player[4], 545, 60*(i+2));
        text(player[1], 545, 40+60*(i+1));
      }
      if (4*i==playerBase.length-21*(actualPage-1)-4) {
        line(95, 25+((i+1)*60), 105, 25+((i+1)*60));
        line(95, 25+((i+1)*60), 95, 35+((i+1)*60));
        line(220, 42+((i+1)*60), 220, 32+((i+1)*60));
        line(220, 42+((i+1)*60), 210, 42+((i+1)*60));
        player=split(playerBase[playerBase.length-1], "|");
        time=split(player[3], ":");
        image(timer, 100, 45+60*(i+1), 24, 24);
        image(deathPNG, 220, 45+60*(i+1), 24, 24);
        image(coin, 225, 25+60*(i+1), 16, 16);
        text(player[1], 245, 40+60*(i+1));
        text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 120, 60*(i+2));
        text(player[4], 245, 60*(i+2));
      }
    }

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
        text(users[0+(21*(actualPage-1))], 100, 40);
        usernameNumber=0+(21*(actualPage-1));
        break;
      case 2:
        rect(80, 80, 250, 50, 20);
        text(users[3+(21*(actualPage-1))], 100, 100);
        usernameNumber=3+(21*(actualPage-1));
        break;
      case 3:
        rect(80, 140, 250, 50, 20);
        text(users[6+(21*(actualPage-1))], 100, 160);
        usernameNumber=6+(21*(actualPage-1));
        break;
      case 4:
        rect(80, 200, 250, 50, 20);
        text(users[9+(21*(actualPage-1))], 100, 220);
        usernameNumber=9+(21*(actualPage-1));
        break;
      case 5:
        rect(80, 260, 250, 50, 20);
        text(users[12+(21*(actualPage-1))], 100, 280);
        usernameNumber=12+(21*(actualPage-1));
        break;
      case 6:
        rect(80, 320, 250, 50, 20);
        text(users[15+(21*(actualPage-1))], 100, 340);
        usernameNumber=15+(21*(actualPage-1));
        break;
      case 7:
        rect(80, 380, 250, 50, 20);
        text(users[18+(21*(actualPage-1))], 100, 400);
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
        text(users[1+(21*(actualPage-1))], 400, 40);
        usernameNumber=1+(21*(actualPage-1));
        break;
      case 2:
        rect(380, 80, 250, 50, 20);
        text(users[4+(21*(actualPage-1))], 400, 100);
        usernameNumber=4+(21*(actualPage-1));
        break;
      case 3:
        rect(380, 140, 250, 50, 20);
        text(users[7+(21*(actualPage-1))], 400, 160);
        usernameNumber=7+(21*(actualPage-1));
        break;
      case 4:
        rect(380, 200, 250, 50, 20);
        text(users[10+(21*(actualPage-1))], 400, 220);
        usernameNumber=10+(21*(actualPage-1));
        break;
      case 5:
        rect(380, 260, 250, 50, 20);
        text(users[13+(21*(actualPage-1))], 400, 280);
        usernameNumber=13+(21*(actualPage-1));
        break;
      case 6:
        rect(380, 320, 250, 50, 20);
        text(users[16+(21*(actualPage-1))], 400, 340);
        usernameNumber=16+(21*(actualPage-1));
        break;
      case 7:
        rect(380, 380, 250, 50, 20);
        text(users[19+(21*(actualPage-1))], 400, 400);
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
        text(users[2+(21*(actualPage-1))], 700, 40);
        usernameNumber=2+(21*(actualPage-1));
        break;
      case 2:
        rect(680, 80, 250, 50, 20);
        text(users[5+(21*(actualPage-1))], 700, 100);
        usernameNumber=5+(21*(actualPage-1));
        break;
      case 3:
        rect(680, 140, 250, 50, 20);
        text(users[8+(21*(actualPage-1))], 700, 160);
        usernameNumber=8+(21*(actualPage-1));
        break;
      case 4:
        rect(680, 200, 250, 50, 20);
        text(users[11+(21*(actualPage-1))], 700, 220);
        usernameNumber=11+(21*(actualPage-1));
        break;
      case 5:
        rect(680, 260, 250, 50, 20);
        text(users[14+(21*(actualPage-1))], 700, 280);
        usernameNumber=14+(21*(actualPage-1));
        break;
      case 6:
        rect(680, 320, 250, 50, 20);
        text(users[17+(21*(actualPage-1))], 700, 340);
        usernameNumber=17+(21*(actualPage-1));
        break;
      case 7:
        rect(680, 380, 250, 50, 20);
        text(users[20+(21*(actualPage-1))], 700, 400);
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


  String[] leaderboard() {
    int[] numberTested=new int[0];
    String[] player;
    String[] timer;
    int time=0;
    for (int i=0; i<playerBase.length-1; i++) {
      player=split(playerBase[i+1], "|");
      if (testedValue==3) {
        timer=split(player[3], ":");
        numberTested=append(numberTested, Integer.parseInt(timer[0])*3600000+Integer.parseInt(timer[1])*60000+Integer.parseInt(timer[2])*1000+Integer.parseInt(timer[3]));
        println(numberTested[0]);
      } else {
        numberTested=append(numberTested, Integer.parseInt(player[testedValue]));
      }
    }
    numberTested=sort(numberTested);
    if (testedValue==1 || testedValue==5) {
      numberTested=reverse(numberTested);
    }
    String[] lessDeathPlayer=new String[0];
    while (lessDeathPlayer.length<playerBase.length-1) {
      for (int i=0; i<playerBase.length-1; i++) {
        player=split(playerBase[i+1], "|");

        if (testedValue==3) {
          timer=split(player[3], ":");
          time=Integer.parseInt(timer[0])*3600000+Integer.parseInt(timer[1])*60000+Integer.parseInt(timer[2])*1000+Integer.parseInt(timer[3]);

          if (lessDeathPlayer.length<numberTested.length && numberTested[lessDeathPlayer.length]==time) {
            lessDeathPlayer=append(lessDeathPlayer, player[0]+"|"+player[1]+"|"+player[2]+"|"+player[3]+"|"+player[4]+"|"+player[5]);
          }
        } else {
          if (lessDeathPlayer.length<numberTested.length && numberTested[lessDeathPlayer.length]==Integer.parseInt(player[testedValue])) {
            lessDeathPlayer=append(lessDeathPlayer, player[0]+"|"+player[1]+"|"+player[2]+"|"+player[3]+"|"+player[4]+"|"+player[5]);
          }
        }
      }
    }
    return lessDeathPlayer;
  }

  void visualLeaderboard() {
    String[] coinsPlayer=leaderboard();
    fill(255, 0, 0);
    if (firstLeaderboard==true) {
      nbPage=(float)coinsPlayer.length/8;
      if (nbPage-(int)nbPage!=0) {
        nbPage=(int)nbPage+1;
      }
    }
    strokeWeight(4);
    for (int i=1; i<5; i++) {
      line(200*i, 0, 200*i, 390);
    }
    textSize(16);
    line(30, 0, 30, 390);
    line(0, 55, 1024, 55);
    if (testedValue==1) {
      image(coin, 275, 5);   
      text("SCORE", 475, 30);
      image(timer, 675, 5);
      image(deathPNG, 875, 5);
    } else if (testedValue==3) {
      image(coin, 875, 5);       
      text("SCORE", 475, 30);
      image(timer, 275, 5);
      image(deathPNG, 675, 5);
    } else if (testedValue==4) {
      image(coin, 875, 5);    
      image(timer, 675, 5);
      text("SCORE", 475, 30);
      image(deathPNG, 275, 5);
    } else if (testedValue==5) {
      text("SCORE", 275, 30);
      image(timer, 475, 5);
      image(deathPNG, 675, 5);
      image(coin, 875, 5);
    }
    text("PSEUDO", 65, 30);
    textSize(12);
    strokeWeight(2);
    stroke(80, 120, 200);
    for (int i=0; i<8 && i+8*(actualPage-1)<coinsPlayer.length; i++) {
      player=split(coinsPlayer[(actualPage-1)*8+i], "|");
      text(((actualPage-1)*8+i+1), 5, 40+40*(i+1));
      line(35, 65+40*i, 45, 65+40*i);
      line(35, 65+40*i, 35, 75+40*i);
      line(190, 85+40*i, 190, 75+40*i);
      line(190, 85+40*i, 180, 85+40*i);
      text(player[0], 40, 40+40*(i+1));
      if (testedValue==1) {//coins
        text(player[1], 210, 40+40*(i+1));
        text(player[5], 410, 40+40*(i+1));
        text(player[3], 610, 40+40*(i+1));
        text(player[4], 810, 40+40*(i+1));
      } else if (testedValue==3) {//time
        text(player[3], 210, 40+40*(i+1));
        text(player[5], 410, 40+40*(i+1));
        text(player[4], 610, 40+40*(i+1));
        text(player[1], 810, 40+40*(i+1));
      } else if (testedValue==4) {
        text(player[4], 210, 40+40*(i+1));
        text(player[5], 410, 40+40*(i+1));
        text(player[3], 610, 40+40*(i+1));
        text(player[1], 810, 40+40*(i+1));
      } else if (testedValue==5) {
        text(player[5], 210, 40+40*(i+1));
        text(player[3], 410, 40+40*(i+1));
        text(player[4], 610, 40+40*(i+1));
        text(player[1], 810, 40+40*(i+1));
      }
    }
    strokeWeight(4);
    textSize(40);
    if (line==1) {
      switch(column) {
      case 1:
        fill(0, 255, 0, 150);
        stroke(0, 255, 0);
        rect(200, 400, 50, 50, 20);
        line(205, 425, 240, 405);
        line(205, 425, 240, 445);
        fill(100, 100, 100, 150);
        stroke(100, 100, 100);
        rect(315, 400, 50, 50, 20);
        image(coin, 320, 410, 40, 30);
        rect(415, 400, 50, 50, 20);
        image(deathPNG, 420, 410, 40, 30);
        rect(515, 400, 50, 50, 20);
        image(timer, 520, 410, 40, 30);
        rect(615, 400, 50, 50, 20);
        fill(255, 0, 0);
        text("S", 623, 443);
        fill(100, 100, 100, 150);
        rect(750, 400, 50, 50, 20);
        line(795, 425, 755, 405);
        line(795, 425, 755, 445);
        rect(150, 480, 700, 100, 20);    
        fill(255);
        text("RETURN", 400, 545);
        break;
      case 2:
        fill(0, 255, 0, 150);
        stroke(0, 255, 0);
        rect(315, 400, 50, 50, 20);
        fill(100, 100, 100, 150);
        stroke(100, 100, 100);
        rect(200, 400, 50, 50, 20);
        line(205, 425, 240, 405);
        line(205, 425, 240, 445);
        image(coin, 320, 410, 40, 30);
        rect(415, 400, 50, 50, 20);
        image(deathPNG, 420, 410, 40, 30);
        rect(515, 400, 50, 50, 20);
        image(timer, 520, 410, 40, 30);
        rect(615, 400, 50, 50, 20);
        fill(255, 0, 0);
        text("S", 623, 443);
        fill(100, 100, 100, 150);
        rect(750, 400, 50, 50, 20);
        line(795, 425, 755, 405);
        line(795, 425, 755, 445);
        rect(150, 480, 700, 100, 20);
        fill(255);
        text("RETURN", 400, 545);
        break;
      case 3:
        fill(0, 255, 0, 150);
        stroke(0, 255, 0);
        rect(415, 400, 50, 50, 20);
        fill(100, 100, 100, 150);
        stroke(100, 100, 100);
        rect(315, 400, 50, 50, 20);
        rect(200, 400, 50, 50, 20);
        line(205, 425, 240, 405);
        line(205, 425, 240, 445);
        image(coin, 320, 410, 40, 30);
        image(deathPNG, 420, 410, 40, 30);
        rect(515, 400, 50, 50, 20);
        image(timer, 520, 410, 40, 30);
        rect(615, 400, 50, 50, 20);
        fill(255, 0, 0);
        text("S", 623, 443);
        fill(100, 100, 100, 150);
        rect(750, 400, 50, 50, 20);
        line(795, 425, 755, 405);
        line(795, 425, 755, 445);
        rect(150, 480, 700, 100, 20);           
        fill(255);   
        text("RETURN", 400, 545);
        break;
      case 4:
        fill(0, 255, 0, 150);
        stroke(0, 255, 0);
        rect(515, 400, 50, 50, 20);
        fill(100, 100, 100, 150);
        stroke(100, 100, 100);
        rect(200, 400, 50, 50, 20);
        line(205, 425, 240, 405);
        line(205, 425, 240, 445);
        rect(315, 400, 50, 50, 20);
        image(coin, 320, 410, 40, 30);
        rect(415, 400, 50, 50, 20);
        image(deathPNG, 420, 410, 40, 30);
        image(timer, 520, 410, 40, 30);
        rect(615, 400, 50, 50, 20);
        fill(255, 0, 0);
        text("S", 623, 443);
        fill(100, 100, 100, 150);
        rect(750, 400, 50, 50, 20);
        line(795, 425, 755, 405);
        line(795, 425, 755, 445);
        rect(150, 480, 700, 100, 20);      
        fill(255);
        text("RETURN", 400, 545);
        break;
      case 5:
        fill(0, 255, 0, 150);
        stroke(0, 255, 0);
        rect(615, 400, 50, 50, 20);
        fill(255, 0, 0);
        text("S", 623, 443);
        fill(100, 100, 100, 150);
        stroke(100, 100, 100);
        rect(200, 400, 50, 50, 20);
        line(205, 425, 240, 405);
        line(205, 425, 240, 445);
        rect(315, 400, 50, 50, 20);
        image(coin, 320, 410, 40, 30);
        rect(415, 400, 50, 50, 20);
        image(deathPNG, 420, 410, 40, 30);
        rect(515, 400, 50, 50, 20);
        image(timer, 520, 410, 40, 30);
        rect(750, 400, 50, 50, 20);
        line(795, 425, 755, 405);
        line(795, 425, 755, 445);
        rect(150, 480, 700, 100, 20);
        fill(255);
        text("RETURN", 400, 545);
        break;
      case 6:
        fill(0, 255, 0, 150);
        stroke(0, 255, 0);
        rect(750, 400, 50, 50, 20);
        line(795, 425, 755, 405);
        line(795, 425, 755, 445);
        fill(100, 100, 100, 150);
        stroke(100, 100, 100);
        rect(200, 400, 50, 50, 20);
        line(205, 425, 240, 405);
        line(205, 425, 240, 445);
        rect(315, 400, 50, 50, 20);
        image(coin, 320, 410, 40, 30);
        rect(415, 400, 50, 50, 20);
        image(deathPNG, 420, 410, 40, 30);
        rect(515, 400, 50, 50, 20);
        image(timer, 520, 410, 40, 30);
        rect(615, 400, 50, 50, 20);
        fill(255, 0, 0);
        text("S", 623, 443);
        fill(100, 100, 100, 150);
        rect(150, 480, 700, 100, 20);        
        fill(255);
        text("RETURN", 400, 545);
        break;
      }
    }
    if (line==2 && column==1) {
      fill(255);
      text("RETURN", 400, 545);
      fill(0, 255, 0, 150);
      stroke(0, 255, 0);
      rect(150, 480, 700, 100, 20);
      fill(100, 100, 100, 150);
      stroke(100, 100, 100);
      rect(200, 400, 50, 50, 20);
      line(205, 425, 240, 405);
      line(205, 425, 240, 445);
      rect(315, 400, 50, 50, 20);
      image(coin, 320, 410, 40, 30);
      rect(415, 400, 50, 50, 20);
      image(deathPNG, 420, 410, 40, 30);
      rect(515, 400, 50, 50, 20);
      image(timer, 520, 410, 40, 30);
      rect(615, 400, 50, 50, 20);
      fill(255, 0, 0);
      text("S", 623, 443);
      fill(100, 100, 100, 150);
      rect(750, 400, 50, 50, 20);
      line(795, 425, 755, 405);
      line(795, 425, 755, 445);
    }
  }

  void leftAction() {
    if (interfaces.load==true || interfaces.save==true) {
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
    } else if (interfaces.leaderboard==true) {
      if (key==GAUCHE) {
        if (line==1) {
          if (column==1) {
            column=6;
          } else {
            column--;
          }
        } else {
          column=1;
          line=1;
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
    if (interfaces.load==true || interfaces.save==true) {
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
    } else if (interfaces.leaderboard==true) {
      if (key==DROITE) {
        if (line==1) {
          if (column==6) {
            column=1;
          } else {
            column++;
          }
        } else {
          column=6;
          line=1;
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
          column=4;
        } else {
          column--;
        }
      }
    } else if (interfaces.leaderboard==true) {
      if (key==HAUT) {
        if (line==1) {
          line=2;
          column=1;
        } else {
          line--;
          column=3;
        }
      }
    } else if (interfaces.load==true || interfaces.save==true) {
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
        if (column==4) {
          column=1;
        } else {
          column++;
        }
      }
    } else if (interfaces.leaderboard==true) {
      if (key==BAS) {
        if (line==2) {
          line=1;
          column=3;
        } else if (line==1) {
          line++;
          column=1;
        }
      }
    } else if (interfaces.load==true || interfaces.save==true) {
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
          line=1;
          column=2;
          break;
        case 3:
          interfaces.ecranTitre=false;
          interfaces.leaderboard=true;
          column=2;
          line=1;
          break;
        case 4:
          interfaces.ecranTitre=false;
          interfaces.credit=true;
          break;
        }
      }
    } else if (interfaces.ecranTitre==false && interfaces.leaderboard==true) {
      if (key==ACTION) {
        if (line==1) {
          switch(column) {
          case 1:
            if (actualPage==1) {
              actualPage=(int)nbPage;
            } else {
              actualPage--;
            }
            break;
          case 2:
            testedValue=1;
            break;
          case 3:
            testedValue=4;
            break;
          case 4:
            testedValue=3;
            break;
          case 5:
            testedValue=5;
            break;
          case 6:
            if (actualPage==(int)nbPage) {
              actualPage=1;
            } else {
              actualPage++;
            }
            break;
          }
        } else if (line==2 && column==1) {
          interfaces.ecranTitre=true;
          interfaces.leaderboard=false;
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
          line[0]="username|coins|actualLevel|timer|death|score";
          line[1]=pseudo+"|0|1|00:00:00:0000|0|0000000";
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
        } else if (line==8) {
          interfaces.load=false;
          interfaces.ecranTitre=true;
          line=1;
          column=1;
        } else {
          if (playerBase.length-1>usernameNumber) {
            player=split(playerBase[usernameNumber+1], "|");
            levelNumber=Integer.parseInt(player[2])-1;
            bonusPoints.nbPoints=Integer.parseInt(player[1]);
            hero.nbMort=Integer.parseInt(player[4]);
            String[] time=split(player[3], ":");
            loadedHour=Integer.parseInt(time[0]);
            loadedMinute=Integer.parseInt(time[1]);
            loadedSecond=Integer.parseInt(time[2]);
            loadedMillis=Integer.parseInt(time[3]);
            hour+=loadedHour;
            minute+=loadedMinute;
            second+=loadedSecond;
            firstLoadedMillis=loadedMillis;
            pseudo=player[0];
            interfaces.load=false;
          }            
          initialTime=millis();
        }
      }
    } else if (interfaces.save==true) {
      if (key==ACTION) {
        if (line==1 && column==1 && actualPage==1) {
          actualPage=(int)nbPage;
        } else if (line==1 && column==1) {
          actualPage--;
        } else if (line==1 && column==5 && actualPage==nbPage) {
          actualPage=1;
        } else if (line==1 && column==5) {
          actualPage++;
        } else if (line==8) {
          interfaces.save=false;
          line=1;
          column=1;
        } else {
          if (playerBase.length-1>usernameNumber) {
            playerBase[usernameNumber+1]=pseudo+"|"+bonusPoints.nbPoints+"|"+(levelNumber+1)+"|"+hour+":"+minute+":"+second+":0"+"|"+hero.nbMort+"|0000000";//+(((millis()-initialTime)-timeStopped+(1000*interfaces.is1000)+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis))-(second*1000)-(minute*60000)-(hour*3600000))
            saveStrings("data/playerBase.txt", playerBase);
          } else {
            playerBase=append(playerBase, pseudo+"|"+bonusPoints.nbPoints+"|"+(levelNumber+1)+"|"+hour+":"+minute+":"+second+":0"+"|"+hero.nbMort+"|0000000");//+(str(millisPaused+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis)-(second*1000)-(minute*60000)-(hour*3600000)))
            saveStrings("data/playerBase.txt", playerBase);
          }
          playerBase=loadStrings("data/playerBase.txt");
        }
      }
    }
  }
}