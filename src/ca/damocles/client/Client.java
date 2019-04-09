package ca.damocles.client;

import java.io.IOException;
import java.net.Socket;

import javax.swing.JFrame;
import javax.swing.JPanel;

import ca.damocles.Packet;
import ca.damocles.Packet.PacketEnum;
import ca.damocles.ServerConnection;
import ca.damocles.SplashText;
import ca.damocles.utils.ResourceUtil;

public class Client extends JPanel implements Runnable{
	
	/* SERIAL VERSION UID */
	private static final long serialVersionUID = 3550596793369075558L;
	private final int WIDTH = 29, HEIGHT = 25;
	private final int SCALE = 32;
	public InputHandler inputHandler;
	public ServerConnection connection;
	public boolean connected = false;
	public Thread thread;
	
	public Client(String toolBarMessage) {
		
		JFrame frame = new JFrame(toolBarMessage);
		frame.setIconImage(new ResourceUtil().getImage("", "Icon"));
		frame.setSize(WIDTH*SCALE, HEIGHT*SCALE);
		frame.setLocationRelativeTo(null);
		frame.setResizable(false);
		frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(new java.awt.event.WindowAdapter() {
            @Override
            public void windowClosing(java.awt.event.WindowEvent windowEvent) {
            	stop();
            }
        });
		frame.getContentPane().add(this);
		frame.setVisible(true);
        
		inputHandler = new InputHandler();

		addKeyListener(inputHandler);
		addFocusListener(inputHandler);
		
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
				requestFocus();
				repaint();
				//if(InputHandler.keys[KeyEvent.VK_SPACE])
				delta--;
			}
		}
	}
	
	public static void main(String[] args) {
		new Client("TopDownShooter: " + new SplashText().get());
	}	
	
}
