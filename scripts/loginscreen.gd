extends Control

onready var emailEnter = get_node("Panel/Email/EmailEnter") as LineEdit
onready var passwordEnter = get_node("Panel/Password/PasswordEnter") as LineEdit
onready var loginButton = get_node("Panel/LoginButton") as Button
onready var createAccountButton = get_node("Panel/CreateAccount/CreateAccountButton") as LinkButton
onready var errorMessage = get_node("Panel/ErrorMessage") as Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var _p = loginButton.connect("pressed", self, "login")
	var _c = createAccountButton.connect("pressed", self, "createAccount")

func changeErrorColor(color):
	errorMessage.add_color_override("font_color", Color("#%s" % color))

func message(rc, msg):
	if rc == 200:
		changeErrorColor("6ccd67")
	else:
		changeErrorColor("dc6666")
	errorMessage.text = msg

func login():
	if emailEnter.text != "":
		if passwordEnter.text != "":
			get_tree().root.get_node("Server").login(emailEnter.text, passwordEnter.text)

func createAccount():
	#var _c = get_tree().change_scene("res://screens/CreateAccountScreen.tscn")
	get_parent().changeScene(self, "res://screens/CreateAccountScreen.tscn")
