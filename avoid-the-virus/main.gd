extends Node2D

var virus_scene = preload("res://virus.tscn")

var score = 0
var paused = false
var game_over = false


func _physics_process(delta):

	if Input.is_action_just_pressed("ui_cancel"):

		pause_game()


func _ready():

	$Timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout():

	var virus = virus_scene.instantiate()

	virus.position.x = randi() % 1150
	virus.position.y = -50

	add_child(virus)


func add_score():

	score += 1

	$CanvasLayer/ScoreLabel.text = "Score: " + str(score)


func pause_game():

	paused = !paused

	get_tree().paused = paused

	$PauseMenu.visible = paused


func _on_resume_pressed():

	paused = false

	get_tree().paused = false

	$PauseMenu.visible = false


func _on_restart_pressed():

	get_tree().paused = false

	get_tree().reload_current_scene()


func _on_exit_pressed():

	get_tree().paused = false

	get_tree().change_scene_to_file("res://main_menu.tscn")


func show_game_over():

	game_over = true

	get_tree().paused = true

	$GameOverUI.visible = true

	$GameOverUI/Panel/FinalScoreLabel.text = "Final Score: " + str(score)
	

func _on_game_over_restart_pressed():

	get_tree().paused = false

	get_tree().reload_current_scene()
	

func _on_main_menu_pressed():

	get_tree().paused = false

	get_tree().change_scene_to_file("res://main_menu.tscn")
