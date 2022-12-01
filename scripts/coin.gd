extends Sprite

onready var area = get_node("area")

func _ready():
	var _c = area.connect("area_entered", self, "collided")
	pass # Replace with function body.

func collided(_entered):
	print("Coin collided")
