extends EnemyState


func Enter():
	pass

func Update(_delta):
	var direction=parent.global_position.direction_to(player.global_position)
	parent.velocity =direction* 30
	parent.move_and_slide()
	
	if parent.velocity != Vector2.ZERO:
		state_transition.emit(self,"Chasing")
		
	if parent.current_health <= 0:
		state_transition.emit(self,"Death")
	
func Update_physics(_delta):
	animation.play("idle")
	
func Exit():
	pass
