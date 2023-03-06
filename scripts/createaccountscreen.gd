extends Control

@onready var emailEnter = get_node("Panel/Email/EmailEnter") as LineEdit
@onready var usernameEnter = get_node("Panel/Username/UsernameEnter") as LineEdit
@onready var passwordEnter = get_node("Panel/Password/PasswordEnter") as LineEdit
@onready var confirmPasswordEnter = get_node("Panel/ConfirmPassword/CPasswordEnter") as LineEdit
@onready var errorMessage = get_node("Panel/ErrorMessage") as Label
@onready var createButton = get_node("Panel/CreateButton") as Button
@onready var gotoLogin = get_node("Panel/Login/LoginButton") as LinkButton



func _ready():
	createButton.connect("pressed",Callable(self,"createAccount"))
	gotoLogin.connect("pressed",Callable(self,"login"))
	
func changeErrorColor(color):
	errorMessage.add_theme_color_override("font_color", Color("#%s" % color))

func message(rc, msg):
	if rc == 200:
		changeErrorColor("6ccd67")
	else:
		changeErrorColor("dc6666")
	errorMessage.text = msg

func login():
	#var _c = get_tree().change_scene_to_file("res://screens/LoginScreen.tscn")
	get_parent().changeScene(self, "res://screens/LoginScreen.tscn")

func createAccount():
	if emailEnter.text != "":
		if usernameEnter.text != "":
			if passwordEnter.text != "":
				if passwordEnter.text == confirmPasswordEnter.text:
					get_parent().get_parent().get_node("Server").rpc_id(0, "createAccount", emailEnter.text, usernameEnter.text, passwordEnter.text)
					#get_tree().root.get_node("Server").createAccount(emailEnter.text, usernameEnter.text, passwordEnter.text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
