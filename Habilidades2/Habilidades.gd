extends Node2D
var level = 1
var enable_slot = [false, false, false]
var positionPlayer = Vector2(0,0)

signal requestPositionPlayer(node)
signal receibedPositionPlayer

signal addHabilidad(new: HabilidadAdapterPreview)
signal overwriteHabilidad(new: HabilidadAdapterOverwriting, old: HabilidadAdapterPreview)

# Called when the node enters the scene tree for the first time.
func _ready():
	_from_level_up()
	
func test():
	_from_level_up()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_physical_key_pressed(KEY_Z) && enable_slot[0]):
		campo_hechizo()
		
		
	
func  _from_level_up():
	level = level + 1
	if (level < 5):
		enable_slot[level - 2] = true



func campo_hechizo():
	hability_command("res://Habilidades2/CampoHechizo.tscn")



func hability_command(path):
	requestPositionPlayer.emit(self)
	await receibedPositionPlayer
	var escena = load(path)
	var node = escena.instantiate()
	node.position = positionPlayer
	add_child(node)
	node.execute()
	await node.executeEnd
	node.queue_free()
	
