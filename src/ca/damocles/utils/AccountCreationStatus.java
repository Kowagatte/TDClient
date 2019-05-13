package ca.damocles.utils;

public enum AccountCreationStatus {
	ACCOUNT_ALREADY_EXISTS("An account with this username already exists.", (byte) 0),
	REGEX("Username or password contains unacceptable characters.", (byte) 1),
	SUCCESS("Account has been created.", (byte) 2),
	EMAIL_ALREADY_USED("This email has already been used.", (byte)3),
	UNKNOWN("No fucking clue what went wrong.", (byte)4);
	private String description;
	private byte id;
	AccountCreationStatus(String description, byte id) { this.description = description; this.id = id; }
	public String getDescription() { return this.description; }
	public byte getID() { return this.id; }
	public static AccountCreationStatus valueOf(byte id) {
		for(AccountCreationStatus s : AccountCreationStatus.values()) {
			if(s.getID() == id) {
				return s;
			}
		}
		return null;
	}
}
