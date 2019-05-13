package ca.damocles.client.graphics.screen;

import javax.swing.JLayeredPane;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.Font;

public class PasswordMenuScreen extends JLayeredPane{
	
	/** SVUID*/
	private static final long serialVersionUID = -7717442160602564642L;

	public PasswordMenuScreen() {
		
		JLabel lblBg = new JLabel("bg");
		lblBg.setIcon(new ImageIcon(PasswordMenuScreen.class.getResource("/sprites/login-screen.png")));
		lblBg.setBounds(0, 0, 800, 600);
		add(lblBg);
		
		JButton btnRequestPassword = new JButton("Request Password Change");
		btnRequestPassword.setFocusPainted(false);
		btnRequestPassword.setOpaque(false);
		btnRequestPassword.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		setLayer(btnRequestPassword, 1);
		btnRequestPassword.setBounds(290, 225, 220, 46);
		add(btnRequestPassword);
		
		JButton btnChangePassword = new JButton("Change Password");
		btnChangePassword.setOpaque(false);
		btnChangePassword.setFocusPainted(false);
		btnChangePassword.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		setLayer(btnChangePassword, 1);
		btnChangePassword.setBounds(290, 303, 220, 46);
		add(btnChangePassword);
		
		JButton btnBack = new JButton("Back");
		btnBack.setFocusPainted(false);
		btnBack.setOpaque(false);
		btnBack.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		setLayer(btnBack, 1);
		btnBack.setBounds(290, 381, 220, 28);
		add(btnBack);
		
		JLabel lblTextbox = new JLabel("TextBox");
		setLayer(lblTextbox, 1);
		lblTextbox.setIcon(new ImageIcon(PasswordMenuScreen.class.getResource("/sprites/GenericTextField.png")));
		lblTextbox.setBounds(247, 181, 306, 287);
		add(lblTextbox);
	}
}
