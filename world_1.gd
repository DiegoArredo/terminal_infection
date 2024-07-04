extends Node2D





func _on_player_1_playerdied():
	get_tree().change_scene_to_file("res://Menu muerte/MenuMuerte.tscn")
