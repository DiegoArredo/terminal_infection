extends CharacterState

#@export var idle : State
#@export var attacking : State
var speed = 60

func Enter():
	pass

func Update(_delta): 	
	if parent.current_health  <= 0:
		state_transition.emit(self,"Death")

func Update_physics(_delta):	
	var direction = Input.get_vector("left", "right", "up", "down")
	parent.velocity = direction * speed
	parent.move_and_slide()
	
	if parent.velocity.x == 0 and parent.velocity.y == 0:
		state_transition.emit(self,"Idle")
	if parent.velocity.x == 0 and parent.velocity.y < 0:
		animation.play("walk_up")
	elif parent.velocity.x == 0 and parent.velocity.y > 0:
		animation.play("walk_down")
		
	if parent.velocity.x != 0:
		animation.play("walk_side")
		animated_sprite.flip_v = false
		animated_sprite.flip_h = parent.velocity.x > 0
		
func Exit():
	pass
