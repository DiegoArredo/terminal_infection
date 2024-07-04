extends Node2D
@onready var player=load("res://Player/player_1.gd")

@onready var player1=$"../Player/Player_1"

@onready var enemy_rute = get_node("/root/world_1/TileMap/Enemies")
@onready var Enemies1=[load("res://Enemies/enemy_1.tscn")]
@onready var Enemies2=[load("res://Enemies/enemy_2.tscn")]
@onready var Enemies3=[load("res://Enemies/monster_1.tscn")]
@onready var Enemies4=[load("res://Enemies/monster_2.tscn")]
@onready var Boos=[load("res://Enemies/Boss_1.tscn")]
@onready var Boos2=[load("res://Enemies/boss_2.tscn")]
var bool_spawn = true
var random = RandomNumberGenerator.new()

func _ready() -> void:
	random.randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn()

func spawn():
	var level=$"/root/VariablesGlobales".level
	if bool_spawn:
		$Timer.start()
		bool_spawn=false
		$Path2D/PathFollow2D.progress_ratio = random.randf()
		if level>=1 && level<3:
			var enemy_instance=Enemies1[0].instantiate()
			enemy_instance.position = $Path2D/PathFollow2D.global_position
			add_child(enemy_instance)
		#if level==5:
			#var boos2_instance=Boos2[0].instantiate()
			#boos2_instance.position=$Path2D/PathFollow2D.global_position
			#add_child(boos2_instance)
		if level>=3 && level<8:
			var enemy_instance1=Enemies1[0].instantiate()
			var enemy_instance2=Enemies2[0].instantiate()
			enemy_instance1.position = $Path2D/PathFollow2D.global_position
			enemy_instance2.position = $Path2D/PathFollow2D.global_position
			add_child(enemy_instance1)
			add_child(enemy_instance2)
		if level==10:
			var boos_instance=Boos[0].instantiate()
			boos_instance.position=$Path2D/PathFollow2D.global_position
			add_child(boos_instance)
		if level>=8 && level<12:
			var enemy_instance1=Enemies1[0].instantiate()
			var enemy_instance2=Enemies2[0].instantiate()
			var enemy_instance3=Enemies3[0].instantiate()
			enemy_instance1.position = $Path2D/PathFollow2D.global_position
			enemy_instance2.position = $Path2D/PathFollow2D.global_position
			enemy_instance3.position = $Path2D/PathFollow2D.global_position
			add_child(enemy_instance1)
			add_child(enemy_instance2)
			add_child(enemy_instance3)
			
func _on_timer_timeout():
	bool_spawn = true


