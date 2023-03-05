extends Control


@onready var sprite = get_node("Sprite2D")

func _process(delta):
	sprite.rotate(delta)
	#pass
