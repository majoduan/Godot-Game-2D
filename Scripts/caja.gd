extends Area2D
signal pregunta_iniciada

# Declara la variable para almacenar la referencia a PanelNode
var panel: Control


func _ready():
	# Intenta obtener el nodo PanelNode
	panel = get_node("Panel")

	if panel:
		print("Panel encontrado:", panel)
	else:
		print("No se encontró el nodo 'Panel' dentro de 'Caja'. Verifica la estructura.")

func _on_body_entered(body):
	if panel:
		panel.mostrar_pregunta()
		print("Mostrando pregunta en el PanelNode")
	else:
		print("PanelNode no encontrado, no se puede mostrar la pregunta.")
		
	$AnimatedSprite2D.play("Break")
	await get_tree().create_timer(1.0).timeout  # Espera 1 segundo
	queue_free()  # Destruye el nodo actual


func _on_animated_sprite_2d_animation_finished():
	# Verifica si la animación terminada es "Brek"
	if $AnimatedSprite2D.animation == "Break":
		# Reproducir la animación "Hit"
		$AnimatedSprite2D.play("Hit")
	elif $AnimatedSprite2D.animation == "Hit":
		# Quitar la caja del escenario o marcarla como invisible
		queue_free()  # Destruye el nodo
