extends KinematicBody2D

var move_speed = 200
var velocity = Vector2(0, 0)
var rotation_map = [[270, 225, 180], [315, rotation_degrees, 135], [0, 45, 90]]

# [up, down, right, left]
# [315, 135, 45, 225]
# [up_right, up_left, down_right, down_left]
# [0, 270, 90, 180]

var bullet: KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	bullet = get_node("../bullet")
	pass # Replace with function body.
	

func _physics_process(_delta):
	if velocity != Vector2():
		rotation_degrees = rotation_map[velocity.x+1][velocity.y+1]
	var _m = move_and_slide(velocity.normalized() * move_speed)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if Input.is_action_pressed("shoot"):
		bullet.shoot(position, velocity)

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
