import javax.swing.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;


public class Hero extends JComponent{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int HP;
	private int x;
	private int y;
	private int vitesseX;
	private int vitesseY;
    JLabel imageLabel = new JLabel();
    private ImageIcon RagnarR;
	

	public Hero() {
		x=50;
		y=50;
		vitesseX=20;
		vitesseY=20;
		HP=3;
        this.setFocusable(true);
 
        RagnarR= new ImageIcon(this.getClass().getResource("RagnarWalk.gif"));

        this.setVisible(true);
 		    
		 this.addKeyListener(new KeyListener() {
			 public void keyPressed(KeyEvent e) {
				 int keyCode = e.getKeyCode();
				 switch(keyCode) {
				 case KeyEvent.VK_UP:
					 y-=vitesseY;
					 break;
				 case KeyEvent.VK_DOWN:
					 y+=vitesseY;
					 break;
				 case KeyEvent.VK_LEFT:
					 x-=vitesseX;
					 break;
				 case KeyEvent.VK_RIGHT:
					 x+=vitesseX;
					 
					 break;
				 }
				 System.out.println(x);
			     imageLabel.setBounds(x,y,32,32);
			     imageLabel.setIcon(RagnarR);
			     //this.add(imageLabel);
			 }
			 public void keyTyped(KeyEvent e) {}
			 public void keyReleased(KeyEvent e) {}
		 });
	}

/*	public int getX() {
		return(this.x);
		
	}
	public int getY() {
		return(this.y);
		
	}
	public void setX(int x) {
		this.x+=vitesseX;
	}
	public void setY(int y) {
		this.y+=vitesseY;
	}
	public int getVitesseX() {
		return(this.vitesseX);
	}
	public int getVitesseY() {
		return(this.vitesseY);
	}
	public void setVitesseX(int vitesseX) {
		this.vitesseX=vitesseX;
	}
	public void setVitesseY(int vitesseY) {
		this.vitesseY=vitesseY;
	}*/
}
