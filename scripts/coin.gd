extends Sprite
var player_owned: String
signal collected 

onready var player = get_parent().get_parent().get_node("Map/Player")
onready var area = get_node("area")

func _ready():
	var _c =  area.connect("area_entered", self, "collided")
	var _a = player.connect("died", self, "released")
	pass # Replace with function body.

func collided(collider):
	if visible:
		visible = false
		player_owned = collider.get_parent().name
		#print("Coin collided")
		emit_signal("collected", player.name)
		
func released(who):
	if who == player_owned:
		visible = true
