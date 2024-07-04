extends "res://Habilidades2/habilidadComand.gd"



class_name CampoHechizo
# Called when the node enters the scene tree for the first time.



func _ready():
	tecla_designada = "z"

func execute():
	var circle = $circleMagic
	circle.animation()
	await circle.second_part_end
	executeEnd.emit()
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	body.take_damage(10)
	
