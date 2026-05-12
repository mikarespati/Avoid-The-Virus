extends Area2D

var speed = 250

func _process(delta):

	position.y += speed * delta

	if position.y > 700:
		queue_free()

func _on_body_entered(body):

	if body.name == "Player":
		get_tree().reload_current_scene()
