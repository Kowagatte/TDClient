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
var coin = preload("res://nodes/coin.tscn")

var spawns = [0,0]

# Returns the preloaded node corrosponding to the given long text name
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

func _ready():
	loadMap("res://resources/dust2.json")

# Loads the map from the given map file.
func loadMap(map_path):
	# Opens the map file
	var file = FileAccess.open(map_path, FileAccess.READ)
	if FileAccess.file_exists(map_path): # "res://resources/dust2.json"
		# Formats the file as a JSON object
		var test_json_conv = JSON.new()
		test_json_conv.parse(file.get_as_text())
		var data = test_json_conv.get_data()
		
		# Loops through each wall section in the JSON object
		for wall in data["walls"]:
			# Instantiates the wall from the given text
			var w = create_wall(wall["wall"]).instantiate()
			
			if wall["wall"] == "player_one_spawn":
				spawns[0] = w

			if wall["wall"] == "player_two_spawn":
				spawns[1] = w
			# Centers the wall object on the cordinates specified
			w.set_position(Vector2( (48*int(wall["x"]))+24 , (48*int(wall["y"]))+24 ))
			# Rotates the wall as specified
			w.rotation_degrees = int(wall["rotation"])
			# Adds the instantiated node to the tree
			w.name = "%s" % w.position
			add_child(w)
