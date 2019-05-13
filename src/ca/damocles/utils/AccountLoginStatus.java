package ca.damocles.utils;

public enum AccountLoginStatus {
	ACCOUNT_DOES_NOT_EXIST("An account with that username does not exist.", (byte) 0),
	SUCCESS("You have been successfully logged-in.", (byte) 1),
	WRONG_PASSWORD("Incorrect password.", (byte) 2);
	private String description;
	private byte id;
	AccountLoginStatus(String description, byte id) { this.description = description; this.id = id; }
	public String getDescription() { return this.description; }
	public byte getID() { return this.id; }
	public static AccountLoginStatus valueOf(byte id) {
		for(AccountLoginStatus s : AccountLoginStatus.values()) {
			if(s.getID() == id) {
				return s;
			}
		}
		return null;
	}
}
