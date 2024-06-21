@icon ("res://Resources/01 Stranded - Starter Pack/Hero/Hero/Hero_icon.png")
extends CharacterBody2D


@export var inv: Inv
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer

@export var level = 1
@onready var max_experience = 2
@onready var current_experience = 0

signal experience_changed
var magia=preload("res://Habilidades/magia.tscn")
var speed = 100

@onready var tiempomagia = get_node("%TiempoAtaque")
@onready var ataqueMagia= get_node("%AtaqueMagia")

var magiaCantidad=0
var magiaBase=1
var magiaVelocidad=1.5
var magiaNivel = 1

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
		
		
