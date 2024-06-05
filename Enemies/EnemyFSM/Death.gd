extends EnemyState


func Enter():
	animation.play("death")
	$Timer.wait_time = 10
	$Timer.start()
	
func Update(_delta):
	pass

func Update_physics(_delta):
	pass
	
func Exit():
	pass


func _on_timer_timeout():
	parent.queue_free()
