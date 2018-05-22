class BonusTP extends Bonus {
  public boolean bonusTP=false,trigTP=false,canTP=false;;

  public void animation() {
    super.animation(powerupP,"BTP");
  }
}