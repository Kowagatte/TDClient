package ca.damocles;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import javax.net.ssl.SSLSocket;

import ca.damocles.Packet.PacketEnum;
import ca.damocles.client.graphics.Client;
import ca.damocles.utils.AccountLoginStatus;

public class ServerConnection extends Thread{

	protected SSLSocket socket;
	private BufferedWriter buffWriter;
	private BufferedReader buffReader;

	public ServerConnection(SSLSocket clientSocket) {
        this.socket = clientSocket;
        try {
        	clientSocket.startHandshake();
        	buffWriter = new BufferedWriter( new OutputStreamWriter( socket.getOutputStream() ) );
        	buffReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        	start();
        } catch (IOException e) {
            return;
        }
    }
    
    public void closeConnection() {
    	try {
    		socket.close();
    		buffWriter.close();
    		buffReader.close();
    		interrupt();
    	}catch(IOException e) {
    		interrupt();
    	}
    }
    
    public void send(Packet packet) {
    	try {
			buffWriter.write(packet.sendPacket());
	    	buffWriter.newLine();
	    	buffWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    public void run() {
    	Packet packet = null;
    	while(socket.isConnected()) {
    		try {
    			String line = buffReader.readLine();
    			System.out.println(line);
        		packet = new Packet(line);
        		
        		if(packet.getEnum() == PacketEnum.INFO) {
        			Client.getInstance().changeText(packet.getArgs()[0]);
        		}
        		
        		if(packet.getEnum() == PacketEnum.LOGIN_STATUS) {
        			if(Byte.valueOf(packet.getArgs()[0]) != ((byte)1)) {
        				Client.getInstance().changeText(AccountLoginStatus.valueOf(Byte.valueOf(packet.getArgs()[0])).getDescription());
        			}
        		}
        		
        		if( (packet.getEnum() == PacketEnum.DENIED) || (packet.getEnum() == PacketEnum.CLOSE) ) {
        			closeConnection();
        			System.exit(0);
        		}
    		}catch(IOException e) { interrupt(); }
    	}
    }
}
