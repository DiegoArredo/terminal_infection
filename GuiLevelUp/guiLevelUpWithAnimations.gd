extends Control
signal close_boton
signal level_up_activation_gui

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func from_level_up():
	level_up_activation_gui.emit()


func _on_gui_level_up_close_boton():
	close_boton.emit()
