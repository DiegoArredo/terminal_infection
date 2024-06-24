extends Control

var superior = false
var inferior = false
var GREEN = "29936a"
var RED = "a51614"
var modulate_reference
# Called when the node enters the scene tree for the first time.
func _ready():
	modulate_reference = modulate

func data_load(dataProcess: Dictionary):
	var color
	
	if (dataProcess.get("previus") < dataProcess.get("dps")):
		$GridContainer/ColorRect2/upgrade.visible = true
		color = GREEN
	else:
		$GridContainer/ColorRect2/Downgrade.visible = true
		color = RED
		
	$GridContainer/ColorRect2/VBoxContainer/Label2.modulate = color
	
	$GridContainer/ColorRect2/VBoxContainer/Label.text = str(dataProcess.get("type"))
	$GridContainer/ColorRect2/VBoxContainer/Label2.text = str(dataProcess.get("dps"))
	$GridContainer/ColorRect2/VBoxContainer/Label3.text = str(dataProcess.get("previus"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (superior && inferior):
		modulate = modulate_reference
	else:
		modulate = Color(0,0,0,0)
		
		


func _on_limite_superior_area_entered(area):
	superior = true


func _on_limite_inferior_area_entered(area):
	inferior = true


func _on_limite_superior_area_exited(area):
	superior = false


func _on_limite_inferior_area_exited(area):
	inferior = false
