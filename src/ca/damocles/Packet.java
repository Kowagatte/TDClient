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
		PacketEnum currentPacket = null;
		for(PacketEnum pack : PacketEnum.values()) {
			if(fragments[0].equals(pack.getPacketName())){
				currentPacket = pack;
				break;
			}
		}
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
		String builtPacket = packet.getPacketName();
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
		RENDER_TILE_PACKET("RENDER", "ID;X;Y", 3),
		RENDER_PLAYER_PACKET("PLAYER", "ID;DIRECTION;X;Y", 4),
		RENDER_SPRITE_PACKET("SPRITE", "TYPE;ID;X;Y", 4),
		COIN_VISABLE_PACKET("COINVISABLE", "ID;BOOLEAN", 2),
		INPUT_PACKET("INPUT", "ID", 1),
		TIME_PACKET("TIME", "TIME", 1),
		SCORE_PACKET("SCORE", "ID;SCORE", 2),
		CLOSE_PACKET("CLOSE", "CLOSE", 0),
		DENIED_PACKET("DENIED", "DENIED", 0),
		INFORMATION_PACKET("INFORMATION", "INFO", 1),
		LOGIN_STATUS_PACKET("LOGINSTATUS", "ID", 1),
		ACCOUNT_CREATION_STATUS_PACKET("ACCOUNTCREATIONSTATUS", "ID", 1),
		ACCOUNT_CREATION_PACKET("ACCOUNTCREATION", "USERNAME;PASSWORD", 2),
		LOGIN_CREDENTIALS("LOGINCREDENTIALS", "USERNAME;PASSWORD", 2),
		CLIENT_STATUS_PACKET("CLIENTSTATUS", "STATUS", 1),
		CONNECTING_PACKET("CONNECTINGSTATUS", "BOOLEAN", 1);
		private String packetname;
		private String structure;
		private int args;
		/**
		 * @param packetname Name of the packet
		 * @param structure Structure of the arguments
		 * @param args amount of arguments in the given packet
		 */
		PacketEnum(String packetname, String structure, int args){
			this.packetname = packetname;
			this.structure = structure;
			this.args = args;
		}
		/**
		 * @return (string) packets name
		 */
		public String getPacketName() { return this.packetname; }
		/**
		 * @return (String) packet structure in string format
		 */
		public String getPacketSctructure() { return this.structure; }
		/**
		 * @return (int) number of arguments this packet holds
		 */
		public int getPacketArguments() { return this.args; }
	}
	
}
