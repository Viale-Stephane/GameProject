class Interface {
  boolean firstScreen=true, ecranTitre=false, setUsername=false, load=false, credit=false, leaderboard=false, firstLoad=true, firstLeaderboard=true, save=false, pause=false, importing=false, exporting=false;
  ;
  int line=1, column=1;
  int actualPage=1, usernameNumber=0, usersLength=0;
  int testedValue=1;
  int creditTime=0;
  int loadedHour=0, loadedMinute=0, loadedSecond=0, loadedMillis=0, firstLoadedMillis=0, stepMillisIntegration=0, is1000=0;
  float nbPage;
  String pseudo="", charChosen;
  String[]playerBase;
  String[] player;


  public void ecranTitre() {//fonction qui affiche l'ecranTitre et qui permet d'avoir une interface dynamique si l'on bouge le joystick
    image(menuPNG, 0, 0);
    textFont(font);
    textSize(42);
    strokeWeight(4);
    stroke(255, 102, 0);
    fill(255, 102, 0, 50);
    switch(column) {
    case 1://play
      rect(200, 200, 600, 60, 20);
      fill(255, 102, 0);
      text("PLAY", 415, 250);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 280, 600, 60, 20);
      rect(200, 360, 600, 60, 20);
      rect(200, 440, 600, 60, 20);
      rect(200, 520, 600, 60, 20);
      fill(255);
      text("LOAD", 415, 330);  
      text("LEADERBOARD", 262, 410);
      text("CREDIT", 372, 490);
      text("EXIT", 415, 570);
      break;
    case 2://load
      rect(200, 280, 600, 60, 20);
      fill(255, 102, 0);
      text("LOAD", 415, 330);  
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 60, 20);
      rect(200, 360, 600, 60, 20);
      rect(200, 440, 600, 60, 20);
      rect(200, 520, 600, 60, 20);
      fill(255);
      text("PLAY", 415, 250);
      text("LEADERBOARD", 262, 410);
      text("CREDIT", 372, 490);
      text("EXIT", 415, 570);
      break;
    case 3://leaderboard
      rect(200, 360, 600, 60, 20);
      fill(255, 102, 0);
      text("LEADERBOARD", 262, 410);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 60, 20);
      rect(200, 280, 600, 60, 20);
      rect(200, 440, 600, 60, 20);
      rect(200, 520, 600, 60, 20);
      fill(255);
      text("PLAY", 415, 250);
      text("LOAD", 415, 330);  
      text("CREDIT", 372, 490);
      text("EXIT", 415, 570);
      break;
    case 4://credit
      rect(200, 440, 600, 60, 20);
      fill(255, 102, 0);
      text("CREDIT", 372, 490);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 60, 20);
      rect(200, 280, 600, 60, 20);
      rect(200, 360, 600, 60, 20);
      rect(200, 520, 600, 60, 20);
      fill(255);
      text("PLAY", 415, 250);
      text("LOAD", 415, 330);   
      text("LEADERBOARD", 262, 410);
      text("EXIT", 415, 570);
      break;
    case 5://exit
      rect(200, 520, 600, 60, 20);
      fill(255, 102, 0);
      text("EXIT", 415, 570);
      stroke(100, 100, 100);
      fill(50, 50, 50, 150);
      rect(200, 200, 600, 60, 20);
      rect(200, 280, 600, 60, 20);
      rect(200, 360, 600, 60, 20);
      rect(200, 440, 600, 60, 20);
      fill(255);
      text("PLAY", 415, 250);
      text("LOAD", 415, 330);   
      text("LEADERBOARD", 262, 410);
      text("CREDIT", 372, 490);
    }
  }

  void visualKeyboard() {//fonction qui fait apparaitre un clavier visuel pour saisir un pseudo, la touche où l'on se situe au moment actuel est 'surligné'
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
      text(arrayPseudo[i], 85+i*100, 115);//affiche les lettres du pseudo en haut
    }
  }

  void save() {//fonction pour sauvegarder avec la même interface que le load
    load();
    if (21*nbPage==usersLength) {
      nbPage++;
    }
  }

  void load() {//fonction qui fait apparaître une page permettant de choisir quelle partie on souhaite charger
    String[] users=new String[0];
    for (int i=0; i<playerBase.length-1; i++) {
      String[] pseudo=split(playerBase[i+1], '|');
      users=append(users, pseudo[0]);
    }
    if (firstLoad==true) {//quand on charge pour la première fois la fonction load, on regarde combien de page vont être nécessaire
      nbPage=(float)users.length/21;//on a 21 parties par pages
      if (nbPage-(int)nbPage!=0) {
        nbPage=(int)nbPage+1;
      }
      usersLength=users.length;
      firstLoad=false;
    }
    for (int i=0; i<(21*nbPage)-usersLength; i++) {//finit de remplir une page avec des cases "empty"
      users=append(users, "    \'empty\'");
    }
    fill(100, 100, 100, 100);
    stroke(100, 100, 100);
    strokeWeight(4);
    for (int i=0; i<7  && i<users.length/3; i++) {//place 21 rectangles dans lesquels les pseudos seront mis
      rect(80, 20+(60*i), 250, 50, 20);
      rect(380, 20+(60*i), 250, 50, 20);
      rect(680, 20+(60*i), 250, 50, 20);
    }

    fill(255);
    textSize(13);
    for (int i=0; i<21 && i<users.length-1; i+=3) {//place le nom des utilisateurs dans ces rectangles
      text(users[i+(21*(actualPage-1))], 100, 40+(i*20));
      text(users[i+1+(21*(actualPage-1))], 400, 40+(i*20));
      text(users[i+2+(21*(actualPage-1))], 700, 40+(i*20));
    }
    fill(100, 100, 100, 100);
    rect(90, 450, 400, 100, 20);//rectangle de la case retour
    rect(515, 450, 400, 100, 20);//rectangle de la case import
    rect(10, 15, 50, 415, 20);//rectangle de la case pour aller à la page de gauche
    rect(964, 15, 50, 415, 20);//rectangle de la case pour aller à droite
    stroke(255);
    line(20, 220, 50, 160);//lignes fleches
    line(20, 220, 50, 280);
    line(1004, 220, 974, 160);
    line(1004, 220, 974, 280);//lignes fleches
    fill(255);
    textSize(52);
    text("RETOUR", 130, 520);
    if (load==true) {
      text("IMPORT", 555, 520);
    } else if (save==true) {
      text("EXPORT", 555, 520);
    }
    textSize(10);
    stroke(80, 120, 200);
    strokeWeight(2);
    for (int i=0; (21*(actualPage-1)+3*i<usersLength-2) && i<7; i++) {
      player=split(playerBase[21*(actualPage-1)+3*i+1], "|");//récupère les valeurs du player courant
      line(95, 25+(i*60), 105, 25+(i*60));//petits 'symboles' pour montrer la zone texte du pseudo
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
      line(820, 42+(i*60), 810, 42+(i*60));//fin petits 'symboles' pour montrer la zone texte du pseudo
      String[] time=split(player[3], ":");
      image(timer, 100, 45+60*i, 24, 24);//placer l'image du timer
      image(deathPNG, 220, 45+60*i, 24, 24);//placer l'image de la mort
      image(coin, 225, 25+60*i, 16, 16);//placer l'image de la pièce
      text(player[1], 245, 40+60*i);//placer le nombre de pièce du joueur
      text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 120, 60*(i+1));//place le temps du joueur
      text(player[4], 245, 60*(i+1));//place le nombre de mort du joueur
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
      if (3*(i+1)+2==usersLength-21*(actualPage-1) && actualPage==nbPage) {
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
      } else if (3*(i+1)+1==usersLength-21*(actualPage-1) && actualPage==nbPage) {
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
    if (usersLength-21*(actualPage-1)==2 && actualPage==nbPage) {
      line(95, 25, 105, 25);
      line(95, 25, 95, 35);
      line(220, 42, 220, 32);
      line(220, 42, 210, 42);
      line(395, 25, 405, 25);
      line(395, 25, 395, 35);
      line(520, 42, 520, 32);
      line(520, 42, 510, 42);
      player=split(playerBase[playerBase.length-2], "|");
      String[] time=split(player[3], ":");
      image(timer, 100, 45, 24, 24);
      image(deathPNG, 220, 45, 24, 24);
      image(coin, 225, 25, 16, 16);
      text(player[1], 245, 40);
      text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 120, 60);
      text(player[4], 245, 60);
      player=split(playerBase[playerBase.length-1], "|");
      time=split(player[3], ":");
      image(timer, 400, 45, 24, 24);
      image(deathPNG, 520, 45, 24, 24);
      image(coin, 525, 25, 16, 16);
      text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 420, 60);     
      text(player[4], 545, 60);
      text(player[1], 545, 40);
    } else if (usersLength-21*(actualPage-1)==1 && actualPage==nbPage) {
      line(95, 25, 105, 25);
      line(95, 25, 95, 35);
      line(220, 42, 220, 32);
      line(220, 42, 210, 42);
      player=split(playerBase[playerBase.length-1], "|");
      String[] time=split(player[3], ":");
      image(timer, 100, 45, 24, 24);
      image(deathPNG, 220, 45, 24, 24);
      image(coin, 225, 25, 16, 16);
      text(player[1], 245, 40);
      text(Integer.parseInt(time[0])+":"+Integer.parseInt(time[1])+":"+Integer.parseInt(time[2])+":"+Integer.parseInt(time[3]), 120, 60);
      text(player[4], 245, 60);
    }

    stroke(0, 255, 0);
    textSize(13);
    fill(0, 255, 0, 100);
    switch(column) {
    case 1:
      switch(line) {
      case 1://passage à la page de gauche
        rect(10, 15, 50, 415, 20);
        line(20, 220, 50, 160);
        line(20, 220, 50, 280);
        break;
      case 8:    
        rect(90, 450, 400, 100, 20);//rectangle de la case retour
        textSize(52);
        text("RETOUR", 130, 520);
        break;
      }
      break;
    case 2:
      switch(line) {
      case 1://case 1
        rect(80, 20, 250, 50, 20);
        text(users[0+(21*(actualPage-1))], 100, 40);
        usernameNumber=0+(21*(actualPage-1));
        break;
      case 2://case 4
        rect(80, 80, 250, 50, 20);
        text(users[3+(21*(actualPage-1))], 100, 100);
        usernameNumber=3+(21*(actualPage-1));
        break;
      case 3://case 7
        rect(80, 140, 250, 50, 20);
        text(users[6+(21*(actualPage-1))], 100, 160);
        usernameNumber=6+(21*(actualPage-1));
        break;
      case 4://case 10
        rect(80, 200, 250, 50, 20);
        text(users[9+(21*(actualPage-1))], 100, 220);
        usernameNumber=9+(21*(actualPage-1));
        break;
      case 5://case 13
        rect(80, 260, 250, 50, 20);
        text(users[12+(21*(actualPage-1))], 100, 280);
        usernameNumber=12+(21*(actualPage-1));
        break;
      case 6://case 16
        rect(80, 320, 250, 50, 20);
        text(users[15+(21*(actualPage-1))], 100, 340);
        usernameNumber=15+(21*(actualPage-1));
        break;
      case 7://case 19
        rect(80, 380, 250, 50, 20);
        text(users[18+(21*(actualPage-1))], 100, 400);
        usernameNumber=18+(21*(actualPage-1));
        break;
      case 8:
        rect(515, 450, 400, 100, 20);//rectangle de la case import
        textSize(52);
        if (load==true) {
          text("IMPORT", 555, 520);
        } else if (save==true) {
          text("EXPORT", 555, 520);
        }
        break;
      }
      break;
    case 3:
      switch(line) {
      case 1://case 2
        rect(380, 20, 250, 50, 20);
        text(users[1+(21*(actualPage-1))], 400, 40);
        usernameNumber=1+(21*(actualPage-1));
        break;
      case 2://case 5
        rect(380, 80, 250, 50, 20);
        text(users[4+(21*(actualPage-1))], 400, 100);
        usernameNumber=4+(21*(actualPage-1));
        break;
      case 3://case 8
        rect(380, 140, 250, 50, 20);
        text(users[7+(21*(actualPage-1))], 400, 160);
        usernameNumber=7+(21*(actualPage-1));
        break;
      case 4://case 11
        rect(380, 200, 250, 50, 20);
        text(users[10+(21*(actualPage-1))], 400, 220);
        usernameNumber=10+(21*(actualPage-1));
        break;
      case 5://case 14
        rect(380, 260, 250, 50, 20);
        text(users[13+(21*(actualPage-1))], 400, 280);
        usernameNumber=13+(21*(actualPage-1));
        break;
      case 6://case 17
        rect(380, 320, 250, 50, 20);
        text(users[16+(21*(actualPage-1))], 400, 340);
        usernameNumber=16+(21*(actualPage-1));
        break;
      case 7://case 20
        rect(380, 380, 250, 50, 20);
        text(users[19+(21*(actualPage-1))], 400, 400);
        usernameNumber=19+(21*(actualPage-1));
        break;
      }
      break;
    case 4:
      switch(line) {
      case 1://case 3
        rect(680, 20, 250, 50, 20);
        text(users[2+(21*(actualPage-1))], 700, 40);
        usernameNumber=2+(21*(actualPage-1));
        break;
      case 2://case 6
        rect(680, 80, 250, 50, 20);
        text(users[5+(21*(actualPage-1))], 700, 100);
        usernameNumber=5+(21*(actualPage-1));
        break;
      case 3://case 9
        rect(680, 140, 250, 50, 20);
        text(users[8+(21*(actualPage-1))], 700, 160);
        usernameNumber=8+(21*(actualPage-1));
        break;
      case 4://case 12
        rect(680, 200, 250, 50, 20);
        text(users[11+(21*(actualPage-1))], 700, 220);
        usernameNumber=11+(21*(actualPage-1));
        break;
      case 5://case 15
        rect(680, 260, 250, 50, 20);
        text(users[14+(21*(actualPage-1))], 700, 280);
        usernameNumber=14+(21*(actualPage-1));
        break;
      case 6://case 18
        rect(680, 320, 250, 50, 20);
        text(users[17+(21*(actualPage-1))], 700, 340);
        usernameNumber=17+(21*(actualPage-1));
        break;
      case 7://case 21
        rect(680, 380, 250, 50, 20);
        text(users[20+(21*(actualPage-1))], 700, 400);
        usernameNumber=20+(21*(actualPage-1));
        break;
      }
      break;
    case 5:
      rect(964, 15, 50, 415, 20);
      line(1004, 220, 974, 160);
      line(1004, 220, 974, 280);
      break;
    }
  }


  String[] leaderboard() { //fonction qui retourne un tableau où le leaderboard est rangé selon 4 possibilités, le score, le timer, le nombre de mort, le nombre de pièces, dans cet ordre de préférence
    int[] numberTested=new int[0];
    String[] player;
    String[] timer;
    int time=0;
    for (int i=0; i<playerBase.length-1; i++) {
      player=split(playerBase[i+1], "|");
      if (testedValue==3) {//si la valeur est 3, on coupe aussi selon ":" pour récupérer les heures,minutes,seconde;
        timer=split(player[3], ":");
        numberTested=append(numberTested, Integer.parseInt(timer[0])*3600000+Integer.parseInt(timer[1])*60000+Integer.parseInt(timer[2])*1000+Integer.parseInt(timer[3]));
      } else {
        numberTested=append(numberTested, Integer.parseInt(player[testedValue]));
      }
    }
    numberTested=sort(numberTested);//ordonne le tableau
    if (testedValue==1 || testedValue==5) {
      numberTested=reverse(numberTested);//reverse le tableau pour ces valeurs car il s'agit du score et des pièces, et l'on souhaite le plus grand nombre dans le leaderboard pour ceux-là
    }
    String[] lessDeathPlayer=new String[0];
    while (lessDeathPlayer.length<playerBase.length-1) {
      for (int i=0; i<playerBase.length-1; i++) {
        player=split(playerBase[i+1], "|");

        if (testedValue==3) {//recoupe notre playerBase selon ":" pour ensuite réordonner le tableau par rapport à la liste que l'on a obtenu tout à l'heure pour remettre les "|" et les ":" dedans
          timer=split(player[3], ":");
          time=Integer.parseInt(timer[0])*3600000+Integer.parseInt(timer[1])*60000+Integer.parseInt(timer[2])*1000+Integer.parseInt(timer[3]);

          if (lessDeathPlayer.length<numberTested.length && numberTested[lessDeathPlayer.length]==time) {//si la valeur à la position i du tableau numberTested est la même que time alors on ordonne le tableau avec celle-ci
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

  void visualLeaderboard() {//affichage visuel du leaderboard
    String[] coinsPlayer=leaderboard();
    fill(255, 0, 0);
    if (firstLeaderboard==true) {//quand pour la première fois on consulte le leaderboard, on ordonne les pages par joueurs par page
      nbPage=(float)coinsPlayer.length/8;
      if (nbPage-(int)nbPage!=0) {
        nbPage=(int)nbPage+1;
      }
    }
    strokeWeight(4);
    for (int i=1; i<5; i++) {//tracé des lignes du tableau
      line(200*i, 0, 200*i, 390);
    }
    textSize(16);
    line(30, 0, 30, 390);
    line(0, 55, 1024, 55);
    if (testedValue==1) {//selon la valeur de tested value on place l'élément correspondant à testedValue puis score puis timer puis death puis coin selon l'ordre(4 éléments max)
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
      text(((actualPage-1)*8+i+1), 5, 40+40*(i+1));//position de la personne dans le leaderboard
      line(35, 65+40*i, 45, 65+40*i);//début des délimitations du pseudo
      line(35, 65+40*i, 35, 75+40*i);
      line(190, 85+40*i, 190, 75+40*i);
      line(190, 85+40*i, 180, 85+40*i);//fin des délimitaions du pseudo
      text(player[0], 40, 40+40*(i+1));//pseudo du joueur à la position i+1
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
      } else if (testedValue==4) {//death
        text(player[4], 210, 40+40*(i+1));
        text(player[5], 410, 40+40*(i+1));
        text(player[3], 610, 40+40*(i+1));
        text(player[1], 810, 40+40*(i+1));
      } else if (testedValue==5) {//score
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
      case 1://page précédente
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
      case 2://pieces
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
      case 3://death
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
      case 4://timer
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
      case 5://score
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
      case 6://page suivante
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

  void credits() {//affichage visuel de la page des crédits
    //gamedev
    //levelEditor dev
    //levelEditor design
    //sound design
    //character design 
    //environment design
    //
    //level design for all levels
    //
    if (millis()-creditTime<=5000) {//change de page au bout de 5 secondes
      textSize(22);
      text("Game Development : Viale Stéphane", 50, 50);
      text("Level Editor development : Viale Stéphane", 50, 150);
      text("level Editor Design : Viale Stéphane", 50, 250);
      text("Sound Design : Coppé Vincent", 50, 350);
      text("Character  Design : Coppé Vincent", 50, 450);
      text("Environment Design : Coppé Vincent", 50, 550);
    } else if (millis()-creditTime<=10000) {//sur cette page et les suivantes il y a le nom de la personne qui a fait le niveau pendant 5secondes
      textSize(22);
      text("Levels Design", 350, 50);
      textSize(11);
      for (int i=1; i<=12; i++) {
        text("level "+i+" : Coppé Vincent", 50, 60+40*i);
        text("level "+(i+13)+" : Coppé Vincent", 350, 60+40*i);
      }
      text("level 13 : Viale Stéphane", 50, 60+40*13);
      text("level 26 : Coppé Vincent", 350, 60+40*13);
      text("level 27 : Viale Stéphane", 650, 100);
      for (int i=1; i<=5; i++) {
        text("level "+(i+27)+" : Coppé Vincent", 650, 60+40*(i+1));
      }
      for (int i=1; i<=7; i++) {
        text("level "+(i+32)+" : Viale Stéphane", 650, 60+40*(i+6));
      }
    } else if (millis()-creditTime<=15000) {
      textSize(22);
      text("Levels Design", 350, 50);
      textSize(11);
      for (int i=1; i<=13; i++) {
        text("level "+(i+39)+" : Viale Stéphane", 50, 60+40*i);
      }
      for (int i=1; i<=7; i++) {
        text("level "+(i+52)+" : Graulier Brice", 350, 60+40*i);
      }
    } else {//quitte les crédits et retourne à l'ecranTitre
      interfaces.credit=false;
      interfaces.ecranTitre=true;
    }
  }

  void pause() {
    image(menuEmpty, 0, 0);
    fill(#E4E823);
    textSize(22);
    image(timer, 350, 5);
    text(hour+":"+minute+":"+second+":"+(((millisPaused-initialTime)-timeStopped+(1000*interfaces.is1000)+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis))-(second*1000)-(minute*60000)-(hour*3600000)), 395, 35);//880
    image(deathPNG, 5, 5);
    text(hero.nbMort, 50, 35);
    image(coin, 5, 55);
    text(bonusPoints.nbPoints, 50, 88);
    stroke(100, 100, 200);
    fill(100, 100, 200, 50);
    rect(300, 50, 400, 500, 20);
    fill(255, 255, 255);
    textSize(52);
    text("PAUSE", 365, 120);
    text("SAVE", 390, 220);
    text("RESUME", 345, 340);
    text("QUIT", 390, 460);

    //fill(255, 102, 0, 50);
    //stroke(255, 102, 0);
    fill(100, 100, 100, 100);
    rect(310, 150, 380, 100, 20);//save
    rect(310, 270, 380, 100, 20);//resume
    rect(310, 390, 380, 100, 20);//quit
    fill(255, 102, 0, 50);
    stroke(255, 102, 0);
    switch(line) {
    case 1://save
      rect(310, 150, 380, 100, 20);
      fill(255, 102, 0);
      text("SAVE", 390, 220);
      fill(100, 100, 100, 100);
      stroke(100, 100, 100);
      rect(310, 270, 380, 100, 20);//resume
      rect(310, 390, 380, 100, 20);//quit
      fill(255, 255, 255);
      text("RESUME", 345, 340);
      text("QUIT", 390, 460);
      break;
    case 2://resume
      rect(310, 270, 380, 100, 20);//resume
      fill(255, 102, 0);
      text("RESUME", 345, 340);
      fill(100, 100, 100, 100);
      stroke(100, 100, 100);
      rect(310, 150, 380, 100, 20);
      rect(310, 390, 380, 100, 20);//quit
      fill(255, 255, 255);      
      text("SAVE", 390, 220);
      text("QUIT", 390, 460);
      break;
    case 3://quit
      rect(310, 390, 380, 100, 20);//quit
      fill(255, 102, 0);
      text("QUIT", 390, 460);
      fill(100, 100, 100, 100);
      stroke(100, 100, 100);
      rect(310, 150, 380, 100, 20);
      rect(310, 270, 380, 100, 20);//resume
      fill(255, 255, 255);
      text("SAVE", 390, 220);
      text("RESUME", 345, 340);
      break;
    }
  }

  void importing() {
    image(menuEmpty, 0, 0);
    textSize(24);
    fill(0, 255, 0);
    text("Connectez-vous à la PI en SSH", 10, 50);
    text("Identifiant :pi", 10, 100);
    text("Mot de passe :colorPanic", 10, 150);
    text("entrez la commande suivante :", 10, 200);
    textSize(9);
    textFont(arial);
    text("\"scp -p ~/colorPanic/actualPlayer.txt pi@colorPanic:/home/pi/colorPanic/application.linux64/data/actualPlayer.txt\"", 10, 250);
    fill(255, 102, 0, 50);
    stroke(255, 102, 0);
    textFont(font);
    textSize(42);
    switch(column) {
    case 1:
      rect(20, 450, 450, 100, 20);
      fill(255, 102, 0);
      text("RETURN", 100, 515);
      fill(100, 100, 100, 100);
      stroke(100, 100, 100);
      rect(520, 450, 450, 100, 20);
      fill(100, 100, 100);
      text("PLAY", 670, 515);
      break;
    case 2:
      rect(520, 450, 450, 100, 20);
      fill(255, 102, 0);
      text("PLAY", 670, 515);
      fill(100, 100, 100, 100);
      stroke(100, 100, 100);
      rect(20, 450, 450, 100, 20);
      fill(100, 100, 100);
      text("RETURN", 100, 515);
      break;
    }
  }

  void exporting() {
    image(menuEmpty, 0, 0);
    textSize(24);
    fill(0, 255, 0);
    text("Connectez-vous à la PI en SSH", 10, 50);
    text("Identifiant :pi", 10, 100);
    text("Mot de passe :colorPanic", 10, 150);
    text("entrez la commande suivante :", 10, 200);
    textSize(9);
    textFont(arial);
    text("\"scp -p pi@colorPanic:/home/pi/colorPanic/applitcation.linux64/data/actualPlayer.txt ~/colorPanic/actualPlayer.txt\"", 10, 250);
    fill(255, 102, 0, 50);
    stroke(255, 102, 0);
    textFont(font);
    textSize(42);
    switch(column) {
    case 1:
      rect(20, 450, 450, 100, 20);
      fill(255, 102, 0);
      text("RETURN", 100, 515);
      fill(100, 100, 100, 100);
      stroke(100, 100, 100);
      rect(520, 450, 450, 100, 20);
      fill(100, 100, 100);
      text("SAVE", 670, 515);
      break;
    case 2:
      rect(520, 450, 450, 100, 20);
      fill(255, 102, 0);
      text("SAVE", 670, 515);
      fill(100, 100, 100, 100);
      stroke(100, 100, 100);
      rect(20, 450, 450, 100, 20);
      fill(100, 100, 100);
      text("RETURN", 100, 515);
      break;
    }
  }

  void endGame() {
    if (levelNumber==59) {
      sound.musicStop(actualMusic);
      sound.musicBegin("data/Sound/Music/musicBurn.mp3");
      interfaces.credit=true;
      levelNumber=0;
      creditTime=millis();
      int time=hour*3600000+minute*60000+second*1000+((millisPaused-initialTime)-timeStopped+(1000*interfaces.is1000)+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis))-(second*1000)-(minute*60000)-(hour*3600000);
      int timeDev=8*60000;
      float score=((0.5+(bonusPoints.nbPoints/19))*100000)*(exp(-hero.nbMort/250)/log(1+(time/timeDev)));
      playerBase=append(playerBase, pseudo+"|"+bonusPoints.nbPoints+"|59"+hour+":"+minute+":"+"+"+second+":"+str(((millisPaused-initialTime)-timeStopped+(1000*interfaces.is1000)+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis))-(second*1000)-(minute*60000)-(hour*3600000))+"|"+hero.nbMort+"|"+score);
    }
  }

  void leftAction() {//actions faites dans les interfaces avec la touche GAUCHE
    if (interfaces.load==true || interfaces.save==true) {
      if (key==GAUCHE) {
        if (column==1 && line!=8) {
          column=5;
        } else if (line==8 && column==1) {
          column=2;
        } else if (column==2 && line!=8) {
          line=1;
          column=1;
        } else if (column==1 && line==8) {
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
    } else if (interfaces.importing==true ||interfaces.exporting==true) {
      if (key==GAUCHE) {
        if (column==1) {
          column=2;
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
  void rightAction() {//actions faites dans les interfaces avec la touche DROITE
    if (interfaces.load==true || interfaces.save==true) {
      if (key==DROITE) {
        if (column==5) {
          column=1;
        } else if (column==4) {
          column=5;
          line=1;
        } else if (column==1 && line!=8) {
          column=2;
          line=4;
        } else if (column==2 && line==8) {
          column=1;
        } else {
          column++;
        }
      }
    } else if (interfaces.importing==true || interfaces.exporting==true) {
      if (key==DROITE) {
        if (column==2) {
          column=1;
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
  void topAction() {//actions faites dans les interfaces avec la touche HAUT
    if (interfaces.ecranTitre==true) {
      if (key==HAUT) {
        if (column==1) {
          column=5;
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
        if (line==1 && column<=3) {
          line=8;
          column=1;
        } else if (line==1) {
          line=8;
          column=2;
        } else if (line==1 && (column==5 || column==1)) {
          line=2;
          column=3;
        } else if (line==8 && column==1) {
          line=7;
          column=2;
        } else if (line==8 && column==2) {
          line=7;
          column=4;
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
    } else if (interfaces.pause==true) {
      if (key==HAUT) {
        if (line==1) {
          line=3;
        } else {
          line--;
        }
      }
    }
  }
  void bottomAction() {//actions faites sur les interfaces avec la touche BAS
    if (interfaces.ecranTitre==true) {
      if (key==BAS) {
        if (column==5) {
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
        if (line==8 && column==1) {
          line=1;
          column=2;
        } else if (line==8) {
          line=1;
          column=4;
        } else if (column==1 && line==1) {
          line=8;
          column=1;
        } else if (column==5 && line==1) {
          line=8;
          column=2;
        } else if (line==7 && column<=3) {
          line=8;
          column=1;
        } else if (line==7) {
          line=8;
          column=2;
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
    } else if (interfaces.pause==true) {
      if (key==BAS) {
        if (line==3) {
          line=1;
        } else {
          line++;
        }
      }
    }
  }
  void confirmAction() {//validation de la case sur laquelle se trouve la selection 
    if (interfaces.ecranTitre==true) {
      if (key==ACTION) {
        switch(column) {
        case 1://lance le choix du pseudo avant de joueur
          interfaces.ecranTitre=false;
          interfaces.setUsername=true;
          line=1;
          column=1;
          break;
        case 2://lance l'interface pour charger une partie
          interfaces.ecranTitre=false;
          interfaces.load=true;
          line=1;
          column=2;
          break;
        case 3://lance l'interface pour voir le leaderboard
          interfaces.ecranTitre=false;
          interfaces.leaderboard=true;
          column=2;
          line=1;
          break;
        case 4://lance les crédits
          interfaces.ecranTitre=false;
          interfaces.credit=true;
          creditTime=millis();
          break;
        case 5://quitte le jeu
          script.endGame();
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
          case 2://affiche le leaderboard selon les pièces
            testedValue=1;
            break;
          case 3://affiche le leaderboard selon les morts
            testedValue=4;
            break;
          case 4://affiche le leaderboard selon le temps
            testedValue=3;
            break;
          case 5://affiche le leaderboard selon le score
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
        } else if (line==2 && column==1) {//retourne à l'ecranTitre
          interfaces.ecranTitre=true;
          interfaces.leaderboard=false;
        }
      }
    } else if (interfaces.importing==true) {
      if (key==ACTION) {
        if (column==1) {
          interfaces.load=true;
          interfaces.importing=false;
          line=1;
          column=2;
        } else if (column==2) {
          String[] joueur=loadStrings("data/actualPlayer.txt");
          String[] player=split(joueur[1], "|");
          levelNumber=Integer.parseInt(player[2])-1;//place le level sur lequel commencé
          bonusPoints.nbPoints=Integer.parseInt(player[1]);//redonne le nombre de pièces
          hero.nbMort=Integer.parseInt(player[4]);//set le nombre de mort
          String[] time=split(player[3], ":");
          loadedHour=Integer.parseInt(time[0]);//set les heures
          loadedMinute=Integer.parseInt(time[1]);//set les minutes
          loadedSecond=Integer.parseInt(time[2]);//set les secondes
          loadedMillis=Integer.parseInt(time[3]);//set les millisecondes
          hour+=loadedHour;
          minute+=loadedMinute;
          second+=loadedSecond;
          firstLoadedMillis=loadedMillis;
          pseudo=player[0];
          line=1;
          column=1;
          interfaces.importing=false;
        }
      }
    } else if (interfaces.ecranTitre==false && interfaces.setUsername==true) {//si l'on est dans le choix du pseudo
      if (key==ACTION) {
        if (charChosen=="DELETE" && pseudo.length()>=1) {//si la touche est delete et qu'on peut delete, delete le dernier caractère
          pseudo=pseudo.substring(0, pseudo.length()-1);
        } else if (charChosen=="DELETE" && pseudo.length()==0) {//sinon ne delete rien
        } else if (charChosen=="FINISH") {//si la touche est finish rajoute au fichier playerBase le joueur avec le pseudo choisi et créer un fichier actual player qui est envoyé sur un autre périphérique en ssh si voulu quand on sauvegarde sa partie
          line=1;
          column=1;
          String[] line=new String[2];
          boolean sameUsername=true;
          line[0]="username|coins|actualLevel|timer|death|score";
          line[1]=pseudo+"|0|1|00:00:00:0000|0|0000000";
          saveStrings("data/actualPlayer.txt", line);
          String[] username;//=split(playerBase[1],"|");
          //for(int i=0;i<username.length;i++){
          // println(username[i]); 
          //}
          for (int i=0; i<playerBase.length-1; i++) {
            username=split(playerBase[i+1], "|");
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
        } else {//sinon ajoute la lettre au pseudo
          pseudo+=charChosen;
        }
      }
    } else if (interfaces.load==true) {//si l'on est dans l'interface de chargement
      if (key==ACTION) {
        if (line==1 && column==1 && actualPage==1) {
          actualPage=(int)nbPage;
        } else if (line==1 && column==1) {
          actualPage--;
        } else if (line==1 && column==5 && actualPage==nbPage) {
          actualPage=1;
        } else if (line==1 && column==5) {
          actualPage++;
        } else if (line==8 && column==1) {//retour à l'écran titre
          interfaces.load=false;
          interfaces.ecranTitre=true;
          line=1;
          column=1;
        } else if (line==8 && column==2) {
          line=1;
          column=1;
          interfaces.importing=true;
          interfaces.load=false;
        } else {
          if (playerBase.length-1>usernameNumber) {//quand on choisi une partie que l'on souhaite jouer
            player=split(playerBase[usernameNumber+1], "|");
            levelNumber=Integer.parseInt(player[2])-1;//place le level sur lequel commencé
            bonusPoints.nbPoints=Integer.parseInt(player[1]);//redonne le nombre de pièces
            hero.nbMort=Integer.parseInt(player[4]);//set le nombre de mort
            String[] time=split(player[3], ":");
            loadedHour=Integer.parseInt(time[0]);//set les heures
            loadedMinute=Integer.parseInt(time[1]);//set les minutes
            loadedSecond=Integer.parseInt(time[2]);//set les secondes
            loadedMillis=Integer.parseInt(time[3]);//set les millisecondes
            hour+=loadedHour;
            minute+=loadedMinute;
            second+=loadedSecond;
            firstLoadedMillis=loadedMillis;
            pseudo=player[0];
            interfaces.load=false;//quitte l'interface load et lance le jeu avec les options choisies
            line=1;
            column=1;
          }            
          initialTime=millis();
        }
      }
    } else if (interfaces.exporting==true) {
      if (key==ACTION) {
        if (column==1) {
          interfaces.save=true;
          interfaces.exporting=false;
          line=1;
          column=2;
        } else {
          interfaces.pause=true;
          interfaces.exporting=false;
          line=1;
          column=1;
        }
      }
    } else if (interfaces.pause==true) {
      if (key==ACTION) {
        if (line==1) {
          interfaces.pause=false;
          interfaces.save=true;
          interfaces.firstLoad=true;
        } else if (line==2) {
          interfaces.pause=false;
          sound.closeInterfaceSound();
        } else {//retour au menu de démarrage
          sound.musictitle=true;
          playerBase=append(playerBase, pseudo+"|"+bonusPoints.nbPoints+"|"+(levelNumber+1)+"|"+hour+":"+minute+":"+second+":"+str(((millisPaused-initialTime)-timeStopped+(1000*interfaces.is1000)+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis))-(second*1000)-(minute*60000)-(hour*3600000))+"|"+hero.nbMort+"|0000000");            
          saveStrings("data/playerBase.txt", playerBase);
          usersLength++;
          playerBase=loadStrings("data/playerBase.txt");
          bonusPoints.nbPoints=0;
          levelNumber=0;
          hour=0;
          minute=0;
          second=0;
          millisPaused=0;
          initialTime=0;
          timeStopped=0;
          interfaces.is1000=0;
          interfaces.loadedHour=0;
          interfaces.loadedMinute=0;
          interfaces.loadedSecond=0;
          interfaces.firstLoadedMillis=0;
          hero.nbMort=0;
          interfaces.ecranTitre=true;
          interfaces.pause=false;
        }
      }
    } else if (interfaces.save==true) {//si l'on est sur l'interface de sauvegarde
      if (key==ACTION) {
        if (line==1 && column==1 && actualPage==1) {
          actualPage=(int)nbPage;
        } else if (line==1 && column==1) {
          actualPage--;
        } else if (line==1 && column==5 && actualPage==nbPage) {
          actualPage=1;
        } else if (line==1 && column==5) {
          actualPage++;
        } else if (line==8 && column==1) {//quitte l'interface de sauvegarde
          interfaces.save=false;
          interfaces.pause=true;
          line=1;
          column=1;
        } else if (line==8 && column==2) {
          interfaces.save=false;
          interfaces.exporting=true;
          line=1;
          column=1;
        } else {
          if (playerBase.length-1>usernameNumber) {//sauvegarde les informations actuelles de la partie dans le fichier playerBase
            playerBase[usernameNumber+1]=pseudo+"|"+bonusPoints.nbPoints+"|"+(levelNumber+1)+"|"+hour+":"+minute+":"+second+":"+str(((millisPaused-initialTime)-timeStopped+(1000*interfaces.is1000)+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis))-(second*1000)-(minute*60000)-(hour*3600000))+"|"+hero.nbMort+"|0000000";
            saveStrings("data/playerBase.txt", playerBase);
          } else {
            playerBase=append(playerBase, pseudo+"|"+bonusPoints.nbPoints+"|"+(levelNumber+1)+"|"+hour+":"+minute+":"+second+":"+str(((millisPaused-initialTime)-timeStopped+(1000*interfaces.is1000)+(interfaces.loadedHour*3600000)+(interfaces.loadedMinute*60000)+(interfaces.loadedSecond*1000)+(interfaces.firstLoadedMillis))-(second*1000)-(minute*60000)-(hour*3600000))+"|"+hero.nbMort+"|0000000");            
            saveStrings("data/playerBase.txt", playerBase);
            usersLength++;
          }
          playerBase=loadStrings("data/playerBase.txt");
        }
      }
    }
  }
}
