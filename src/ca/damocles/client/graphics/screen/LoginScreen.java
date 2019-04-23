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
import javax.swing.JTextPane;

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
		txtUsername.setBounds(290, 225, 220, 28);
		add(txtUsername);
		txtUsername.setColumns(20);
		
		passwordField = new JPasswordField();
		setLayer(passwordField, 1);
		passwordField.setBounds(290, 285, 220, 28);
		add(passwordField);
		
		JButton btnLogin = new JButton("Login");
		btnLogin.setFocusable(false);
		btnLogin.setFont(new Font("Comic Sans MS", Font.BOLD, 15));
		btnLogin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//TODO SEND LOGIN INFORMATION
			}
		});
		setLayer(btnLogin, 1);
		btnLogin.setBounds(290, 332, 220, 28);
		add(btnLogin);
		
		JLabel lblUsername = new JLabel("Username:");
		lblUsername.setForeground(Color.LIGHT_GRAY);
		lblUsername.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		setLayer(lblUsername, 1);
		lblUsername.setBounds(290, 199, 220, 23);
		add(lblUsername);
		
		JLabel lblNewLabel = new JLabel("Password:");
		lblNewLabel.setFont(new Font("Comic Sans MS", Font.BOLD, 18));
		lblNewLabel.setForeground(Color.LIGHT_GRAY);
		setLayer(lblNewLabel, 1);
		lblNewLabel.setBounds(290, 261, 220, 23);
		add(lblNewLabel);
		
		JTextPane forgotpassword = new JTextPane();
		forgotpassword.setOpaque(false);
		forgotpassword.setEditable(false);
		setLayer(forgotpassword, 1);
		forgotpassword.setBackground(Color.BLACK);
		forgotpassword.setForeground(Color.LIGHT_GRAY);
		forgotpassword.setFont(new Font("Comic Sans MS", Font.PLAIN, 11));
		forgotpassword.setText("Forgot your password?");
		forgotpassword.setBounds(290, 370, 131, 20);
		add(forgotpassword);
		
		JButton btnForgotpassbutton = new JButton("Click Here");
		btnForgotpassbutton.setBorderPainted(false);
		btnForgotpassbutton.setRequestFocusEnabled(false);
		btnForgotpassbutton.setOpaque(false);
		btnForgotpassbutton.setFocusable(false);
		btnForgotpassbutton.setFocusTraversalKeysEnabled(false);
		btnForgotpassbutton.setFocusPainted(false);
		btnForgotpassbutton.setRolloverEnabled(false);
		btnForgotpassbutton.setForeground(Color.WHITE);
		btnForgotpassbutton.setContentAreaFilled(false);
		btnForgotpassbutton.setFont(new Font("Comic Sans MS", Font.BOLD, 11));
		btnForgotpassbutton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//TODO Forgot Password
			}
		});
		setLayer(btnForgotpassbutton, 1);
		btnForgotpassbutton.setBounds(410, 371, 89, 23);
		add(btnForgotpassbutton);
		
		JTextPane txtpnCreateaccount = new JTextPane();
		txtpnCreateaccount.setFont(new Font("Comic Sans MS", Font.PLAIN, 11));
		txtpnCreateaccount.setForeground(Color.LIGHT_GRAY);
		txtpnCreateaccount.setOpaque(false);
		txtpnCreateaccount.setEditable(false);
		setLayer(txtpnCreateaccount, 1);
		txtpnCreateaccount.setText("Don't have an account?");
		txtpnCreateaccount.setBounds(290, 401, 156, 20);
		add(txtpnCreateaccount);
		
		JButton btnCreateaccbutton = new JButton("Click Here");
		btnCreateaccbutton.setBorderPainted(false);
		btnCreateaccbutton.setRequestFocusEnabled(false);
		btnCreateaccbutton.setOpaque(false);
		btnCreateaccbutton.setFocusable(false);
		btnCreateaccbutton.setFocusTraversalKeysEnabled(false);
		btnCreateaccbutton.setFocusPainted(false);
		btnCreateaccbutton.setRolloverEnabled(false);
		btnCreateaccbutton.setForeground(Color.WHITE);
		btnCreateaccbutton.setFont(new Font("Comic Sans MS", Font.BOLD, 11));
		btnCreateaccbutton.setContentAreaFilled(false);
		btnCreateaccbutton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//TODO Create account
			}
		});
		setLayer(btnCreateaccbutton, 1);
		btnCreateaccbutton.setBounds(410, 401, 89, 23);
		add(btnCreateaccbutton);
	}
}
