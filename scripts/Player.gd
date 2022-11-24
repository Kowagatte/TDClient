extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var move_speed = 200
var movement = [false, false, false, false]
var rotation_map = [-45, 135, 45, -135]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	var velocity = Vector2()
	
	if movement[0]:
		velocity.y -= move_speed
		rotation_degrees = -45
	if movement[1]:
		velocity.y += move_speed
		rotation_degrees = 135
	if movement[2]:
		velocity.x += move_speed
		rotation_degrees = 45
	if movement[3]:
		velocity.x -= move_speed
		rotation_degrees = -135
		
	if velocity.x > 0:
		if velocity.y < 0:
			pass
		if velocity.y > 0:
			pass
		rotation_degrees = rotation_map[2]
	if velocity.x < 0:
		if velocity.y < 0:
			pass
		if velocity.y > 0:
			pass
	else:
		if velocity.y < 0:
			pass
		if velocity.y > 0:
			pass
		
	# Should base rotation on velocity instead of input.	
	if movement[0] and movement[2]:
		rotation_degrees = rotation_map[0] + rotation_map[2]
	elif movement[0] and movement[3]:
		rotation_degrees = -rotation_map[0] + rotation_map[3]
	elif movement[1] and movement[2]:
		rotation_degrees = rotation_map[1] + -rotation_map[2]
	elif movement[1] and movement[3]:
		rotation_degrees = rotation_map[1] + rotation_map[3] + 180
	
	
	move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement[0] = Input.is_action_pressed("move_up")
	movement[1] = Input.is_action_pressed("move_down")
	movement[2] = Input.is_action_pressed("move_right")
	movement[3] = Input.is_action_pressed("move_left")
