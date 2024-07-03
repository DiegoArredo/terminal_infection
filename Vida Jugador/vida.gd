extends ProgressBar


@onready var timer = $Timer
@onready var Daño = $"daño"

var health = 0 : set = _set_health
func init_health(_healt):
	health = _healt
	max_value = health
	value = health
	Daño.max_value = health
	Daño.value = health
	
func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	value = health

	if health < prev_health:
		timer.start()
	else:
		Daño.value = health

func _on_timer_timeout():
	Daño.value = health
