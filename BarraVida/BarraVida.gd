extends ProgressBar

@onready var timer = $Timer
@onready var BarraDaño = $"BarraDaño"
var health = 0 : set = _set_health

func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	value = health
	
	if health<= 0:
		queue_free()
	
	if health < prev_health:
		timer.start()
	else:
		BarraDaño.value = health
	
func init_health(health):
	max_value = health
	value = health
	BarraDaño.max_value = health
	BarraDaño.value = health


func _on_timer_timeout():
	BarraDaño.value = health
