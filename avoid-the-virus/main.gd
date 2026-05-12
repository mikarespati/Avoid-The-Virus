extends Node2D

var virus_scene = preload("res://virus.tscn")

func _ready():
	$Timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():

	var virus = virus_scene.instantiate()

	virus.position.x = randi() % 1150
	virus.position.y = -50

	add_child(virus)


func _on_virus_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
