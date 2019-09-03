package ca.damocles.client.graphics.screen;

import javax.swing.JLayeredPane;

public interface Screen {
	
	public default JLayeredPane getPane() {
		return (JLayeredPane) this;
	}
	
}
