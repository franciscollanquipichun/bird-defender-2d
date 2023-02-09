extends Area2D

func _on_PowerUp_body_entered(body):
	if body.is_in_group("personaje"):
		Global.add_shooting_level()
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
