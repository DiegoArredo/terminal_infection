extends Area2D

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
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
