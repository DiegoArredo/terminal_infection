extends Node2D


var estadisticas_personaje = {
	"punteria": 10,
	"destreza": 20,
	"fuerza": 30,
	"inteligencia": 40,
	"reflejos": 50
}


var armas_inventario = [
	"pistola",
	"doble uzi",
	"pem"
]

var weapon_afinity = {
	"pistola": [0],
	"doble uzi": [1,4],
	"pem": [0,3]	
}
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Window/PanelContainer/VBoxContainer/Label.text = estadisticas_personaje.keys()[0] + ": " + str(estadisticas_personaje.values()[0])
	$Window/PanelContainer/VBoxContainer/Label2.text = estadisticas_personaje.keys()[1] + ": " + str(estadisticas_personaje.values()[1])
	$Window/PanelContainer/VBoxContainer/Label3.text = estadisticas_personaje.keys()[2] + ": " + str(estadisticas_personaje.values()[2])
	$Window/PanelContainer/VBoxContainer/Label4.text = estadisticas_personaje.keys()[3] + ": " + str(estadisticas_personaje.values()[3])
	$Window/PanelContainer/VBoxContainer/Label5.text = estadisticas_personaje.keys()[4] + ": " + str(estadisticas_personaje.values()[4])




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


	pass # Replace with function body.
	
	

func _on_menu_button_pressed():
	$Window2.visible = true
	set_weapon_changes()

func set_weapon_changes():
	for arma in armas_inventario:
		crear_nodo_con_arma(arma)
	
func crear_nodo_con_arma(arma):
	var label = Label.new()
	label.text = calcular_arma_afinidad(arma)
	$Window2/PanelContainer2/VBoxContainer.add_child(label)
	
func calcular_arma_afinidad(arma):
	return "1000"


func _on_barra_de_experiencia_value_changed(value):
	if value == 100:
		$Window.visible = true
	

