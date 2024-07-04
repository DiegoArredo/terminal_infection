extends CharacterState

#@export var walking : State
#@export var attacking : State

func Enter():
	pass

func Update(_delta):
	if parent.current_health  <= 0:
		state_transition.emit(self,"Death")
	
	if (Input.get_vector("left","right","up","down")):
		state_transition.emit(self,"Walking")

func Update_physics(_delta):
	animation.play("idle")
	
func Exit():
	pass
