extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", self, "_button_pressed")


func _button_pressed():
	get_tree().root.get_node("Server").rpc_id(0, "startGame")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
