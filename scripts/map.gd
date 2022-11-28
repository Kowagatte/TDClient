extends Node2D

var grid_width = 27
var grid_height = 17

var cross = preload("res://nodes/walls/cross.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in grid_width:
		for y in grid_height:
			var crossInst = cross.instance()
			crossInst.set_position(Vector2( (48*x)+24, (48*y)+24 ))
			add_child(crossInst)
	# Construct our map
	pass # Replace with function body.
