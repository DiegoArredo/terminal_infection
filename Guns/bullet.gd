extends Area2D
var damage=2
var traveller_distance = 0
func _physics_process(delta):
	const SPEED = 200
	const RANGE = 100
	var direction= Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	traveller_distance += SPEED * delta
	if traveller_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	if body.has_method("take_damage"):
		if body.current_health>0:
			body.take_damage(damage)
	queue_free()
