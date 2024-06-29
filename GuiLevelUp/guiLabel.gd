extends Label

var propiedad = ""
var numero = 0
var changes = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setText(propiedad_, numero_):
	propiedad = propiedad_
	numero = numero_
	text = propiedad + ": " + str(numero)
	
func actualizar():
	text = propiedad + ": " + str(numero)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset():
	changes = 0

func _on_button_preseed_with_value(valor):
	var changeCache = changes + valor
	if (abs(changeCache) < 3):
		changes = changeCache
	if (abs(changeCache) != 3):
		numero = numero + valor
		actualizar()
