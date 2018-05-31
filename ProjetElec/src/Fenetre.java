import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import java.awt.*;
 
public class Fenetre extends JFrame {
	public JPanel contentPane;
	public JPanel panelCentre=new JPanel();
	public JLabel hud=new JLabel("HUD");
	
  /**
	 * 
	 */
	private static final long serialVersionUID = 8164118974463460991L;

public Fenetre(){
	try {
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contentPane=(JPanel) getContentPane();
		contentPane.setLayout(new BorderLayout());
		setTitle("Viking's Game");
		setSize(new Dimension(800,400));
		contentPane.add(hud,BorderLayout.SOUTH);
		panelCentre.setLayout(null);
		panelCentre.setBackground(Color.BLUE);
		panelCentre.add(new Hero()); 
		contentPane.add(panelCentre,BorderLayout.CENTER);
		this.setLocation(1000, 0);
		this.setVisible(true);
		} catch(Exception e) {
			e.printStackTrace();
		}
  	}
public void affichage() {


	}	
}