extends Node2D

@rpc func ready_up(): pass


func _ready():
	var gameid = get_node("scoreboard/gameID") as Label
	gameid.text = "Game ID: " + self.name
