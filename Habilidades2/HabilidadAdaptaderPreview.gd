extends Control

class_name HabilidadAdapterPreview

var dps
var tecla
var imagen

static func from_comand(comand: HabilidadComand, imagen: Image):
	var object = HabilidadAdapterPreview.new()
	object.dps = comand.dps
	object.tecla = comand.tecla_designada
	object.imagen = imagen
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
