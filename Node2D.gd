extends Node2D

var tween

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/AnimationPlayer.play("LevelUpAnimation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
