extends ColorRect

var superior = false
var inferior = false
var trasparent = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (superior && inferior):
		modulate = Color(255,255,255,255)
	else: 
		modulate = Color(0,0,0,0)



func _on_area_superior_entered(area):
	superior = true
	if (inferior):
		change()
	


func _on_area_inferior_entered(area):
	inferior = true

func change():
	if (trasparent):
		trasparent = false
	else:
		trasparent = true

	


func _on_area_inferior_exited(area):
	inferior = false


func _on_area_superior_exited(area):
	superior = false

