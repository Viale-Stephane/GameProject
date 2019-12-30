class BonusPoints extends Bonus {
  public boolean Points=false;
  public int nbPoints=0,nbPointsLvl=0;

  public void animation() {//positionne l'animation du bonus de points
    super.animation(powerupPoints,"BPoints");
  }
}