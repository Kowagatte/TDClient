extends Control

@onready var button = get_node("Panel/Button")

func _ready():
	button.pressed.connect(self._button_pressed)

func _button_pressed():
	get_parent().get_parent().get_node("Server/Games").rpc_id(0, "createGame")
	get_parent().remove_child(self)
