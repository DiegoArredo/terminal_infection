extends Control

var nodesControled
# Called when the node enters the scene tree for the first time.
func _ready():
	nodesControled = [$Control2, $guiLevelUpWithAnimations/CanvasLayer, $Control2/CanvasLayer, $guiLevelUpWithAnimations/CanvasLayer/levelUpAnimacion/CanvasLayer]
	visible_off_default()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func visible_on():
	for node in nodesControled:
		node.visible = true
	
func visible_off():
	for node in nodesControled:
		print(node)
		node.visible = false
	
func visible_off_default():
	visible_off()
