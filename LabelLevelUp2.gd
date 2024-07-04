extends Label
@onready var player = $"../../Player_1"

# Called when the node enters the scene tree for the first time.
func _ready():
	player.experience_changed.connect(update_label)
	update_label()


func update_label():
	text = "LEVEL "+ str(VariablesGlobales.level)
	
