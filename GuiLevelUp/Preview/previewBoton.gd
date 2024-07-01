extends CanvasLayer
var data_process
# Called when the node enters the scene tree for the first time.
func _ready():
	
	data_process = get_data_process_dummy()
	for i in range(data_process.size()):
		$Panel/GridContainer.get_children()[i].data_load(data_process[i])
		

func get_data_process_dummy():
	return [
	
		
		{"type": "gun",
		"dps": 20,
		"previus": 26},
		
		{"type": "gun",
		"dps": 10,
		"previus": 13},
		
		{"type": "gun",
		"dps": 20,
		"previus": 13},
		
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

