extends CanvasLayer
#Atributos:
@onready var vida_label = $PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/vida_label
@onready var daño_label = $"PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/daño_label"
@onready var velocidad_label = $PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/velocidad_label
@onready var rango_label = $PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/rango_label
@onready var animacion_label_lvlup = $PanelContainer/MarginContainer/VBoxContainer/LevelupText_container/Animation_LevelUP_Canvas/LevelUp_animation

@onready var labels = [vida_label, daño_label, velocidad_label, rango_label]

var habilidad_selected
var vida
var daño
var velocidad
var rango

var variables

# Called when the node enters the scene tree for the first time.
func _ready():
	
	vida = VariablesGlobales.life
	daño = VariablesGlobales.damage
	velocidad = VariablesGlobales.velocidad
	rango = VariablesGlobales.rango
	
	variables = [vida, daño, velocidad, rango]
	
	for i in range(labels.size()):
		labels[i].labelSet(variables[i])
	animacion_label_lvlup.play("LevelUpAnimation")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if habilidad_selected == "Bala Magia":
		pass
	if habilidad_selected == "Magia Explosiva":
		var Magia_e = preload()
	VariablesGlobales.life = int($PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/vida_label.text)
	VariablesGlobales.daño = VariablesGlobales.daño + 0.5* int($"PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/daño_label".text)
	VariablesGlobales.velocidad = int($PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/velocidad_label.text)
	VariablesGlobales.rango = int($PanelContainer/MarginContainer/VBoxContainer/Atributos_Container/rango_label.text)
	get_tree().paused = false
	queue_free()


func _on_habilidades_container_emit_name_habilidad(nombre):
	habilidad_selected = nombre
