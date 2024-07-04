extends CanvasLayer
#Atributos:
@onready var vida_label = $PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/vida_label
@onready var daño_label = $"PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/daño_label"
@onready var velocidad_label = $PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/velocidad_label
@onready var rango_label = $PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/rango_label
@onready var animacion_label_lvlup = $PanelContainer/MarginContainer/VBoxContainer/LevelupText_container/Animation_LevelUP_Canvas/LevelUp_animation
# Called when the node enters the scene tree for the first time.
func _ready():
	#Set de los atributos
	vida_label.text = vida_label.text + " (" + str($"/root/VariablesGlobales".life) + ")"
	daño_label.text = daño_label.text + " (" + str($"/root/VariablesGlobales".daño) + ")"
	velocidad_label.text = velocidad_label.text + " (" + str($"/root/VariablesGlobales".velocidad) + ")"
	rango_label.text = rango_label.text + " (" + str($"/root/VariablesGlobales".rango) + ")"
	animacion_label_lvlup.play("LevelUpAnimation")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	queue_free()
