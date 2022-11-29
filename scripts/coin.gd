extends Sprite

onready var area = get_node("area")

func _ready():
	var _c = area.connect("area_entered", self, "collided")
	pass # Replace with function body.

func collided(_entered):
	print("Coin collided")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
