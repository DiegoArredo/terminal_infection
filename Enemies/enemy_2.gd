extends CharacterBody2D
class_name Enemy2

@onready var player= $"../../Player/Player_1"
@onready var animated_sprite = $AnimatedSprite2D
@onready var animation = $AnimationPlayer
@onready var healthBar = $BarraVida
@onready var nav_agent = $NavigationAgent2D
@onready var agent_timer = $"../agentTimer"

@onready var max_health = VariablesGlobales.life_enemy2
@onready var current_health = max_health

func _ready():
	$EnemyStateMachine.init(self, animated_sprite, animation,player)
	healthBar.init_health(current_health)
	agent_timer.timeout.connect(makepath)
func _physics_process(delta):
	$EnemyStateMachine._physics_process(delta)
func _process(delta):
	$EnemyStateMachine._process(delta)

func makepath():
	nav_agent.target_position = player.global_position
		
func take_damage(damage:int):
	current_health-=damage
	healthBar.health = current_health

