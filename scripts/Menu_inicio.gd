extends Control

func _on_btn_start_pressed():
	get_tree().change_scene("res://levels/lvl_1.tscn")

func _on_btn_credits_pressed():
	get_tree().change_scene("res://scenes/Menu_creditos.tscn")
