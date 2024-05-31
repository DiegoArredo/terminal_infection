extends Area2D

@onready var Enemy_Scene = load("res://Enemies/enemy_1.tscn")
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
		bool_spawn = false
		var enemy_instance = Enemy_Scene.instantiate()
		enemy_instance.position = Vector2(random.randi_range(80,45),randi_range(80,45))
		add_child(enemy_instance)



func _on_timer_timeout():
	bool_spawn = true
