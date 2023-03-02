extends Node2D

var grid_width = 27
var grid_height = 17

var cross = preload("res://nodes/walls/cross.tscn")
var full_corner = preload("res://nodes/walls/full_corner.tscn")
var full_t = preload("res://nodes/walls/full_t.tscn")
var half_corner = preload("res://nodes/walls/half_corner.tscn")
var half_t = preload("res://nodes/walls/half_t.tscn")
var middle_wall = preload("res://nodes/walls/middle_wall.tscn")
var outer_wall = preload("res://nodes/walls/outer_wall.tscn")
var spawn = preload("res://nodes/spawn.tscn")
var coin = preload("res://nodes/Coin.tscn")

func create_wall(wall_type):
	match wall_type:
		"cross":
			return cross
		"full_corner":
			return full_corner
		"full_t":
			return full_t
		"half_corner":
			return half_corner
		"half_t":
			return half_t
		"middle_wall":
			return middle_wall
		"outer_wall":
			return outer_wall
		"spawn":
			return spawn
		"coin":
			return coin
		_:
			pass

# Called when the node enters the scene tree for the first time.
func _ready():
	#var rng = RandomNumberGenerator.new()
	var file = File.new()
	if file.file_exists("res://resources/dust2.json"):
		file.open("res://resources/dust2.json", File.READ)
		var data = parse_json(file.get_as_text())
		print(data["name"])
		for wall in data["walls"]:
			var w = create_wall(wall["wall"]).instance()
			w.set_position(Vector2( (48*int(wall["x"]))+24 , (48*int(wall["y"]))+24 ))
			w.rotation_degrees = int(wall["rotation"])
			add_child(w)
