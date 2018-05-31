class BonusTP extends Bonus {
  public boolean bonusTP=false,trigTP=false,canTP=false;;

  public void animation() {//positionne l'animation du bonus de téléportation
    super.animation(powerupP,"BTP");
  }
}
