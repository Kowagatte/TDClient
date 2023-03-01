extends KinematicBody2D

var velocity = Vector2(0, 0)


func _ready():
	self.name = String(get_tree().get_network_unique_id())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if Input.is_action_pressed("move_up"):
		velocity.y = -1
	elif Input.is_action_pressed("move_down"):
		velocity.y = 1
	else:
		velocity.y = 0
	
	if Input.is_action_pressed("move_right"):
		velocity.x = 1
	elif Input.is_action_pressed("move_left"):
		velocity.x = -1
	else:
		velocity.x = 0
		
	
	get_parent().get_parent().rpc_unreliable_id(0, "control_player", velocity.x, velocity.y)
