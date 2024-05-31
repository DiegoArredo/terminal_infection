extends Node2D

# Referencia al nodo PathFollow2D, asegúrate de que la ruta es correcta
@onready var path_follow = $PathFollow2D

func spawn_mob():
	var new_mob = preload("res://Enemies/enemy_1.tscn").instantiate()
	path_follow.progress_ratio = randf()
	new_mob.global_position = path_follow.global_position
	add_child(new_mob)
	
func _on_Timer_timeout():
	spawn_mob()

