class BonusDash extends Bonus {
  public boolean dash=false, trigDash=false;

  public void animation() {
    super.animation(powerupR, "BDash");
  }
}