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

func set_to_invisible():
	for child in get_children():
		child.modulate = Color(255,255,255,0)

func charge_animation_of_opacity():	
	for child in get_children():
		var modulate_duplicate = child.get("modulate")
		modulate_duplicate.a = 255
		tween.tween_property(child, "modulate", modulate_duplicate, 40)


	
	
