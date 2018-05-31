class BonusDoubleJump extends Bonus {
  public boolean doubleJump=false, trigDoubleJump=false, doubleJumpOn=false;
  public void position(){
   super.position("BJump");
  }
  public void animation() {
    int offset=0;
    currentFrame=(currentFrame+1) % 15;
    image(powerupG[(currentFrame+offset)%15], x, y);
    offset+=1;
    image(powerupG[(currentFrame+offset)%15], x, y);
    offset+=1;
  }
}