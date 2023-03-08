extends Node2D

@rpc func ready_up(): pass

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

func _ready():
	var gameid = get_node("scoreboard/gameID") as Label
	gameid.text = "Game ID: " + self.name

@rpc("any_peer")
func updateScore(score):
	get_node("scoreboard/playerOneScore").text = String.num_int64(score[0])
	get_node("scoreboard/playerTwoScore").text = String.num_int64(score[1])
	
