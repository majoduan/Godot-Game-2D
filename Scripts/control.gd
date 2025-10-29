extends Control

signal pregunta_iniciada

# Declara la variable para almacenar la referencia a PanelNode
var pregunta_actual = "¿Cuánto es 2+2?"
var respuesta_correcta = "4"
var tiempo_para_ocultar = 3.0  # Duración en segundos para mostrar la pregunta

func mostrar_pregunta():
	# Cambia la ruta según la estructura de tu escena
	var panel = get_node("Control")
	if panel:
		panel.visible = true
		var label = panel.get_node("Label")
		if label:
			label.text = pregunta_actual
		else:
			print("No se encontró el nodo 'Label' dentro de 'Panel'.")

		# Programar el ocultamiento del panel después de un tiempo
		get_tree().create_timer(tiempo_para_ocultar).timeout.connect(func():
			panel.visible = false
		)
	else:
		print("No se encontró el nodo 'Panel'.")

func verificar_respuesta(respuesta: String) -> bool:
	var panel = get_node("Control")
	if respuesta == respuesta_correcta:
		if panel:
			panel.visible = false
		return true
	else:
		return false

func _on_text_submitted(respuesta: String) -> void:
	if verificar_respuesta(respuesta):
		print("¡Respuesta correcta!")
	else:
		print("Respuesta incorrecta, intenta de nuevo")
