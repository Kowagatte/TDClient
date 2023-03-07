extends Control

@onready var create_button = get_node("Panel/CreateGameButton") as Button

@onready var code = get_node("Panel/Join/GameCodeEdit") as LineEdit
@onready var join_button = get_node("Panel/Join/JoinGameButton") as Button
@onready var error_message = get_node("Panel/Join/ErrorMessage") as Label

func _ready():
	create_button.pressed.connect(self._create_button_pressed)
	join_button.pressed.connect(self._join_button_pressed)
	

func _create_button_pressed():
	get_parent().get_parent().get_node("Server/Games").rpc_id(0, "createGame")
	get_parent().remove_child(self)

func _join_button_pressed():
	get_parent().get_parent().get_node("Server/Games").rpc_id(0, "joinGame", code.text)


func message(rc, msg):
	if rc == 200:
		error_message.add_theme_color_override("font_color", Color("#6ccd67"))
		get_parent().remove_child(self)
	else:
		error_message.add_theme_color_override("font_color", Color("#dc6666"))
	error_message.text = msg
