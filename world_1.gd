extends Node2D

func _process(delta):
	if $TileMap/Player.currenthealth <=0:
		get_tree().change_scene_to_file("res://Menu muerte/MenuMuerte.tscn")

