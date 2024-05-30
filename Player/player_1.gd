@icon ("res://Resources/01 Stranded - Starter Pack/Hero/Hero/Hero_icon.png")
extends CharacterBody2D

@export var inv: Inv
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer

var speed = 100


func _ready():
	$CharacterStateMachine.init(self, animated_sprite, animation)
func _physics_process(delta):
	$CharacterStateMachine._physics_process(delta)
func _process(delta):
	$CharacterStateMachine._process(delta)
	
func collect(item):
	inv.insert(item)
