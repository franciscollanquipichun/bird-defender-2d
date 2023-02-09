extends Node2D

export (float) var speed = 300.0

onready var enemigos = [
	$Path2D/PathFollow2D_01/Enemigo,
	$Path2D/PathFollow2D_02/Enemigo
]

func _physics_process(_delta):
	var clear_enemies = true
	for enemigo in enemigos:
		if is_instance_valid(enemigo) && !enemigo.is_useless():
			clear_enemies = false
	
	# limpia el nodo si todos los enemigos ya fueron destruidos 
	# o estan fuera de pantalla
	if clear_enemies:
		queue_free()
