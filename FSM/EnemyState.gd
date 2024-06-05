extends Node
class_name EnemyState

signal state_transition
var parent : CharacterBody2D
var animation : AnimationPlayer
var animated_sprite : AnimatedSprite2D
var player : CharacterBody2D

func Enter():
	pass
	
func Update(_delta: float):
	pass
	
func Update_physics(_delta: float):
	pass
	
func Exit():
	pass

