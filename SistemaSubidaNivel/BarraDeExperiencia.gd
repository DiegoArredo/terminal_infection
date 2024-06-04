extends ProgressBar

signal level_up

var valor_orbe = 50
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_value_changed(value):
	if (value == 100):
		level_up.emit()
	


func _on_orbe_experiencia_body_entered(body):
	if (body.is_in_group("player")):
		value = value + valor_orbe
		
