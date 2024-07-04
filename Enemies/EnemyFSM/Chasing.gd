extends EnemyState


func Enter():
	parent.makepath()

	
func Update(_delta):

	
	if parent.velocity == Vector2.ZERO:
		state_transition.emit(self,"Idle")
		
	
	if parent.current_health == 0:
		state_transition.emit(self,"Death")
	
	if sqrt((parent.global_position.x-player.global_position.x)**2+ (parent.global_position.y-player.global_position.y)**2) < 20:
		state_transition.emit(self,"Attacking")
		
func Update_physics(_delta):
	
	if parent.velocity != Vector2.ZERO:
		animation.play("walk")

	#var direction=parent.global_position.direction_to(player.global_position)
	#parent.velocity =direction* 30
	#parent.move_and_slide()
	var direction = parent.to_local(parent.nav_agent.get_next_path_position()).normalized()
	parent.velocity =direction* 30
	parent.move_and_slide()
	
	if parent.velocity.x != 0:
		animated_sprite.flip_v = false
		animated_sprite.flip_h = parent.velocity.x < 0
		




func Exit():
	pass

