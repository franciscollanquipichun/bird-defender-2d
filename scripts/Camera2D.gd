extends Camera2D

export (int) var speed = 300

func _physics_process(delta):
	if !Global.cinamitica:
		position.x += speed*delta
