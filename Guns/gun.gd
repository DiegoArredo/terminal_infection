extends Area2D

@onready var sprite = $pistol
@onready var shooting_ponint = $weaponpivot/shootingpoint

func _ready():
	$GunStateMachine.init(self,shooting_ponint,sprite)

func _proces(delta):
	$GunStateMachine._process(delta)
	
func _physics_process(delta):
	$GunStateMachine._physics_process(delta)


