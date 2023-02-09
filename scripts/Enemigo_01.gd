extends Area2D

export (int) var points = 10
var in_screen = false
var useless = false

func set_explosion():
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite.animation = "explosion"
	yield($AnimatedSprite, "animation_finished")
	queue_free()

func is_in_screen():
	return in_screen

func is_useless():
	return useless

func _on_VisibilityNotifier2D_screen_entered():
	in_screen = true

func _on_VisibilityNotifier2D_screen_exited():
	in_screen = false
	useless = true
