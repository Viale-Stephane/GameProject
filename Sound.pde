class Sound {
  boolean firstMusic=true;
  int actualMusicTimer=0;
  void musicChange() {//fonction qui lance la musique du niveau suivant si elle est différente du niveau actuel (juste avant de passer un niveau)
    if (!hitboxLvl[levelNumber][128*38].equals(hitboxLvl[levelNumber-1][128*38])) {
      String nameMusic=hitboxLvl[levelNumber][128*38];
      actualMusic.close();
      actualMusic=musicBegin("Sound/Music/"+nameMusic+".mp3");
    }
  }

  void musicStop(AudioPlayer music) {//fonction qui arrête la musique courante et la rembobine
    music.skip(-music.length());
    music.pause();
  }

  AudioPlayer musicBegin(String musique) {//fonction qui permet de démarrer la musique courante
    AudioPlayer music=minim.loadFile(musique);
    music.play();
    music.loop();
    return music;
  }

  void musicLoop() {//fonction qui fait tourner en boucle la musique courante
    if (actualMusic.position()==actualMusic.length()) {
      actualMusic.rewind();
      actualMusic.play();
    }
  }

  void musicFirst() {//fonction qui démarre la première musique du jeu
    if (firstMusic==true) {
      musicStop(actualMusic);
      firstMusic=false;
      actualMusic.close();
      String nameMusic=hitboxLvl[levelNumber][128*38];
      actualMusic=musicBegin("Sound/music/"+nameMusic+".mp3");
    }
  }
  void loadNotBonusSFX() {
    //AudioSample mvtInterfaceANDdeath;
    //AudioSample validationInterfaceANDpowerup;
    //AudioSample jump;
    //AudioSample bonusSFX; //Gswap TP dash
    if (interfaces.firstScreen==true ||interfaces.ecranTitre==true || interfaces.setUsername==true || interfaces.load==true || interfaces.leaderboard==true || interfaces.save==true ||interfaces.pause==true) {// actions disponibles dans une interface
      mvtInterfaceANDdeath=minim.loadSample("data/Sound/SFX/mvtInterface.wav");
      validationInterfaceANDpowerup=minim.loadSample("data/Sound/SFX/validation.wav");
    } else if (interfaces.inGame==true) {
      mvtInterfaceANDdeath.close();
      validationInterfaceANDpowerup.close();
      mvtInterfaceANDdeath=minim.loadSample("data/Sound/SFX/Death.wav");
      validationInterfaceANDpowerup=minim.loadSample("data/Sound/SFX/Powerup.wav");
      jump=minim.loadSample("data/Sound/SFX/Jump.wav");
    }
  }
  void loadBonusSFX() {
    if (interfaces.ecranTitre==true || interfaces.setUsername==true || interfaces.load==true || interfaces.leaderboard==true || interfaces.save==true ||interfaces.pause==true) {// actions disponibles dans une interface
    } else {
      if (bonusDash.dash==true) {
        bonusSFX=minim.loadSample("data/Sound/SFX/dash.wav");
      } else if (bonusTP.bonusTP==true) {
        bonusSFX=minim.loadSample("data/Sound/SFX/TP.wav");
      } else if (bonusGravitySwap.GSwap==true) {
        bonusSFX=minim.loadSample("data/Sound/SFX/G-Swap.wav");
      }
    }
  }
}
