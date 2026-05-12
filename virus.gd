extends Area2D

var speed = 250

func _process(delta):
	position.y += speed * delta

	if position.y > 700:
		queue_free()
