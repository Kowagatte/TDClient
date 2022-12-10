extends Control


onready var sprite = get_node("TextureRect")

func _process(delta):
	sprite.set_rotation(sprite.get_rotation()+delta)
	#pass
