extends CharacterBody2D

var direction = Vector2(0, 0)
@onready var game = get_parent().get_parent().get_parent()

func _ready():
	self.name = String.num_int64(multiplayer.get_unique_id())
	
	var bullet = load("res://nodes/bullet.tscn").instantiate()
	bullet.name = str(multiplayer.get_unique_id())
	game.get_node("map/bullets").add_child(bullet)
	

func updatePos(x, y, rot):
	self.position.x = x
	self.position.y = y
	self.rotation_degrees = rot

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_just_released("shoot"):
		rpc_id(1, "try_shoot")
	
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
	
	if not game.gameOver:
		rpc_id(1, "control_player", direction.x, direction.y)
	
	# Only here for testing, needs to be removed upon bullet implementation
	if Input.is_action_just_released("death"):
		rpc_id(1, "died")

@rpc func control_player(_x, _y): pass

@rpc func try_shoot(): pass
