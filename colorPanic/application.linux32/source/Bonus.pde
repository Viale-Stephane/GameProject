class Bonus{//classe qui sera hérité pour chacun des bonus
  protected int x, y;

  public int nbElem(String bonus) {//compte le nombre de cases où il y a un bonus dans le niveau courant
    int nbElems=0;
    for (int i=0; i<128*38; i++) {
      if (hitboxLvl[levelNumber][i].equals(bonus)) {
        nbElems++;
      }
    }
    return nbElems;
  }
  public int[] position(String bonus) { //récupère la position en x, si le numéro de la case est pair, en y, si le numéro de la case est impair
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
  public void animation(Gif anime, String bonus) {// positionne l'image du bonus en x,y 
    for (int i=0; i<position(bonus).length; i+=2) {
      image(anime, position(bonus)[i], position(bonus)[i+1]);
    }
  }
}
