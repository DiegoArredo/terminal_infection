extends CharacterBody2D
@export var bullet:PackedScene

var speed = 100

@onready var animation = get_node("AnimationPlayer")

func _physics_process(delta):

	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	if velocity.x == 0 and velocity.y == 0:
		animation.play("idle")
	if velocity.x == 0 and velocity.y < 0:
		animation.play("walk_up")
	elif velocity.x == 0 and velocity.y > 0:
		animation.play("walk_down")
		
	if velocity.x != 0:
		animation.play("walk_side")
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x > 0
	
	
	position += velocity * delta
	if Input.is_action_just_pressed("disparo"):
		disparar()

func disparar():
	var newbullet = bullet.instantiate()
	newbullet.global_position = $spaw_bullet.global_position
	owner.add_child(newbullet)
