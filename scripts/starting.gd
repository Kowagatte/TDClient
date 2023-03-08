extends Label

func start():
	visible = true
	$Timer.wait_time = 10
	$Timer.start()

func _ready():
	$Timer.timeout.connect(_on_timeout)

func _process(_delta):
	text = "Game starting in...\n%s" % str(floor($Timer.time_left))

func _on_timeout():
	visible = false
	get_parent().get_parent().rpc_id(1, "ready_up")
