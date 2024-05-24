extends CanvasLayer

@onready var menu: Node2D = $Menu

func _ready():
	menu.visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("pausa"):
		get_tree().paused = !get_tree().paused
		menu.visible = get_tree().paused

	
func _on_reanudar_pressed():
	get_tree().paused = false
	menu.visible = false

func _on_salir_pressed():
	get_tree().quit()


func _on_reiniciar_pressed():
	if menu.visible:
		menu.visible = false
	get_tree().reload_current_scene()
