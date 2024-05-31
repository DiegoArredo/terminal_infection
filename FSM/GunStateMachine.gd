extends Node

@export var initial_state : GunState
@export var current_state : GunState
var states: Dictionary = {}

func init(parent: Area2D, shooting_point: Marker2D, sprite: Sprite2D):
	for child in get_children():
		if child is GunState:
			states[child.name.to_lower()] = child
			child.parent = parent
			child.sprite = sprite
			child.shooting_point = shooting_point
			child.state_transition.connect(change_state)
			
	if initial_state:
		initial_state.Enter()
		current_state = initial_state
			
func _process(delta):
	if current_state: 
		current_state.Update(delta)

func _physics_process(delta):
	if current_state:
		current_state.Update_physics(delta)


func change_state(state: GunState, new_state_name):
	if state != current_state:
		return

	var new_state = states.get(new_state_name.to_lower())
	
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	current_state = new_state
	print("Cambio de estado a: ",new_state_name)
