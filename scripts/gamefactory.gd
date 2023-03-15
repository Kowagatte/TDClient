extends Node2D

var game_inst = preload("res://nodes/game.tscn")

@rpc("any_peer")
func gameJoined(id):
	var game = game_inst.instantiate()
	game.name = id
	add_child(game)

@rpc("any_peer")
func sendGames(games):
	pass

@rpc func createGame(): pass

@rpc func joinGame(_gameID): pass

@rpc func requestInprogressGames(): pass

@rpc func rejoinGame(_gameId): pass
