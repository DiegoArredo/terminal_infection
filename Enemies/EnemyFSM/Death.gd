extends EnemyState


func Enter():
	animation.play("death")
	player.current_experience += 1
	player.experience_changed.emit()
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
