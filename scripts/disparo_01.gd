extends RigidBody2D

# Nodo simple
# Requiere siempre estar contenido en un nodo padre

func _on_AreaImpacto_area_entered(area):
	if area.is_in_group("enemigo"):
		Global.add_points(area.points)
		area.set_explosion()
		get_parent().queue_free()


# Elimina disparo y su nodo padre al salir de pantalla
func _on_VisibilityNotifier2D_screen_exited():
	get_parent().queue_free()
	pass
