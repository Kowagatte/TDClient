package ca.damocles;

public enum Movements{
	UP(0, "Up"),
	UP_LEFT(1, "UpLeft"),
	UP_RIGHT(2, "UpRight"),
	LEFT(3, "Left"),
	RIGHT(4, "Right"),
	DOWN(5, "Down"),
	DOWN_LEFT(6, "DownLeft"),
	DOWN_RIGHT(7, "DownRight"),
	NONE(8, "None");
	private int i;
	private String name;
	Movements(int i, String name){
		this.i = i;
		this.name = name;
	}
	public int getInt() {
		return this.i;
	}
	public String getName() {
		return this.name;
	}
}