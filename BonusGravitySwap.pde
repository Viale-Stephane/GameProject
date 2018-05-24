class BonusGravitySwap extends Bonus {
  public boolean GSwap=false,trigGSwap=false,timeActivationGSwap=false;
  
  public void animation() {//positionne l'animation du bonus d'inversion de gravité
    super.animation(powerupV,"BGSwap");
  }
}
