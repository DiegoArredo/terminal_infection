extends "res://Habilidades2/habilidadComand.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func execute():
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_body_entered(body: CharacterBody2D):
	if (body.is_in_group("enemigos")):
		print("dentro")
		
