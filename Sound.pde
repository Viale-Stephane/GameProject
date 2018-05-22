class Sound {
  void musicChange() {
    if (!hitboxLvl[levelNumber][128*38].equals(hitboxLvl[levelNumber-1][128*38])) {
      String nameMusic=hitboxLvl[levelNumber][128*38];
      actualMusic.close();
      actualMusic=musicBegin("Sound/Music/"+nameMusic+".mp3");
    }
  }

  void musicStop(AudioPlayer music) {
    music.skip(-music.length());
    music.pause();
  }

  AudioPlayer musicBegin(String musique) {
    AudioPlayer music=minim.loadFile(musique);
    music.play();
    music.loop();
    return music;
  }

  void musicLoop() {
    if (actualMusic.position()==actualMusic.length()) {
      actualMusic.rewind();
      actualMusic.play();
      }
  }
  
  void musicFirst() {
      if(firstMusic==true){
      musicStop(actualMusic);
      firstMusic=false;
      actualMusic.close();
      String nameMusic=hitboxLvl[levelNumber][128*38];
      actualMusic=musicBegin("Sound/music/"+nameMusic+".mp3");
      }
  }
}
