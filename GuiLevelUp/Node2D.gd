extends Node2D

signal request_on

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _from_guiLevelUpAnimations_request():
	request_on.emit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
