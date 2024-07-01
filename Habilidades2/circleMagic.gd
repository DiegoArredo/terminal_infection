extends Control

var pocition_circle
var radio_circle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	pocition_circle = Vector2(size.x / 2, size.y / 2)
	radio_circle = size.y / 2 
	draw_circle(pocition_circle, radio_circle, modulate)
