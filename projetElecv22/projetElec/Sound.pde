class Sound {
  void musicChange() {
    if (!hitboxLvl[levelNumber][128*38].equals(hitboxLvl[levelNumber-1][128*38])) {
      String nameMusic=hitboxLvl[levelNumber][128*38];
      switch(nameMusic) {
      case "musicBurn":
        musicStop(actualMusic);
        musicBegin(musicBurn);
        actualMusic=musicBurn;
        break;
      case "musicColorPanic":
        musicStop(actualMusic);
        musicBegin(musicColorPanic);
        actualMusic=musicColorPanic;
        break;
      case "musicJourneyBegin":
        musicStop(actualMusic);
        musicBegin(musicJourneyBegin);
        actualMusic=musicJourneyBegin;
        break;
      case "musicNewPower":
        musicStop(actualMusic);
        musicBegin(musicNewPower);
        actualMusic=musicNewPower;
        break;
      case "musicRetroRide":
        musicStop(actualMusic);
        musicBegin(musicRetroRide);
        actualMusic=musicRetroRide;
        break;
      case "musicRise":
        musicStop(actualMusic);
        musicBegin(musicRise);
        actualMusic=musicRise;
        break;
      case "musicTheLastBattle":
        musicStop(actualMusic);
        musicBegin(musicTheLastBattle);
        actualMusic=musicTheLastBattle;
        break;
      case "musicTheOne":
        musicStop(actualMusic);
        musicBegin(musicTheOne);
        actualMusic=musicTheOne;
        break;
      case "musicValk":
        musicStop(actualMusic);
        musicBegin(musicValk);
        actualMusic=musicValk;
        break;
      default:
        break;
      }
    }
  }

  void musicStop(AudioPlayer music) {
    music.skip(-music.length());
    music.pause();
  }

  void musicBegin(AudioPlayer music) {
    music.play();
    music.loop();
    println(music.getVolume());
  }

  void musicLoop() {
    if (actualMusic.position()==actualMusic.length()) {
      actualMusic.rewind();
      actualMusic.play();
    }
  }
}