extends Path2D

onready var speed = get_parent().speed
onready var paths = get_children()

func _physics_process(delta):
	for pathFollow in paths:
		if is_instance_valid(pathFollow):
			var enemigo = pathFollow.get_node_or_null('Enemigo')
			if is_instance_valid(enemigo) && enemigo.is_in_screen():
				pathFollow.offset += speed * delta
