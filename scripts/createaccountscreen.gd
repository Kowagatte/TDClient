extends Control

onready var emailEnter = get_node("Panel/Email/EmailEnter") as LineEdit
onready var usernameEnter = get_node("Panel/Username/UsernameEnter") as LineEdit
onready var passwordEnter = get_node("Panel/Password/PasswordEnter") as LineEdit
onready var confirmPasswordEnter = get_node("Panel/ConfirmPassword/CPasswordEnter") as LineEdit
onready var errorMessage = get_node("Panel/ErrorMessage") as Label
onready var createButton = get_node("Panel/CreateButton") as Button
onready var gotoLogin = get_node("Panel/Login/LoginButton") as LinkButton



func _ready():
	createButton.connect("pressed", self, "createAccount")
	gotoLogin.connect("pressed", self, "login")

func login():
	#var _c = get_tree().change_scene("res://screens/LoginScreen.tscn")
	get_parent().changeScene(self, "res://screens/LoginScreen.tscn")

func createAccount():
	if emailEnter.text != "":
		if usernameEnter.text != "":
			if passwordEnter.text != "":
				if passwordEnter.text == confirmPasswordEnter.text:
					pass
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
