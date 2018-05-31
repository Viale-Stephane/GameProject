class BonusDoubleJump extends Bonus {
  public boolean doubleJump=false, trigDoubleJump=false, doubleJumpOn=false;
  public void animation() {
    super.animation(powerupG,"BJump");
  }
}