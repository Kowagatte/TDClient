extends Control


onready var sprite = get_node("Sprite")

func _process(delta):
	sprite.rotate(delta)
	#pass
