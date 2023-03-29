extends Control

@onready var server = get_parent().get_parent().get_node("Server")
#@onready var settings = get_node("/root/Settings")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/message.text = $Panel/message.text % [server.server_version, Settings.version]
