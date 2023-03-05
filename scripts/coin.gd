extends Sprite2D

@onready var area = get_node("area")
var player_owned: String

func _ready():
	var _c = area.connect("area_entered",Callable(self,"collided"))
	pass # Replace with function body.

func collided(collider):
	if visible:
		visible = false
		player_owned = collider.get_parent().name
		print("Coin collided")
