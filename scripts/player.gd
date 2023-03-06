extends CharacterBody2D

var direction = Vector2(0, 0)
var offset_scale: float
var offset: Vector2

func _ready():
	self.name = String.num_int64(multiplayer.get_unique_id())
	var map = get_parent().get_parent()
	self.offset = map.position
	self.offset_scale = map.scale.x

@rpc("any_peer", "unreliable_ordered") func updatePos(x, y, rot):
	self.position.x = (x*offset_scale) + offset.x
	self.position.y = (y*offset_scale) + offset.y
	self.rotation_degrees = rot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if Input.is_action_pressed("move_up"):
		direction.y = -1
	elif Input.is_action_pressed("move_down"):
		direction.y = 1
	else:
		direction.y = 0
	
	if Input.is_action_pressed("move_right"):
		direction.x = 1
	elif Input.is_action_pressed("move_left"):
		direction.x = -1
	else:
		direction.x = 0
		
	rpc_id(0, "control_player", direction.x, direction.y)

@rpc func control_player(_x, _y): pass
