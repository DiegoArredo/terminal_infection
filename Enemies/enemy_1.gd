extends CharacterBody2D
@onready var player= get_node("/root/world_1/Player/Player_1")
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer
var heal = 10

func _ready():
	$EnemyStateMachine.init(self, animated_sprite, animation,player)
func _physics_process(delta):
	$EnemyStateMachine._physics_process(delta)
func _process(delta):
	$EnemyStateMachine._process(delta)

	
func take_damage():
	heal-=1

