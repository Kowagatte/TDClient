extends Label
onready var player = get_parent().get_parent().get_node("Map/Player")

onready var playerOne = player.name
var coins = []

# Called when the node enters the scene tree for the first ime.
func _ready():
	for coin in coins:
		var _c = coin.connect("collected", self, "increment")
	
	var _a = player.connect("died", self, "decrement")

func decrement(who):
	if playerOne == who:
		set_text("0")

func increment(who):
	if playerOne == who:
		set_text(String(int(get_text()) + 1))

