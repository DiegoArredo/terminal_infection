extends Node


@export var initial_state : CharacterState
@export var current_state : CharacterState
var states: Dictionary = {}


func init(parent: CharacterBody2D, animated_sprite: AnimatedSprite2D, animation: AnimationPlayer):
	for child in get_children():
		if child is CharacterState:
			states[child.name.to_lower()] = child
			child.parent = parent
			child.animated_sprite = animated_sprite
			child.animation = animation
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


func change_state(state: CharacterState, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	
	if current_state:
		current_state.Exit()
		
	new_state.Enter()
	current_state = new_state
	#print("Cambio de estado a: ",new_state_name)
