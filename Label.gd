extends Label
@onready var player = $"../../Player_1"

# Called when the node enters the scene tree for the first time.
func _ready():
	print(player.max_experience)
	player.experience_changed.connect(update)
	update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update():
	text = "LEVEL "+ str(player.level)
	
