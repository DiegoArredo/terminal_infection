extends Node2D
var habilidades
var x

@onready var habilidadComandNull = preload("res://Habilidades2/habilidadComandNull.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	habilidades[0] = habilidadComandNull.instantiate()
	habilidades[1] = habilidadComandNull.instantiate()
	habilidades[2] = habilidadComandNull.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	habilidades[0].wait()
	habilidades[1].wait()
	habilidades[2].wait()
	
func  _from_level_up():
	if (habilidades[x].isClass("HabilidadComandNull")):
		addHabilidad()
	else:
		overwriting()
	change_x()
	
	
func overwriting():
	var habilidad_antigua = habilidades[x]
	var habilidad_nueva = addHabilidad();
	
	HabilidadAdapterOverwriting.new()
	
func addHabilidad():
	pass
	
func change_x():
	pass
