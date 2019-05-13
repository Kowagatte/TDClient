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

import ca.damocles.Packet;
import ca.damocles.Packet.PacketEnum;
import ca.damocles.client.ClientState;
import ca.damocles.client.graphics.Client;
import javax.swing.JTextPane;

public class LoginScreen extends JLayeredPane{

	/**
	 * Generated SVUID
	 */
	private static final long serialVersionUID = -7733234255246196544L;
	
	private JTextField txtUsername;
	private JPasswordField passwordField;
	public String text = "";
	
	public LoginScreen() {
		
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
				if((!txtUsername.getText().equalsIgnoreCase("")) && (!String.valueOf(passwordField.getPassword()).equalsIgnoreCase(""))) {
					Client.getInstance().connection.send(new Packet(PacketEnum.LOGIN_CREDENTIALS, new String[] {txtUsername.getText(), String.valueOf(passwordField.getPassword())}));
				}
			}
		});
		setLayer(btnLogin, 1);
		btnLogin.setBounds(290, 357, 220, 28);
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
		forgotpassword.setBounds(290, 395, 131, 20);
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
		btnForgotpassbutton.setBounds(410, 396, 89, 23);
		add(btnForgotpassbutton);
		
		JTextPane txtpnCreateaccount = new JTextPane();
		txtpnCreateaccount.setFont(new Font("Comic Sans MS", Font.PLAIN, 11));
		txtpnCreateaccount.setForeground(Color.LIGHT_GRAY);
		txtpnCreateaccount.setOpaque(false);
		txtpnCreateaccount.setEditable(false);
		setLayer(txtpnCreateaccount, 1);
		txtpnCreateaccount.setText("Don't have an account?");
		txtpnCreateaccount.setBounds(290, 426, 156, 20);
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
				Client.getInstance().changeState(ClientState.CREATE_ACCOUNT);
			}
		});
		setLayer(btnCreateaccbutton, 1);
		btnCreateaccbutton.setBounds(410, 426, 89, 23);
		add(btnCreateaccbutton);
		
		JLabel lblBg = new JLabel("bg");
		setLayer(lblBg, -1);
		lblBg.setIcon(new ImageIcon(LoginScreen.class.getResource("/sprites/login-screen.png")));
		lblBg.setBounds(0, 0, 800, 600);
		add(lblBg);
		
		JLabel lblTextBox = new JLabel("Box");
		lblTextBox.setIcon(new ImageIcon(LoginScreen.class.getResource("/sprites/GenericTextField.png")));
		lblTextBox.setBounds(247, 181, 306, 287);
		add(lblTextBox);
		
		JLabel lblTxt = new JLabel("");
		lblTxt.setFont(new Font("Tahoma", Font.PLAIN, 10));
		lblTxt.setName("field");
		lblTxt.setText(text);
		setLayer(lblTxt, 1);
		lblTxt.setForeground(Color.WHITE);
		lblTxt.setBounds(290, 317, 220, 37);
		add(lblTxt);
	}
}
