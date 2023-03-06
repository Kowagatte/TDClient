extends Node2D

@onready var client = get_parent().get_node("Client")
@onready var games = get_node("Games")

var game_inst = preload("res://nodes/game.tscn")

# ---------------------------------------------------------------------------------------------

# Send to Server

@rpc func login(_email, _password): pass

@rpc func account(_username): pass

@rpc func createAccount(_email, _username, _password): pass

# ---------------------------------------------------------------------------------------------

# Receive on Client

@rpc("any_peer")
func connectionConfirmation():
	client.confirmed()

@rpc("any_peer")
func ping():
	print("pong")

@rpc("any_peer")
func response(response_code, message):
	client.get_child(0).message(response_code, message)

@rpc("any_peer")
func switchScenes(scene):
	client.changeScene(client.get_child(0), "res://screens/%s.tscn" % scene)

@rpc("any_peer")
func gameCreated(id):
	var game = game_inst.instantiate()
	game.name = id
	games.add_child(game)
