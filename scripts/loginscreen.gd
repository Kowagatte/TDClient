extends Control

onready var emailEnter = get_node("Panel/Email/EmailEnter") as LineEdit
onready var passwordEnter = get_node("Panel/Password/PasswordEnter") as LineEdit
onready var loginButton = get_node("Panel/LoginButton") as Button
onready var createAccountButton = get_node("Panel/CreateAccount/CreateAccountButton") as LinkButton


# Called when the node enters the scene tree for the first time.
func _ready():
	var _p = loginButton.connect("pressed", self, "login")
	var _c = createAccountButton.connect("pressed", self, "createAccount")

func login():
	if emailEnter.text != "":
		if passwordEnter.text != "":
			pass

func createAccount():
	#var _c = get_tree().change_scene("res://screens/CreateAccountScreen.tscn")
	get_parent().changeScene(self, "res://screens/CreateAccountScreen.tscn")
