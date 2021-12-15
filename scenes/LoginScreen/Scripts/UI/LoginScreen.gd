extends Node

var emailEnter
var passwordEnter
var loginButton
var errorMessage
var createAccountButton

# Called when the node enters the scene tree for the first time.
func _ready():
	emailEnter = get_node("Email/EmailEnter")
	passwordEnter = get_node("Password/PasswordEnter")
	loginButton = get_node("LoginButton")
	errorMessage = get_node("ErrorMessage")
	createAccountButton = get_node("CreateAccount/CreateAccountButton")
	
	passwordEnter.connect("text_entered", self, "text_entered")
	loginButton.connect("pressed", self, "toggled")
	createAccountButton.connect("pressed", self, "create_account")

func text_entered(_text):
	send_login()

func toggled():
	send_login()

func send_login():
	print("This is firing")
	#TODO send login packet to server
	pass

func create_account():
	get_tree().change_scene("res://Scenes/CreateAccount/CreateAccountScreen.tscn")

func debug_login_credentials():
	print("Email:", emailEnter.text)
	print("Password:", passwordEnter.text)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
