extends Control


func _on_jugar_de_nuevo_pressed():
	get_tree().change_scene_to_file("res://world_1.tscn")

func _on_salir_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
