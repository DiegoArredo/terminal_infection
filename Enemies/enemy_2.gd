extends CharacterBody2D
@onready var player= get_node("/root/world_1/TileMap/Player/Player_1")
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer
@onready var healthBar = $BarraVida

@export var max_health = 10
@export var current_health = max_health

func _ready():
	$EnemyStateMachine.init(self, animated_sprite, animation,player)
	healthBar.init_health(current_health)
func _physics_process(delta):
	$EnemyStateMachine._physics_process(delta)
func _process(delta):
	$EnemyStateMachine._process(delta)

	
func take_damage():
	current_health-=1
	healthBar.health = current_health

