package ca.damocles.client.graphics.screen;

import javax.swing.JLayeredPane;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.awt.Color;
import javax.swing.JTextField;
import javax.swing.JButton;

public class PasswordRequestScreen extends JLayeredPane implements Screen{
	public PasswordRequestScreen() {
		
		JLabel lblBg = new JLabel("bg");
		lblBg.setIcon(new ImageIcon(PasswordRequestScreen.class.getResource("/sprites/login-screen.png")));
		lblBg.setBounds(0, 0, 800, 600);
		add(lblBg);
		
		textField = new JTextField();
		setLayer(textField, 1);
		textField.setBounds(290, 255, 220, 28);
		add(textField);
		textField.setColumns(10);
		
		JLabel lblEmail = new JLabel("Email:");
		lblEmail.setForeground(Color.LIGHT_GRAY);
		lblEmail.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		setLayer(lblEmail, 1);
		lblEmail.setBounds(290, 229, 220, 23);
		add(lblEmail);
		
		JButton btnRequest = new JButton("Request Password Change Code");
		btnRequest.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		setLayer(btnRequest, 1);
		btnRequest.setBounds(290, 310, 220, 28);
		add(btnRequest);
		
		JButton btnBack = new JButton("Back");
		setLayer(btnBack, 1);
		btnBack.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		btnBack.setBounds(290, 362, 220, 28);
		add(btnBack);
		
		JLabel lblNewLabel = new JLabel("New label");
		lblNewLabel.setIcon(new ImageIcon(PasswordRequestScreen.class.getResource("/sprites/GenericTextField.png")));
		setLayer(lblNewLabel, 1);
		lblNewLabel.setBounds(247, 181, 306, 287);
		add(lblNewLabel);
	}

	/** SVUID */
	private static final long serialVersionUID = 7103999179702883309L;
	private JTextField textField;
}
