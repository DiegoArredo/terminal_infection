extends CharacterBody2D
@export var bullet:PackedScene

var speed = 100

@onready var animation = get_node("AnimationPlayer")

func _physics_process(delta):
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
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
	
	
	if Input.is_action_just_pressed("disparo"):
		disparar()

func disparar():
	var newbullet = bullet.instantiate()
	newbullet.global_position = $spaw_bullet.global_position
	owner.add_child(newbullet)
