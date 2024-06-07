extends Node2D

@onready var enemy_rute = get_node("/root/world_1/TileMap/Enemies")
@onready var Enemies = [
	load("res://Enemies/enemy_1.tscn"),
	load("res://Enemies/enemy_2.tscn"),
	load("res://Enemies/monster_1.tscn"),
	load("res://Enemies/monster_2.tscn")	
]
var bool_spawn = true
var random = RandomNumberGenerator.new()

func _ready() -> void:
	random.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn()

func spawn():
	if bool_spawn:
		$Timer.start()
		var i = random.randi_range(0,Enemies.size()-1)
		bool_spawn = false
		$Path2D/PathFollow2D.progress_ratio = random.randf()
		var enemy_instance = Enemies[i].instantiate()
		enemy_instance.position = $Path2D/PathFollow2D.global_position
		add_child(enemy_instance)

func _on_timer_timeout():
	bool_spawn = true
