extends CharacterBody2D

@onready var player= get_node("/root/world_1/Player/Player_1")
var heal=3
func  _physics_process(delta):
	var direction=global_position.direction_to(player.global_position)
	velocity =direction* 50
	move_and_slide()
func take_damage():
	heal-=1
	if heal==0:
		queue_free()
