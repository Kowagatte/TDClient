extends KinematicBody2D

var velocity = Vector2(0, 0)
var offset_scale: float
var offset: Vector2


func _ready():
	self.name = String(get_tree().get_network_unique_id())
	var map = get_parent().get_parent()
	self.offset = map.position
	self.offset_scale = map.scale.x

remote func updatePos(x, y, rot):
	self.position.x = (x*offset_scale) + offset.x
	self.position.y = (y*offset_scale) + offset.y
	#self.position = self.to_local(Vector2(x, y))
	self.rotation_degrees = rot

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
		
	
	get_parent().get_parent().get_parent().rpc_unreliable_id(0, "control_player", velocity.x, velocity.y)
