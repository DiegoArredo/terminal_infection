extends HBoxContainer



var cards = [
	preload("res://GUI_test/Cards_habilidades/Card_habilidad_1.tscn").instantiate(),
	preload("res://GUI_test/Cards_habilidades/Card_habilidad_2.tscn").instantiate(),
	preload("res://GUI_test/Cards_habilidades/Card_habilidad_3.tscn").instantiate(),
	preload("res://GUI_test/Cards_habilidades/Card_habilidad_4.tscn").instantiate()
]


func _ready():
	cards.shuffle()
	cards.resize(3)
	for card in cards:
		card.seleccionada.connect(seleccionar_card)
		add_child(card)

func seleccionar_card(card_selected):
	var cards = self.get_children()
	for card in cards:
		if card.selected:
			card.modulate = Color(1,1,1)
			card.selected = false
	card_selected.modulate = Color(0.5, 0.5, 0.5)
	card_selected.selected = true
	#mala practica: pero poco tiempo queda
	#	$"../../../..".habilidad_seleccionada = card_selected.nodo_habilidad
		
