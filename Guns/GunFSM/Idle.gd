extends GunState

#@export var idle : State
#@export var walking : State

func Enter():
	print("Estado de Arma: ", self.name)
	
func Update(_delta):
	pass

func _on_gun_body_entered(body):
	print("Body entró")
	state_transition.emit(self,"Shooting")

func Update_physics(_delta):
	pass
	
func Exit():
	pass

