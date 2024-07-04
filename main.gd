extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://world_1.tscn") 


func _on_exit_pressed():
	get_tree().quit()


func _on_online_pressed():
	get_tree().change_scene_to_file("res://Multiplayer/multiplayer_interface.tscn") 
