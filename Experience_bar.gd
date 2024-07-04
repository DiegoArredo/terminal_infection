extends ProgressBar
@onready var player = $"../../Player_1"

# Called when the node enters the scene tree for the first time.
func _ready():
	player.experience_changed.connect(update)
	update()


func update():
	max_value = VariablesGlobales.max_experience
	value = VariablesGlobales.current_experience

	
