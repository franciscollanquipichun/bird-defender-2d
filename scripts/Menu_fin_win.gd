extends Control

func _physics_process(_delta):
	$Background/AnimationPlayer.play("win")

func _on_btn_back_pressed():
	get_tree().change_scene("res://scenes/Menu_inicio.tscn")
