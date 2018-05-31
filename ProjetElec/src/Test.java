public class Test{
	public static void main(String[] args) {
		new Fenetre();

		
	}
}
		
	

/*



public class Test extends Frame{
        static final long serialVersionUID = 1l; // Mauvaise facon mais j'aime pas les Warnings
        private TextField tf;
        
        public Test(){
        		this.setSize(500,500);
                this.setLayout(new GridLayout(1,1)); // Layout
                this.tf = new TextField(); // Un textfield
                this.tf.setEditable(false); // non editable
                this.tf.addKeyListener(new RecepteurClavier()); // auquel on rajoute un recepteur clavier
                this.add(this.tf); // Ajout de ce textfield a la fenetre
                this.setVisible(true); // affichage
        }
        public TextField getTf(){return this.tf;};

        public static void main(String[] args){ new Test(); }
        
        public class RecepteurClavier implements KeyListener{
                *//**
                 * Touche enfoncée
                 * @param event
                 *//*
                public void keyPressed(KeyEvent event){
                        int source = event.getKeyCode();
                        Test testActu = Test.this;
                        if(source==KeyEvent.VK_UP) {
                        	System.out.println("test");
                        	Hero hero=new Hero(50,50);
                        	hero.paintHero(50, 50);
                               // testActu.getTf().setText("Haut");
                        }else if(source==KeyEvent.VK_DOWN) {
                                testActu.getTf().setText("Bas");
                		}else if(source==KeyEvent.VK_RIGHT) {
                                testActu.getTf().setText("Droite");
        				}else if(source==KeyEvent.VK_LEFT) {
                                testActu.getTf().setText("Gauche");
						} 
				}
                
                *//**
                 * Touche relachée
                 * @param event
                 *//*
                 public void keyReleased(KeyEvent event){}
                 
                 *//**
                  * Cractere tappé
                  * @param event
                  *//*
                 public void keyTyped(KeyEvent event){}
                
        }

}*/