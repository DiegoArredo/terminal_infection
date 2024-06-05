extends EnemyState

func Enter():
	animation.play("attack")
	
func Update(_delta):
	if not animation.is_playing():
		state_transition.emit(self,"Idle")
		
func Update_physics(_delta):
	pass
func Exit():
	pass
	

