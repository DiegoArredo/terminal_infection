extends CharacterBody2D
@onready var _animated_sprite=$AnimatedSprite2D
@onready var player= get_node("/root/world_1/Player/Player_1")
var heal=2
func  _physics_process(delta):
	var direction=global_position.direction_to(player.global_position)
	velocity =direction* 50
	move_and_slide()
func take_damage(damage:int):
	heal-=damage
	if heal==0 :
		_animated_sprite.play("hurt")
		queue_free()
