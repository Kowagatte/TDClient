extends Node2D

var ip = "127.0.0.1"
var port = 9696

var enet = ENetMultiplayerPeer.new()
var multiplayer_api: MultiplayerAPI

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var server = get_parent().get_node("Server")
	
	enet.create_client(ip, port)
	multiplayer_api = MultiplayerAPI.create_default_interface()
	get_tree().set_multiplayer(multiplayer_api, server.get_path())
	multiplayer_api.multiplayer_peer = enet
	
	
	multiplayer_api.connected_to_server.connect(_connected)
	
	# add initial scene
	var loading_screen = load("res://screens/ConnectingScreen.tscn")
	add_child(loading_screen.instantiate())
	

func _connected():
	await get_tree().create_timer(1).timeout
	print("Connected to Server!")
	
func changeScene(current, scenePath):
	remove_child(current)
	current.call_deferred("free")
	var next_screen = load(scenePath)
	add_child(next_screen.instantiate())

func confirmed():
	changeScene(get_child(0), "res://screens/LoginScreen.tscn")
