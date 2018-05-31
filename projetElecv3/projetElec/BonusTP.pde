class BonusTP extends Bonus {
  public boolean bonusTP=false,trigTP=false,bonusTPOn=false;
  public void position(){
    super.position("BTP");
  }
  public void animation() {
    int offset=0;
    currentFrame=(currentFrame+1) % 15;
    image(powerupP[(currentFrame+offset)%15], x, y);
    offset+=1;
    image(powerupP[(currentFrame+offset)%15], x, y);
    offset+=1;
  }
}