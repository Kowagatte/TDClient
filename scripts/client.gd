extends Node

# IP address for the server, production IP should be a sub domain like (tds.damocles.ca)
var ip = "127.0.0.1"
# Temporary port, not important.
var port = 9696

var multiplayer_peer = ENetMultiplayerPeer.new()

func _ready():
	# This loads a script that holds the current RPC destination from the server
	# Will change this in the future.
	get_tree().root.call_deferred("add_child", load("res://nodes/Server.tscn").instantiate())
	
	# Create Client for connection
	multiplayer_peer.create_client(ip, port)
	
	# Server connection signals.
	multiplayer.multiplayer_peer = multiplayer_peer
	
	multiplayer.connected_to_server.connect(connected)
	multiplayer.server_disconnected.connect(disconnected)
	multiplayer.connection_failed.connect(failed)

	
	# Add initial Scene
	var loading_screen = load("res://screens/ConnectingScreen.tscn")
	add_child(loading_screen.instantiate())


# Loads and Changes the current scene.
func changeScene(current, scenePath):
	remove_child(current)
	current.call_deferred("free")
	var next_screen = load(scenePath)
	add_child(next_screen.instantiate())

# On Connection to Server
func connected():
	print("Connected to the Server!")
	print(multiplayer.get_unique_id())

func confirmed():
	# Add initial Scene
	changeScene(get_child(0), "res://screens/LoginScreen.tscn")

# On Disconnect from Server
func disconnected():
	print("Connection to Server Terminated.")


# On Failure to connect to server, happens very delayed due to reconnect attempts and timeout.
func failed():
	print("Connection Failed.")
