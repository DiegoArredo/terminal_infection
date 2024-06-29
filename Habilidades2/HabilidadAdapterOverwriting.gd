extends "res://Habilidades2/HabilidadAdaptaderPreview.gd"

class_name HabilidadAdapterOverwriting
var betterBool

func _init():
	pass

	
static func from_adapter_old_and_new(adapterOld: HabilidadAdapterPreview, adapterNew: HabilidadAdapterPreview):
	var object = HabilidadAdapterOverwriting.new()
	object.imagen = adapterNew.imagen
	object.dps = adapterNew.dps
	object.tecla = adapterNew.tecla
	
	if (adapterOld.dps < adapterNew.dps):
		object.betterBool = true
	else:
		object.betterBool = false
		
	return object
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
