extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$WebSocket.obtener_puntajes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $CanvasLayer/PanelContainer/VBoxContainer/LineEdit.text == "":
		$CanvasLayer/PanelContainer/VBoxContainer/Play_button.disabled = true
	else:
		$CanvasLayer/PanelContainer/VBoxContainer/Play_button.disabled = false
		


func _on_play_button_pressed():
	$"/root/VariablesGlobales".nombre = $CanvasLayer/PanelContainer/VBoxContainer/LineEdit.text
	get_tree().change_scene_to_file("res://Multiplayer/world_multiplayer.tscn")
