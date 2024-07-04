extends Label

var valor:
	set(newValor):
		valor = newValor
		text = text_default
		labelTextSet(valor)
		
var text_default
var changes = 0

@export var botton_reset: Button 

# Called when the node enters the scene tree for the first time.
func _ready():
	botton_reset = $"../../Ok_button"
	botton_reset.pressed.connect(_reset)
	
	
func _reset():
	changes = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setSuma(suma):
	changes = changes + suma
	if (abs(changes) < 3):
		valor = valor + suma
	

func labelSet(variable):
	labelSetDefault()
	labelTextSet(variable)
	labelValorSet(variable)
	
func labelSetDefault():
	text_default = text 

func labelTextSet(variable):
	text = str(variable)

func labelValorSet(variable):
	valor = variable
