class BonusGravitySwap extends Bonus {
  public boolean gravitySwap=false;
  public void position(){
    super.position("BGravitySwap");
  }
  public void animation() {
    int offset=0;
    currentFrame=(currentFrame+1) % 15;
    image(powerupDB[(currentFrame+offset)%15], x, y);
    offset+=1;
    image(powerupDB[(currentFrame+offset)%15], x, y);
    offset+=1;
  }
}