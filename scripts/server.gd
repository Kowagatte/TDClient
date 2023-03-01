extends Node2D

onready var root = get_tree().root
onready var client = root.get_node("Client")
onready var games = get_node("Games")

var game_inst = preload("res://nodes/game.tscn")

func login(email, password):
	rpc_id(1, "login", email, password)

func createAccount(email, username, password):
	rpc_id(1, "createAccount", email, username, password)

remote func connectionConfirmation():
	client.confirmed()

remote func response(response_code, message):
	get_tree().root.get_node("Client").get_child(0).message(response_code, message)

remote func switchScenes(scene):
	client.changeScene(client.get_child(0), "res://screens/%s.tscn" % scene)

remote func gameCreated(id):
	var game = game_inst.instance()
	game.name = String(id)
	games.add_child(game)
