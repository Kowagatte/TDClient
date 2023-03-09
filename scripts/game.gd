extends Node2D

@rpc func ready_up(): pass

var gameOver = false

@rpc("any_peer", "unreliable_ordered")
func update_pos(player, x, y, rot):
	if has_node("map/players/%s" % player):
		var player_node = get_node("map/players/%s" % player)
		player_node.updatePos(x, y, rot)

@rpc("any_peer")
func spawn_enemy(id):
	var player = load("res://nodes/enemy.tscn").instantiate()
	player.name = String.num_int64(id)
	get_node("map/players").add_child(player)

@rpc("any_peer")
func sendState(state, _content):
	var waiting = get_node("Control/waiting")
	var starting = get_node("Control/starting")
	var ended = get_node("Control/ended")
	
	if state == "waitingForPlayer":
		waiting.visible = true
	elif state == "gameStarting":
		waiting.visible = false
		starting.start()
	elif state == "ended":
		ended.visible = true
		executeGameOver()
	elif state == "started":
		waiting.visible = false
		starting.visible = false

func executeGameOver():
	gameOver = true
	await get_tree().create_timer(2).timeout
	get_parent().get_parent().get_parent().get_node("Client").changeScene(self, "res://screens/CreateGameScreen.tscn")
	#get_parent().remove_child(self)
	#call_deferred("free")

func _ready():
	var gameid = get_node("Control/gameID") as Label
	gameid.text = "Game ID: " + self.name

@rpc("any_peer")
func updateScore(score):
	get_node("scoreboard/playerOneScore").text = String.num_int64(score[0])
	get_node("scoreboard/playerTwoScore").text = String.num_int64(score[1])
	
