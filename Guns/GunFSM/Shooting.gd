extends GunState
var can_shoot = true
@export var cooldown : float

func Enter():
	print("Estado Arma: ",self.name)
	$Timer.wait_time = 0.25
	
func Update(_delta):
	var enemies_in_range = parent.get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		parent.look_at(target_enemy.global_position)
		shoot()
	else:
		state_transition.emit(self,"Idle")
	
func Update_physics(_delta):
	pass
		
func Exit():
	pass


func shoot():
	if not can_shoot:
		return
	can_shoot = false
	$Timer.start()
	const BULLET = preload("res://Guns/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position= shooting_point.global_position
	new_bullet.global_rotation=shooting_point.global_rotation
	shooting_point.add_child(new_bullet)
	
	
func _on_timer_timeout():
	can_shoot = true
