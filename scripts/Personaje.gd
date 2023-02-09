extends KinematicBody2D

export (int) var velocidad = 600

var movimiento = Vector2.ZERO
var cooldown = true

onready var shootings = [
	preload("res://scenes/shooting_lvl_0.tscn"),
	preload("res://scenes/shooting_lvl_1.tscn"),
	preload("res://scenes/shooting_lvl_2.tscn")
]
onready var playback = $AnimationTree.get("parameters/playback")

func _ready():
	# inicializa HUB
	var HUB = get_tree().get_nodes_in_group('HUB')[0]
	if HUB:
		Global.hub_score_indicator = HUB.get_node_or_null("ScoreIndicator/Value")
		Global.hub_lives_indicator = HUB.get_node_or_null("LivesIndicator/Value")
		Global.sync_hub_indicators()
	else:
		printerr('no se inicio HUB')

func get_inputs():
	movimiento = Vector2()
	if Input.is_action_pressed("move_right"):
		movimiento.x += velocidad
		playback.travel("move_right");
	if Input.is_action_pressed("move_left"):
		movimiento.x -= velocidad
		playback.travel("move_left");
	if Input.is_action_pressed("move_up"):
		movimiento.y -= velocidad
		playback.travel("move_up");
	if Input.is_action_pressed("move_down"):
		movimiento.y += velocidad
		playback.travel("move_down");
	if Input.is_action_pressed("attack"):
		attack()	
	if movimiento == Vector2():
		playback.start("RESET")

func attack():
	if cooldown:
		cooldown = false
		$CadenciaTimer.start()
		var instancia_disparo = shootings[Global.shooting_level].instance()
		instancia_disparo.global_position = $DisparoPos.global_position
		add_child(instancia_disparo)
		instancia_disparo.set_as_toplevel(true)

func take_damage():
	Global.remove_life()
	Global.reset_shooting_level()
	$AnimationDamage.play("take_damage")

func _on_CadenciaTimer_timeout():
	cooldown = true

func _on_AreaDamage_area_entered(area):
	if area.is_in_group('enemigo'):
		take_damage()
		area.set_explosion()

func _physics_process(_delta):
	if !Global.cinamitica:
		get_inputs()
		movimiento = move_and_slide(movimiento)
