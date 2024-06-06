extends GridContainer

var tween: Tween
var duracion: int = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	tween = create_tween()
	tween.set_parallel(true)
	charge_animation_of_opacity()


func play():
	tween.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func charge_animation_of_opacity():	
	
	for child in get_children():
		if (child.is_class("Label")):
			labelOpacity(child)
		if (child.is_class("Button")):
			butonOpacity(child)			
	
	
func labelOpacity(child: Label):
	pass
	
			
		
func butonOpacity(child: Button):
	var style = StyleBoxFlat.new()
	style.bg_color = Color(100,100,100,1)
	child.add_theme_stylebox_override("normal", style)
	tween.tween_property(style,"bg_color",Color(100,100,100,0), duracion)
	
	


	
	
