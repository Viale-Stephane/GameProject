class BonusDoubleJump extends Bonus {
  public boolean doubleJump=false, trigDoubleJump=false, doubleJumpOn=false;
  public void animation() {//positionne l'animation de la pièce de bonus double jump
    super.animation(powerupG,"BJump");
  }
}
