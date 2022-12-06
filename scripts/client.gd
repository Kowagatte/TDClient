extends Node

# IP address for the server, production IP should be a sub domain like (tds.damocles.ca)
var ip = "127.0.0.1"
# Temporary port, not important.
var port = 9696

func _ready():
	# This loads a script that holds the current RPC destination from the server
	# Will change this in the future.
	get_tree().root.call_deferred("add_child", load("res://nodes/Server.tscn").instance())
	
	# Create Client for connection
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip, port)
	get_tree().network_peer = peer

	# Server connection signals.
	var _c = get_tree().connect("connected_to_server", self, "connected")
	_c = get_tree().connect("server_disconnected", self, "disconnected")
	_c = get_tree().connect("connection_failed", self, "failed")
	
	# Add initial Scene
	var login_screen = load("res://screens/LoginScreen.tscn")
	add_child(login_screen.instance())



# Loads and Changes the current scene.
func changeScene(current, scenePath):
	remove_child(current)
	current.call_deferred("free")
	var next_screen = load(scenePath)
	add_child(next_screen.instance())

# On Connection to Server
func connected():
	print("Connected to the Server!")


# On Disconnect from Server
func disconnected():
	print("Connection to Server Terminated.")


# On Failure to connect to server, happens very delayed due to reconnect attempts and timeout.
func failed():
	print("Connection Failed.")
