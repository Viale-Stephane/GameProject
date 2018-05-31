class Sound {
  boolean firstMusic=true;
  boolean musictitle=false;
  int actualMusicTimer=0;
  void musicChange() {//fonction qui lance la musique du niveau suivant si elle est différente du niveau actuel (juste avant de passer un niveau)
    if (levelNumber!=59 && !hitboxLvl[levelNumber][128*38].equals(hitboxLvl[levelNumber-1][128*38])) {
      String nameMusic=hitboxLvl[levelNumber][128*38];
      actualMusic.close();
      actualMusic=musicBegin("data/Sound/Music/"+nameMusic+".mp3");
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
      minim.stop();
      firstMusic=false;
      actualMusic.close();
      mvtInterface.close();
      validationInterface.close();
      death=minim.loadSample("data/Sound/SFX/Death.mp3");
      jump=minim.loadSample("data/Sound/SFX/Jump.mp3");
      powerup=minim.loadSample("data/Sound/SFX/Powerup.mp3");
      TP=minim.loadSample("data/Sound/SFX/TP.mp3");
      String nameMusic=hitboxLvl[levelNumber][128*38];
      actualMusic=musicBegin("data/Sound/Music/"+nameMusic+".mp3");
    }
  }
}
