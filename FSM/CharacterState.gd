extends Node
class_name CharacterState

signal state_transition
var parent : CharacterBody2D
var animation : AnimationPlayer
var animated_sprite : AnimatedSprite2D

func Enter():
	pass
	
func Update(_delta: float):
	pass
	
func Update_physics(_delta: float):
	pass
	
func Exit():
	pass

