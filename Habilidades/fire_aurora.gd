extends Area2D
@export var level : int
@export var tiempo_espera: float
@export var tamaño_area: float


func _process(delta):
	pass

func _on_body_entered(body):
	print("fire entro")
	if body.has_method("take_damage"):
		print("Entro body a quemarse")
		body.add_to_group("enemies_on_fire")
		
func _on_body_exited(body):
	#if body.has_method("apply_effect"):
		#body.apply_effect("burn",$Damage_timer,$duration_timer)
	print("fire salio")
	if body.has_method("take_damage"):
		print("Salio body")
		body.remove_from_group("enemies_on_fire")
		

func _on_damage_timer_timeout():
	#print("Burn")
	get_tree().call_group("enemies_on_fire", "take_damage")
	
