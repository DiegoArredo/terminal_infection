extends Area2D
class_name HealthComponent

signal damageTook
@onready var healthBar = $vida
@onready var maxHealth = VariablesGlobales.life
var currentHealt: int

func _ready() -> void:
	currentHealt = maxHealth
	healthBar.init_health(maxHealth)

func take_heal(value : int):
	set_health(value)

func takeDamage(damage : int):
	var value = abs(damage)
	set_health(-value)
	healthBar.health = currentHealt
	damageTook.emit()

func set_health(value : int):
	currentHealt+=value
	currentHealt = clamp(currentHealt,0,maxHealth)
	

