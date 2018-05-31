class BonusPoints extends Bonus {
  public boolean Points=false;
  public int nbPoints=0,nbPointsLvl=0;

  public void animation() {
    super.animation(powerupPoints,"BPoints");
  }
}