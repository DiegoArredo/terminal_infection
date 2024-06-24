extends Button

signal preseedWithValue(valor)
var valor

# Called when the node enters the scene tree for the first time.
func _ready():
	checkValor()


func checkValor():
	if (text == "+"):
		valor =  1
	else:
		valor = -1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	preseedWithValue.emit(valor) # Replace with function body.
