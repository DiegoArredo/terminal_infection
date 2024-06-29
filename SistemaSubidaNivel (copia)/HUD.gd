extends Control

signal level_up
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func from_level_up():
	level_up.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
