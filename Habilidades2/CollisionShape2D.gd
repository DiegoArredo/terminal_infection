extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	disabled = true # Rplace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _when_first_part_end():
	disabled = false
	
func _when_secund_part_end():
	disabled = true
