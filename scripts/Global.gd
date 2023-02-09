extends Node

var points = 0
var lives = 3
var lives_init = 3
var shooting_level = 0
var shooting_level_max = 2

# nodos indicadores en hub
var hub_score_indicator
var hub_lives_indicator

#cinematica
var cinamitica = false

func sync_hub_indicators():
	if hub_lives_indicator:
		hub_lives_indicator.text = String(lives)
	if hub_score_indicator:
		hub_score_indicator.text = String(points)

func remove_life():
	if lives > 1:
		lives -= 1
	else:
		print("Fin del juego")
		lives = lives_init
		points = 0
		shooting_level = 0
		return get_tree().change_scene("res://scenes/Menu_fin_lose.tscn")
	sync_hub_indicators()

func add_points(value):
	points += value
	sync_hub_indicators()

func add_shooting_level():
	if shooting_level < shooting_level_max:
		shooting_level += 1
		print("Nivel de disparo: " + String(shooting_level))
	else:
		shooting_level = shooting_level_max
		print("Alcanzado el máximo ("
			+ String(shooting_level_max) 
			+ ") nivel de disparo")

func reset_shooting_level():
	shooting_level = 0
	print("Nivel de disparo: " + String(shooting_level))
	
func reset_scene():
	lives = lives_init
	return get_tree().reload_current_scene()
