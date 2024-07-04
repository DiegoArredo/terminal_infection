extends CharacterState

#@export var idle : State
#@export var walking : State

func Enter():
	animation.play("death")
	parent.playerdied.emit()

func Update(_delta):
	pass

func Update_physics(_delta):
	pass
	
func Exit():
	pass
