extends TextureButton

@export var suma = 1
@export var label: Label 

# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(_on_press)

func _on_press():
	label.setSuma(suma)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
