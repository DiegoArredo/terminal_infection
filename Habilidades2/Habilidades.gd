extends Node2D
var habilidades = []
var habilidades_meta_data = []
var x
var level

signal addHabilidad(new: HabilidadAdapterPreview)
signal overwriteHabilidad(new: HabilidadAdapterOverwriting, old: HabilidadAdapterPreview)

@onready var habilidadComandNull = preload("res://Habilidades2/habilidadComandNull.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	habilidades[0] = habilidadComandNull.instantiate()
	habilidades[1] = habilidadComandNull.instantiate()
	habilidades[2] = habilidadComandNull.instantiate()

	cargar_meta_data()

func cargar_meta_data():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	habilidades[0].wait()
	habilidades[1].wait()
	habilidades[2].wait()
	
func  _from_level_up():
	if (habilidades[x].isClass("HabilidadComandNull")):
		habilidades[x] = getHabilidad()
	else:
		overwriting()
	change_x()
	level = level + 1
	
	
func get_meta_data_habilidad(x: int):
	for metaData: HabilidadMetaData in habilidades_meta_data:
		if 	(metaData.onLevel == level):
			return metaData
	
func overwriting():
	var habilidad_antigua = habilidades[x]
	var habilidad_nueva = getHabilidad()
	
	var adapterNew = HabilidadAdapterPreview.from_comand(habilidad_nueva, get_meta_data_habilidad(x).imagen)
	var adapterOld = HabilidadAdapterPreview.from_comand(habilidad_antigua, get_meta_data_habilidad(x).imagen)
	var adapterOverwriting = HabilidadAdapterOverwriting.from_adapter_old_and_new(adapterOld, adapterNew)
	
	overwriteHabilidad.emit()
	
	
func getHabilidad():
	var metaData: HabilidadMetaData = get_meta_data_habilidad(x)
	var habilidad = load(metaData.sceneFile)
	return habilidad.instance()
	
	
func change_x():
	if (x == 2):
		x = 0
	else:
		x = x + 1
