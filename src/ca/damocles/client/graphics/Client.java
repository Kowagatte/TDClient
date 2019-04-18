package ca.damocles.client.graphics;

import java.io.IOException;
import java.net.Socket;

import javax.swing.JFrame;
import ca.damocles.Packet;
import ca.damocles.Packet.PacketEnum;
import ca.damocles.client.ClientState;
import ca.damocles.client.InputHandler;
import ca.damocles.client.graphics.screen.LoginScreen;
import ca.damocles.ServerConnection;
import ca.damocles.SplashText;
import ca.damocles.utils.ResourceUtil;
import java.awt.BorderLayout;

public class Client extends JFrame implements Runnable{
	
	
	public static Client instance;
	public static Client getInstance() {
		return instance;
	}
	
	/* SERIAL VERSION UID */
	private static final long serialVersionUID = 3550596793369075558L;
	public InputHandler inputHandler;
	public ServerConnection connection;
	public boolean connected = false;
	public Thread thread;
	
	public ClientState state;
	
	private LoginScreen loginScreen;
	
	public Client(String toolBarMessage) {
		super(toolBarMessage);
		setIconImage(new ResourceUtil().getImage("/sprites", "Icon"));
		setSize(804, 627);
		setLocationRelativeTo(null);
		setResizable(false);
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		
		this.loginScreen = new LoginScreen();
		getContentPane().add(loginScreen, BorderLayout.CENTER);
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
		
		try {
			Socket clientSocket = new Socket("localhost", 8888);
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
		connection.send(new Packet(PacketEnum.CLOSE_PACKET));
		try {
			thread.interrupt();
		}catch(SecurityException e) {e.printStackTrace();}
		 connection.closeConnection();
		 System.exit(0);
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
				//repaint();
				//if(InputHandler.keys[KeyEvent.VK_SPACE])
				delta--;
			}
		}
	}
	
	public static void main(String[] args) {
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
            	instance = new Client("TopDownShooter: " + new SplashText().get());
            }
        });
	}	
}
