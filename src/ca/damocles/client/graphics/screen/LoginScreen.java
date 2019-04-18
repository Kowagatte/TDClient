package ca.damocles.client.graphics.screen;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import ca.damocles.utils.ResourceUtil;

public class LoginScreen extends JLayeredPane{

	/**
	 * Generated SVUID
	 */
	private static final long serialVersionUID = -7733234255246196544L;
	
	private JTextField txtUsername;
	private JPasswordField passwordField;
	
	public LoginScreen() {
		JLabel background = new JLabel("");
		background.setIcon(new ImageIcon(new ResourceUtil().getImage("/sprites", "login-screen")));
		background.setBounds(0, 0, 800, 600);
		add(background);
		
		txtUsername = new JTextField();
		setLayer(txtUsername, 1);
		txtUsername.setBounds(290, 238, 220, 28);
		add(txtUsername);
		txtUsername.setColumns(20);
		
		passwordField = new JPasswordField();
		setLayer(passwordField, 1);
		passwordField.setBounds(290, 301, 220, 28);
		add(passwordField);
		
		JButton btnLogin = new JButton("Login");
		btnLogin.setFont(new Font("Comic Sans MS", Font.BOLD, 15));
		btnLogin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		setLayer(btnLogin, 1);
		btnLogin.setBounds(293, 347, 95, 34);
		add(btnLogin);
		
		JButton btnCreateAccount = new JButton("Create Account");
		btnCreateAccount.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnCreateAccount.setFont(new Font("Comic Sans MS", Font.BOLD, 11));
		setLayer(btnCreateAccount, 1);
		btnCreateAccount.setBounds(391, 347, 122, 34);
		add(btnCreateAccount);
		
		JLabel lblUsername = new JLabel("Username:");
		lblUsername.setForeground(Color.LIGHT_GRAY);
		lblUsername.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		setLayer(lblUsername, 1);
		lblUsername.setBounds(290, 210, 220, 23);
		add(lblUsername);
		
		JLabel lblNewLabel = new JLabel("Password:");
		lblNewLabel.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblNewLabel.setForeground(Color.LIGHT_GRAY);
		setLayer(lblNewLabel, 1);
		lblNewLabel.setBounds(290, 272, 220, 23);
		add(lblNewLabel);
	}
	
}
