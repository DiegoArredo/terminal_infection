extends ProgressBar
signal levelUp
var umbral = 2

@onready var player = $"../../Player_1"

# Called when the node enters the scene tree for the first time.
func _ready():
	print(player.max_experience)
	player.experience_changed.connect(update)
	update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update():
	max_value = player.max_experience
	value = player.current_experience
	
	if (value == umbral):
		umbral = umbral * 2
		levelUp.emit()
	
