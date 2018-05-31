class BonusNoClip extends Bonus {
  public boolean noClip=false;
  public void position(){
    super.position("BnoClip");
  }
  public void animation() {
    int offset=0;
    currentFrame=(currentFrame+1) % 15;
    image(powerupN[(currentFrame+offset)%15], x, y);
    offset+=1;
    image(powerupN[(currentFrame+offset)%15], x, y);
    offset+=1;
  }
}