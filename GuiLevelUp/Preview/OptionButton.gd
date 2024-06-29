@tool
extends Button
var hold: bool = false
@export var y_for_limit = 300

var limite_superior: int
var limite_inferior: int

signal moved(delta_y)

# Called when the node enters the scene tree for the first time.
func _ready():
	limite_inferior = position.y
	limite_superior = position.y + y_for_limit
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var positionMouseY = get_global_mouse_position().y
	if (hold && (positionMouseY < limite_superior) && (limite_inferior < positionMouseY)):
		var delta_y = positionMouseY - position.y
		position.y = positionMouseY
		moved.emit(delta_y)
		
		



func _on_button_up():
	hold = false

	


func _on_button_down():
	hold = true

