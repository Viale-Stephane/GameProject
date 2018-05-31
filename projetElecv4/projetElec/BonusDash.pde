class BonusDash extends Bonus{
  public boolean dash=false,trigDash=false;
  public void position(){
    super.position("BDash");
  }

  public void animation() {
    int offset=0;
    currentFrame=(currentFrame+1) % 15;
    image(powerupR[(currentFrame+offset)%15], x, y);
    offset+=1;
    image(powerupR[(currentFrame+offset)%15], x, y);
    offset+=1;
  }
}