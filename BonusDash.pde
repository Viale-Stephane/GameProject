class BonusDash extends Bonus {
  public boolean dash=false, trigDash=false,canDash=false;

  public void animation() {//positionne l'animation de la pièce de bonus dash
    super.animation(powerupR, "BDash");
  }
}
