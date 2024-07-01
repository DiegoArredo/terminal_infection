extends Control

signal pedir_datos_a_player(localData)
signal close_boton
var datos_from_player
var number_of_labels_in_container = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	start()
	
func start():
	mock_datos_conseguidos_de_player()
	insertar_datos()
	
	
func test():
	visible = true
	mock_datos_conseguidos_de_player()
	insertar_datos()

	
	
func datos_conseguidos_de_player():
	await pedir_datos_a_player.emit(datos_from_player)	

	
func mock_datos_conseguidos_de_player():
	datos_from_player = {
	"punteria": 10,
	"destreza": 20,
	"fuerza": 30,
	"inteligencia": 40,
	"reflejos": 50
}

	
func insertar_datos():
	var gridContainer = getGridContainer()
	var labels = extraerLabels(gridContainer)
	ingresar_en_labels(labels)
	
func getGridContainer():
	return $PanelContainer3/GridContainer
		
func extraerLabels(gridContainer):
	var labels = []
	for column in range(number_of_labels_in_container):
		var label = getLabelFromColumn(column, gridContainer)
		labels.append(label)
	return labels
		
func getLabelFromColumn(column, gridContainer):
		if column == 0:
			return gridContainer.get_node("Label")
		else:
			return gridContainer.get_node("Label" + str(column + 1))
	
	
		
func ingresar_en_labels(labels):
	for i in range(labels.size()):
		var label = labels[i]
		var propiedad = datos_from_player.keys()[i]
		var valor = datos_from_player.values()[i]
		label.setText(propiedad, valor)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func reset_values():
	var gridContainer = getGridContainer()
	var labels = extraerLabels(gridContainer)
	for label in labels:
		label.reset()
	

func _on_button_pressed():
	close_boton.emit()
	reset_values()
	
	
