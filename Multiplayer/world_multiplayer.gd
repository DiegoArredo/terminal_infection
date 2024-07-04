extends Node2D



func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_1_levelup():
	var gui = preload("res://GUI_test/LevelUP_HUD.tscn")
	gui = gui.instantiate()
	gui.process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	add_child(gui)
	get_tree().paused = true
	
	


func _on_in_game_time_timeout():
	VariablesGlobales.tiempo_vivo +=1
	#print(VariablesGlobales.puntaje)
	


func _on_player_1_playerdied():
	get_tree().change_scene_to_file("res://Multiplayer/MenuMuerteOnline.tscn")
	
