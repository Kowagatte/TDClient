extends Control


@onready var sprite = get_node("Panel/Label/Sprite2D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite.rotate(delta)
