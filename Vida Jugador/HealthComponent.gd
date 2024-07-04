extends Area2D
class_name HealthComponent

signal damageTook
@onready var healthBar = $vida

@export var maxHealth : int=1
var currentHealt: int=0

func _ready() -> void:
	currentHealt = maxHealth
	healthBar.init_health(maxHealth)

func take_heal(value : int):
	set_health(value)

func takeDamage(damage : int):
	var value = abs(damage)
	set_health(-value)
	healthBar.health = currentHealt

func set_health(value : int):
	currentHealt+=value
	currentHealt = clamp(currentHealt,0,maxHealth)
	
	if currentHealt <=0:
		get_tree().change_scene_to_file("res://Menu muerte/MenuMuerte.tscn")

