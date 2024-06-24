extends Node2D

signal request_on
signal visible_off
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _request_from_guiLevelUpAnimations():
	request_on.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func passFrom_closeBoton_visibleOffLabel():
	visible_off.emit()
