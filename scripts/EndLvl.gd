extends Node2D

export (String, FILE) var next_level
onready var personaje = get_tree().get_nodes_in_group("personaje")[0]

func cinematica():
	print('inicia cinematica de fin de escena')
	Global.cinamitica = true
	# posiciones
	var posicion_personaje = personaje.global_position
	var posicion_final = $PositionFinal.global_position
	var posicion_salida = $PositionExit.global_position
	
	# lleva personaje a posición final
	$Tween.interpolate_property(
		personaje,
		"global_position",
		posicion_personaje,
		posicion_final,
		2
	)
	$Tween.start()
	yield($Tween,"tween_all_completed")
	
	$AnimationPlayer.play("accomplished")
	
	# saca personaje 
	$Tween.interpolate_property(
		personaje,
		"global_position",
		posicion_final,
		posicion_salida,
		1
	)
	$Tween.start()
	yield($Tween,"tween_all_completed")
	yield($AnimationPlayer, "animation_finished")
	print('finaliza cinematica de fin de escena')
	Global.cinamitica = false
	
	if next_level:
		get_tree().change_scene(next_level)

func _on_VisibilityNotifier2D_screen_entered():
	cinematica()
