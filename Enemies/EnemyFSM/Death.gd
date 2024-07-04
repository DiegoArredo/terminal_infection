extends EnemyState


func Enter():
	VariablesGlobales.puntaje += parent.max_health
	VariablesGlobales.current_experience += 1
	player.experience_changed.emit()
	animation.play("death")
	$Timer.wait_time = 0.6
	$Timer.start()
	
func Update(_delta):
	pass

func Update_physics(_delta):
	pass
	
func Exit():
	pass


func _on_timer_timeout():
	parent.queue_free()
