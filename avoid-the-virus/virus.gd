extends Area2D

var speed = 250

func _process(delta):

	position.y += speed * delta

	if position.y > 800:
		queue_free()


func _on_area_entered(area):

	if area.name == "Bullet":

		get_parent().add_score()

		queue_free()

		area.queue_free()

func _on_body_entered(body):

	if body.name == "Player":

		get_parent().show_game_over()
