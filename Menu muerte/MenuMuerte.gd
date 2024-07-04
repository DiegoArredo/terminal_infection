extends Control

func _ready():
	$Label2.text = "Puntaje: " + str(VariablesGlobales.puntaje + VariablesGlobales.tiempo_vivo)
	
func _on_jugar_de_nuevo_pressed():
	VariablesGlobales.reset()
	get_tree().change_scene_to_file("res://world_1.tscn")

func _on_salir_pressed():
	VariablesGlobales.reset()
	get_tree().change_scene_to_file("res://main.tscn")


func _on_jugar_2_pressed():
	VariablesGlobales.reset()
	get_tree().change_scene_to_file("res://Multiplayer/multiplayer_interface.tscn")
