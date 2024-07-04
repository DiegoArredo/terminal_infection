@icon ("res://Resources/01 Stranded - Starter Pack/Hero/Hero/Hero_icon.png")
extends CharacterBody2D

@export var inv: Inv
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer

var magia=preload("res://Habilidades/magia.tscn")
var speed = 100

@onready var tiempomagia = get_node("%TiempoAtaque")
@onready var ataqueMagia= get_node("%AtaqueMagia")
var current_health = VariablesGlobales.life

var magiaCantidad=VariablesGlobales.magiaCantidad
var magiaBase=1
var magiaVelocidad=1.5
var magiaNivel = 1

signal experience_changed
signal levelup
signal playerdied

func _ready():
	$CharacterStateMachine.init(self, animated_sprite, animation)
	
func _physics_process(delta):
	$CharacterStateMachine._physics_process(delta)
	
func _process(delta):
	$CharacterStateMachine._process(delta)
	if VariablesGlobales.current_experience >= VariablesGlobales.max_experience:
		levelup.emit()
		VariablesGlobales.level += 1
		VariablesGlobales.max_experience = VariablesGlobales.max_experience *1.5
		VariablesGlobales.current_experience = 0
		experience_changed.emit()

func collect(item):
	inv.insert(item)
	
func ataqueHailidad():
	if magiaNivel>0:
		tiempomagia.wait_time=magiaVelocidad
		if tiempomagia.is_stopped():
			tiempomagia.start()


func _on_tiempo_ataque_timeout():
	magiaCantidad+=magiaBase
	tiempomagia.start()
	
func _on_ataque_magia_timeout():
	if magiaCantidad>0:
		var magia_ataque = magia.instantiate()
		magia_ataque.position=position
		magia_ataque.ultimo_movimiento=Input.get_vector("left", "right", "up", "down")
		magia_ataque.level=magiaNivel
		add_child(magia_ataque)
		
		if magiaCantidad>0:
			ataqueMagia.start()
		else:
			ataqueMagia.stop()
		


func _on_health_component_damage_took():
	current_health = $HealthComponent.currentHealt
