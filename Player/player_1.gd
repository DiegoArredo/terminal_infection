@icon ("res://Resources/01 Stranded - Starter Pack/Hero/Hero/Hero_icon.png")
extends CharacterBody2D

@export var inv: Inv
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer

@export var level = 1
@onready var max_experience = 2
@onready var current_experience = 0

signal experience_changed

var speed = 100


func _ready():
	$CharacterStateMachine.init(self, animated_sprite, animation)
func _physics_process(delta):
	$CharacterStateMachine._physics_process(delta)
func _process(delta):
	$CharacterStateMachine._process(delta)
	if current_experience == max_experience:
		level += 1
		max_experience = max_experience *2
		current_experience = 0
		experience_changed.emit()
	
func collect(item):
	inv.insert(item)
