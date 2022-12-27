extends Label
onready var player = get_parent().get_parent().get_node("Map/Player")
onready var playerOne = player.name

var coins = []

# Called when the node enters the scene tree for the first ime.
func _ready():
	#for each coin the the coins array, when that coind becomes collected, call increment
	for coin in coins:
		var _c = coin.connect("collected", self, "increment")
	#whenever a player dies, call the decrement function
	var _a = player.connect("died", self, "decrement")

func decrement(who):
	#if it is player one that died, reset counter back to 0
	if playerOne == who:
		set_text("0")

func increment(who):
	#if player one collected a coin, increment the counter.
	if playerOne == who:
		set_text(String(int(get_text()) + 1))

