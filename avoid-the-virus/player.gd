extends CharacterBody2D

const SPEED = 300

var bullet_scene = preload("res://bullet.tscn")
var can_shoot = true

func _physics_process(delta):

	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	if Input.is_action_pressed("ui_down"):
		direction.y += 1

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	velocity = direction.normalized() * SPEED

	if Input.is_action_pressed("ui_accept"):
		shoot()
		can_shoot = false
		$ShootCooldown.start()

	move_and_slide()

	print(global_position)

func shoot():

	var bullet = bullet_scene.instantiate()

	bullet.global_position = $AnimatedSprite2D.global_position

	get_tree().current_scene.add_child(bullet)
	print("PEW")


func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true
