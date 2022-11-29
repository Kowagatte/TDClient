extends KinematicBody2D

export var speed = 400
export var accel = 5
var direction = Vector2(0, 0)

func hit():
	visible = false
	set_process(false)

func shoot(pos, dir):
	position = pos
	direction = dir

	rotation = direction.angle()

	#rotation_degrees = int(Math.atan2(dir.y, dir.x)*180/Math.PI)

	set_process(true)
	visible = true

func _physics_process(delta):
	var c = move_and_collide( direction.normalized() * speed * delta)
	if c:
		hit()
