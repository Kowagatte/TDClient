package ca.damocles;

/**
 * Class used to construct and manipulate TDS Packets.
 * @author Nicholas Ryan
 */
public class Packet {
	
	private PacketEnum packet = null;
	private String[] args = null;

	/**
	 * Constructor used to construct a packet with multiple arguments.
	 * @param packet the type of Packet you wish to construct.
	 * @param args array of arguments, should match the arguments specified in the PacketEnum class.
	 */
	public Packet(PacketEnum packet, String[] args) {
		this.packet = packet;
		this.args = args;
	}
	
	/**
	 * Constructor used to construct a packet with no arguments.
	 * @param packet the type of Packet you wish to construct.
	 */
	public Packet(PacketEnum packet) {
		this.packet = packet;
	}
	
	/**
	 * Constructor used to Construct a packet from a string.
	 * @param rawPacket packet formatted as a string.
	 */
	public Packet(String rawPacket) {
		String[] fragments = rawPacket.split(";");
		PacketEnum currentPacket = PacketEnum.valueof(Byte.valueOf(fragments[0]));
		String[] arguments = new String[fragments.length-1];
		int i = 0;
		for(String s : fragments) {
			if(i > 0) {
				arguments[i-1] = s;
			}
			i++;
		}
		this.packet = currentPacket;
		this.args = arguments;
	}
	
	/**
	 * Returns the PacketEnum of the packet you have constructed.
	 * @return (PacketEnum) type of this packet.
	 */
	public PacketEnum getEnum() {
		return packet;
	}
	
	/**
	 * Returns arguments of this packet as a string array.
	 * @return (String[]) Arguments of packet.
	 */
	public String[] getArgs() {
		return args;
	}
	
	/**
	 * Formats packet as a string to be sent.
	 * @return (String) Packet formatted as string.
	 */
	public String sendPacket() {
		String builtPacket = String.valueOf(packet.getID());
		int argsAmount = packet.getPacketArguments();
		for(int i = 0; i < argsAmount; i++) {
			builtPacket = builtPacket+";"+args[i];
		}
		return builtPacket;
	}
	
	/**
	 * Class handles packets; name, type, arguments.
	 * @author Nicholas Ryan
	 */
	public enum PacketEnum{
		RENDER_TILE((byte) 0, "ID;X;Y", 3),
		RENDER_PLAYER((byte) 1, "ID;DIRECTION;X;Y", 4),
		COIN_VISABLE((byte) 2, "ID;BOOLEAN", 2),
		INPUT((byte) 3, "ID", 1),
		TICK((byte) 4, "TICK", 1),
		SCORE((byte) 5, "ID;SCORE", 2),
		CLOSE((byte) 6, "CLOSE", 0),
		DENIED((byte) 7, "DENIED", 0),
		INFO((byte) 8, "INFO", 1),
		LOGIN_STATUS((byte) 9, "ID", 1),
		ACCOUNT_CREATION_STATUS((byte) 10, "ID", 1),
		ACCOUNT_CREATION((byte) 11, "EMAIL;USERNAME;PASSWORD", 3),
		LOGIN_CREDENTIALS((byte) 12, "USERNAME;PASSWORD", 2),
		CLIENT_STATUS((byte) 13, "STATUS", 1),
		CONNECTING_STATUS((byte) 14, "BOOLEAN", 1);
		private byte id;
		private String structure;
		private int args;
		/**
		 * @param packetname Name of the packet
		 * @param structure Structure of the arguments
		 * @param args amount of arguments in the given packet
		 */
		PacketEnum(byte id, String structure, int args){
			this.id = id;
			this.structure = structure;
			this.args = args;
		}
		
		/**
		 * @return byte packetID
		 */
		public byte getID() { return this.id; }
		/**
		 * @return (String) packet structure in string format
		 */
		public String getPacketSctructure() { return this.structure; }
		/**
		 * @return (int) number of arguments this packet holds
		 */
		public int getPacketArguments() { return this.args; }
		
		public static PacketEnum valueof(byte id) {
			for(PacketEnum e : PacketEnum.values()) {
				if(e.getID() == id) {
					return e;
				}
			}
			return null;
		}
	}
	
}
