class Bonus{
  protected int x, y;

  public int nbElem(String bonus) {
    int nbElems=0;
    for (int i=0; i<128*38; i++) {
      if (hitboxLvl[levelNumber][i].equals(bonus)) {
        nbElems++;
      }
    }
    return nbElems;
  }
  public int[] position(String bonus) {
    int []tableau=new int[nbElem(bonus)*2];
    //println(tableau.length);
    int j=0;
    for (int i=0; i<128*38; i++) {
      if (hitboxLvl[levelNumber][i].equals(bonus)) {  
        tableau[j]=(i%128)*8;
        tableau[j+1]=(i/128)*16;
        j+=2;
      }
    }
    return tableau;
  }
  public void animation(Gif anime, String bonus) {
    for (int i=0; i<position(bonus).length; i+=2) {
      image(anime, position(bonus)[i], position(bonus)[i+1]);
    }
  }
}
