extends Control

var pocition_circle
var radio_circle
var tween
var redraw
var color_original
var color_actual

signal animationOn
signal animationOff
# Called when the node enters the scene tree for the first time.
func _ready():
	redraw = true
	self_modulate.a = 0
	color_original = get("self_modulate")
	color_actual = color_original
	
	

	

func animation():
	tween = create_tween()
	animation_easein()
	animation_espera(5)
	animacion_rojo()
	animation_espera(1.5)
	animation_easeout()
	

func animation_easein():
	animation_change_opacity(255)
	
	
	
func animation_espera(espera):
	tween.tween_property(self, "self_modulate", color_actual, espera)
	
func animacion_rojo():
	tween.tween_property(self, "self_modulate", Color(255,0,0,255), 0.2)
	color_actual = Color(255,0,0,255)
	
func animation_easeout():
	animation_change_opacity(0)
	
func animation_change_opacity(opacity):
	var color = get("self_modulate")
	color.a = opacity
	tween.tween_property(self, "self_modulate", color, 0.2)
	color_actual.a = opacity
	

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (redraw):
		queue_redraw()

func _draw():
	pocition_circle = Vector2(size.x / 2, size.y / 2)
	radio_circle = size.y / 2 
	draw_circle(pocition_circle, radio_circle, self_modulate)
