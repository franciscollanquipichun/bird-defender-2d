extends Node2D

export (int) var speed = 500
var posicion_alcanzada = false
var personaje_posicion

onready var personajes = get_tree().get_nodes_in_group('personaje')
onready var enemigo = self.get_node_or_null("Enemigo")

# Mueve un enemigo a la posición del personaje y luego sigue en linea recta
func _physics_process(delta):
	if is_instance_valid(enemigo) && enemigo.is_in_screen():
		if ! personaje_posicion:
			personaje_posicion = personajes[0].global_position
			
		if (global_position == personaje_posicion) && posicion_alcanzada == false:
			posicion_alcanzada = true

		if posicion_alcanzada:
			# x:-200 que el enemigo hasta salir de pantalla
			global_position = global_position.move_toward(Vector2(-200, personaje_posicion.y), speed * delta)
		else:
			global_position = global_position.move_toward(personaje_posicion, speed * delta)

	elif !enemigo || (is_instance_valid(enemigo) && enemigo.is_useless()):
		queue_free()
