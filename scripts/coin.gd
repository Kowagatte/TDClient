extends Sprite
var player_owned: String
signal collected 

onready var player = get_parent().get_parent().get_node("Map/Player")
onready var area = get_node("area")

func _ready():
	#when the area_enterd signal is triggerd, run collided()
	var _c =  area.connect("area_entered", self, "collided")
	#when the player emits the "died" signal, run release()
	var _a = player.connect("died", self, "release")


func collided(collider):
	if visible:
		visible = false
		#store what player collided in player_owned
		player_owned = collider.get_parent().name
		#emit signal collected along with the name of the player who collected it
		emit_signal("collected", player.name)
		
func release(who):
	#if the player that orginal collected the coin has died, make the coins visible again
	if who == player_owned:
		visible = true
