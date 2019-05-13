package ca.damocles.client;

public enum ClientState {
	
	LOGIN_SCREEN((byte)0),
	PASSWORD_MENU((byte)1),
	PASSWORD_REQUEST((byte)2),
	PASSWORD_CHANGE((byte)3),
	CREATE_ACCOUNT((byte)4),
	CLIENT((byte)5),
	IN_GAME((byte)6);
	
	byte id;
	ClientState(byte id) {
		this.id = id;
	}
	
	/**
	 * Byte representing enum.
	 * @return Byte value representing this enum.
	 */
	public byte getID() {
		return id;
	}
	
	/**
	 * Gets the enum from the specific byte.
	 * @param id byte of the enum.
	 * @return Enum associated with that byte.
	 */
	public ClientState valueOf(byte id) {
		for(ClientState state : ClientState.values()) {
			if(state.getID() == id) {
				return state;
			}
		}
		return null;
	}
}
