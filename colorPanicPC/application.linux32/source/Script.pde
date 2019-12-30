class Script {

  public void bashLoad(String n) {
    try { 
      Process p = new ProcessBuilder(n, "").start();
    } 
    catch(Exception e) {
      println(e);
    }
    println("ouvre le fichier :" + n);
  }
  
  
  public void endGame() {
    String os=System.getProperty("os.name");
    if (os.equals("raspberrypi")) {
      bashLoad("futur emplacement du script d'extinction de la machine ");
    } else  {
      exit();
    }
  }
  
  public void saveload(Boolean s){
    if (s){
      bashLoad("data/Scripts/load.sh");
    } else {
      bashLoad("data/Scripts/save.sh");
    }
  }
    
}