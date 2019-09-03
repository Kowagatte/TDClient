package ca.damocles.client.graphics;

import java.io.IOException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JLayeredPane;

import ca.damocles.Packet;
import ca.damocles.Packet.PacketEnum;
import ca.damocles.client.InputHandler;
import ca.damocles.client.graphics.screen.LoginScreen;
import ca.damocles.client.graphics.screen.Screen;
import ca.damocles.ServerConnection;
import ca.damocles.SplashText;
import ca.damocles.utils.ResourceUtil;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Component;

public class Client extends JFrame implements Runnable{
	
	public static Client instance;
	public static Client getInstance() {
		return instance;
	}
	
	/* SERIAL VERSION UID */
	private static final long serialVersionUID = 3550596793369075558L;
	public InputHandler inputHandler;
	private final String SERVER_ADDRESS = "localhost";
	public ServerConnection connection;
	public boolean connected = false;
	public Thread thread;
	
	public Screen currentScreen;
	
	public Client(String toolBarMessage) {
		super(toolBarMessage);
		setIconImage(new ResourceUtil().getImage("/sprites", "Icon"));
		setSize(804, 627);
		setLocationRelativeTo(null);
		setResizable(false);
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		setVisible(true);
		addWindowListener(new java.awt.event.WindowAdapter() {
            @Override
            public void windowClosing(java.awt.event.WindowEvent windowEvent) {
            	stop();
            }
        });
		inputHandler = new InputHandler();
		//addKeyListener(inputHandler);
		//addFocusListener(inputHandler);
		connectToServer();
		changeScreen(new LoginScreen());
	}
	
	public void connectToServer() {
		try {
			SSLSocket clientSocket = (SSLSocket) SSLSocketFactory.getDefault().createSocket(SERVER_ADDRESS, 8888);
			if(clientSocket.isConnected()) {
				connection = new ServerConnection(clientSocket);
				start();
			}
		}catch (IOException e) { System.exit(0); }
	}
	
	public synchronized void start() {
		if (connected) return;
		connected = true;
		thread = new Thread(this);
		thread.start();
	}
	
	public void stop() {
		if(!connected) return;
		connected = false;
		connection.send(new Packet(PacketEnum.CLOSE));
		try {
			thread.interrupt();
		}catch(SecurityException e) {e.printStackTrace();}
		 connection.closeConnection();
		 System.exit(0);
	}
	
	public void changeScreen(Screen newScreen) {
		currentScreen = newScreen;
		getContentPane().removeAll();
		getContentPane().add(newScreen.getPane(), BorderLayout.CENTER);
		validate();
	}
	
	public void changeText(String text) {
		for(Component comp : ((JLayeredPane)getContentPane().getComponents()[0]).getComponents()) {
			if(comp.getName() != null) {
				if(comp.getName().equalsIgnoreCase("field")) {
					((JLabel)comp).setForeground(Color.RED);
					((JLabel) comp).setText(text);
					comp.repaint();
				}
			}
		}
	}

	@Override
	public void run() {
		long lastTime = System.nanoTime();
		double secondsPerTicks = 1000000000 / 60;
		double delta = 0;
		while(connected) {
			long now = System.nanoTime();
			delta += (now - lastTime) / secondsPerTicks;
			lastTime = now;
			if(delta >= 1) {
				repaint();
				//if(InputHandler.keys[KeyEvent.VK_SPACE])
				delta--;
			}
		}
	}
	
	public static void main(String[] args) {
		System.setProperty("javax.net.ssl.trustStore", "clienttruststore.pfx");
		System.setProperty("javax.net.ssl.trustStorePassword", "oPkiCv43");
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
            	instance = new Client("TopDownShooter: " + new SplashText().get());
            }
        });
	}

}
