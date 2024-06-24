extends CharacterBody2D
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
