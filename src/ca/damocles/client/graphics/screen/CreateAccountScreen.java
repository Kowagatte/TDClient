package ca.damocles.client.graphics.screen;

import javax.swing.JLayeredPane;
import javax.swing.JLabel;
import javax.swing.ImageIcon;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Color;
import javax.swing.JTextField;

import ca.damocles.client.ClientState;
import ca.damocles.client.graphics.Client;

import javax.swing.JPasswordField;
import javax.swing.JButton;

public class CreateAccountScreen extends JLayeredPane{
	
	public CreateAccountScreen() {
		JLabel bg = new JLabel("");
		bg.setIcon(new ImageIcon(CreateAccountScreen.class.getResource("/sprites/login-screen.png")));
		bg.setBounds(0, 0, 800, 600);
		add(bg);
		
		JLabel lblEmail = new JLabel("Email:");
		setLayer(lblEmail, 1);
		lblEmail.setForeground(Color.LIGHT_GRAY);
		lblEmail.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblEmail.setBounds(290, 199, 220, 23);
		add(lblEmail);
		
		emailField = new JTextField();
		setLayer(emailField, 1);
		emailField.setColumns(20);
		emailField.setBounds(290, 225, 220, 28);
		add(emailField);
		
		JLabel lblUsername = new JLabel("Username:");
		setLayer(lblUsername, 1);
		lblUsername.setForeground(Color.LIGHT_GRAY);
		lblUsername.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblUsername.setBounds(290, 261, 220, 23);
		add(lblUsername);
		
		usernameField = new JTextField();
		setLayer(usernameField, 1);
		usernameField.setColumns(20);
		usernameField.setBounds(290, 287, 220, 28);
		add(usernameField);
		
		JLabel lblPassword = new JLabel("Password:");
		setLayer(lblPassword, 1);
		lblPassword.setForeground(Color.LIGHT_GRAY);
		lblPassword.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblPassword.setBounds(290, 323, 220, 23);
		add(lblPassword);
		
		pwdPassword = new JPasswordField();
		setLayer(pwdPassword, 1);
		pwdPassword.setBounds(290, 349, 220, 28);
		add(pwdPassword);
		
		JLabel lvlVerifyPass = new JLabel("Confirm Password:");
		setLayer(lvlVerifyPass, 1);
		lvlVerifyPass.setForeground(Color.LIGHT_GRAY);
		lvlVerifyPass.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lvlVerifyPass.setBounds(290, 385, 220, 23);
		add(lvlVerifyPass);
		
		verifyField = new JPasswordField();
		setLayer(verifyField, 1);
		verifyField.setBounds(290, 411, 220, 28);
		add(verifyField);
		
		JButton btnCreateAccount = new JButton("Create Account");
		btnCreateAccount.setRequestFocusEnabled(false);
		btnCreateAccount.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		btnCreateAccount.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//TODO
			}
		});
		setLayer(btnCreateAccount, 1);
		btnCreateAccount.setBounds(290, 450, 142, 33);
		add(btnCreateAccount);
		
		JButton btnBack = new JButton("Back");
		btnBack.setRequestFocusEnabled(false);
		btnBack.setFont(new Font("Comic Sans MS", Font.BOLD, 12));
		btnBack.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Client.getInstance().changeState(ClientState.LOGIN_SCREEN);
			}
		});
		setLayer(btnBack, 1);
		btnBack.setBounds(437, 450, 73, 33);
		add(btnBack);
		
		JLabel lblTextBox = new JLabel("New label");
		setLayer(lblTextBox, 1);
		lblTextBox.setIcon(new ImageIcon(CreateAccountScreen.class.getResource("/sprites/AccountTextField.png")));
		lblTextBox.setBounds(247, 181, 306, 325);
		add(lblTextBox);
	}

	/** Generated sVUID */
	private static final long serialVersionUID = 4587193327572802420L;
	private JTextField emailField;
	private JTextField usernameField;
	private JPasswordField pwdPassword;
	private JPasswordField verifyField;
}
