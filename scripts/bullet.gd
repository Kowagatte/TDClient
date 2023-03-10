extends RigidBody2D

var speed = 500
var accel = 0

@rpc("any_peer")
func toggleVisibility(isVisible):
	visible = isVisible

func _ready():
	visible = false

func updatePos(x, y, rot):
	position.x = x
	position.y = y
	rotation_degrees = rot
