class Bonus {
  protected int x, y;
  protected int currentFrame=0;
  public int occurence=0;
  public void position(String bonus) {
    for (int i=0; i<128*38; i++) {
      if (hitboxLvl[levelNumber][i].equals(bonus) && occurence!=1) {  
        this.x=(i%128)*8;
        this.y=(i/128)*16;
        this.occurence++;
      } else if(occurence==0) {
        this.x=2000;
        this.y=2000;
      } 
    }
  }
}