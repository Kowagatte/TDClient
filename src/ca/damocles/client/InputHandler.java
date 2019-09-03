package ca.damocles.client;

import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import ca.damocles.Movements;

public class InputHandler implements KeyListener, FocusListener{
	

	public static boolean[] keys = new boolean[65536];
	
	public void keyPressed(KeyEvent e) {
		int code = e.getKeyCode(); 
		if (code>0 && code<keys.length) {
			keys[code] = true;
		}
	}

	public void keyReleased(KeyEvent e) {
		int code = e.getKeyCode(); 
		if (code>0 && code<keys.length) {
			keys[code] = false;
		}
	}
	
	public static Movements input() {
		boolean up = false, down = false, left = false, right = false;
		if(keys[KeyEvent.VK_W]) {
			up = true;
		}
		if(keys[KeyEvent.VK_S]) {
			down = true;
		}
		if(keys[KeyEvent.VK_D]) {
			right = true;
		}
		if(keys[KeyEvent.VK_A]) {
			left = true;
		}
		if(up && left) {
			return Movements.UP_LEFT;
		}else if(up && right) {
			return Movements.UP_RIGHT;
		}else if(down && left) {
			return Movements.DOWN_LEFT;
		}else if(down && right) {
			return Movements.DOWN_RIGHT;
		}else if(right && left) {
			return Movements.NONE;
		}else if(up && down) {
			return Movements.NONE;
		}else if(left) {
			return Movements.LEFT;
		}else if(right) {
			return Movements.RIGHT;
		}else if(up) {
			return Movements.UP;
		}else if(down) {
			return Movements.DOWN;
		}else {
			return Movements.NONE;
		}
	}

	public void keyTyped(KeyEvent arg0) {
	}

	@Override
	public void focusGained(FocusEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void focusLost(FocusEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	
}
