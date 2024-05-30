extends Node
class_name State

signal state_transition

@export var animation : AnimationPlayer
@export var animated_sprite : AnimatedSprite2D 
var parent : CharacterBody2D

func Enter():
	pass
	
func Update(_delta: float):
	pass
	
func Update_physics(_delta: float):
	pass
	
func Exit():
	pass

