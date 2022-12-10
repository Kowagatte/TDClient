extends VBoxContainer



func _ready():
	for x in 20:
		var friend = load("res://nodes/Friend.tscn").instance()
		friend.get_node("Panel/Label2").set_text(str(x))
		add_child(friend)
	pass # Replace with function body.
