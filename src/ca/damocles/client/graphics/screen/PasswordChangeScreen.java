package ca.damocles.client.graphics.screen;

import javax.swing.JLayeredPane;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.awt.Color;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import javax.swing.JButton;

public class PasswordChangeScreen extends JLayeredPane{
	
	/** SVUID */
	private static final long serialVersionUID = 7698044961435756069L;
	private JTextField txtCode;
	private JTextField txtUsername;
	private JPasswordField passwordField;
	private JPasswordField confirmPasswordField;

	public PasswordChangeScreen() {
		
		JLabel lblBG = new JLabel("");
		lblBG.setIcon(new ImageIcon(PasswordChangeScreen.class.getResource("/sprites/login-screen.png")));
		lblBG.setBounds(0, 0, 800, 600);
		add(lblBG);
		
		JLabel lblCode = new JLabel("Code:");
		setLayer(lblCode, 1);
		lblCode.setForeground(Color.LIGHT_GRAY);
		lblCode.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblCode.setBounds(290, 199, 220, 23);
		add(lblCode);
		
		txtCode = new JTextField();
		setLayer(txtCode, 1);
		txtCode.setColumns(20);
		txtCode.setBounds(290, 225, 220, 28);
		add(txtCode);
		
		JLabel lblUsername = new JLabel("Username:");
		setLayer(lblUsername, 1);
		lblUsername.setForeground(Color.LIGHT_GRAY);
		lblUsername.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblUsername.setBounds(290, 261, 220, 23);
		add(lblUsername);
		
		txtUsername = new JTextField();
		setLayer(txtUsername, 1);
		txtUsername.setColumns(20);
		txtUsername.setBounds(290, 287, 220, 28);
		add(txtUsername);
		
		JLabel lblPassword = new JLabel("Password:");
		setLayer(lblPassword, 1);
		lblPassword.setForeground(Color.LIGHT_GRAY);
		lblPassword.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblPassword.setBounds(290, 323, 220, 23);
		add(lblPassword);
		
		passwordField = new JPasswordField();
		setLayer(passwordField, 1);
		passwordField.setBounds(290, 349, 220, 28);
		add(passwordField);
		
		JLabel lblConfirmPass = new JLabel("Confirm Password:");
		setLayer(lblConfirmPass, 1);
		lblConfirmPass.setForeground(Color.LIGHT_GRAY);
		lblConfirmPass.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblConfirmPass.setBounds(290, 385, 220, 23);
		add(lblConfirmPass);
		
		confirmPasswordField = new JPasswordField();
		setLayer(confirmPasswordField, 1);
		confirmPasswordField.setBounds(290, 411, 220, 28);
		add(confirmPasswordField);
		
		JButton btnChangePass = new JButton("Change Password");
		setLayer(btnChangePass, 1);
		btnChangePass.setRequestFocusEnabled(false);
		btnChangePass.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		btnChangePass.setBounds(290, 450, 142, 33);
		add(btnChangePass);
		
		JButton btnBack = new JButton("Back");
		setLayer(btnBack, 1);
		btnBack.setRequestFocusEnabled(false);
		btnBack.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		btnBack.setBounds(437, 450, 73, 33);
		add(btnBack);
		
		JLabel lblTextbox = new JLabel("TextBox");
		setLayer(lblTextbox, 1);
		lblTextbox.setIcon(new ImageIcon(PasswordChangeScreen.class.getResource("/sprites/AccountTextField.png")));
		lblTextbox.setBounds(247, 181, 306, 325);
		add(lblTextbox);
	}

}
