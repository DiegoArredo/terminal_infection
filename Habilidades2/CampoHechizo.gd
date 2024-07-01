extends "res://Habilidades2/habilidadComand.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	var circle = $circleMagic
	var circle_modulate: Color = circle.get("modulate")
	var new_circle_modulate = Color(circle_modulate.r, circle_modulate.g, circle_modulate.b, 255)
	tween.tween_property(circle, "modulate", new_circle_modulate, 3)
	tween.play()

func execute():
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
