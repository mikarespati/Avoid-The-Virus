extends Area2D

var speed = 1000

func _process(delta):

	position.y -= speed * delta

	if position.y < -100:
		queue_free()
