extends LineEdit
var alpha_numeric_regex = RegEx.new()

func _ready():
	# Inicializa el patrón regex para alfanuméricos (letras y números)
	alpha_numeric_regex.compile("[^a-zA-Z0-9]")

	# Conecta la señal 'text_changed' a la función '_on_text_changed'

func _on_text_changed(new_text):
	if alpha_numeric_regex.search(new_text):
		var cc = get_caret_column()
		var result = alpha_numeric_regex.sub(new_text,"")
		text = result
		set_caret_column(cc)
