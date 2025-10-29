extends Node2D
#Creacion de variables para una lista enumerada y seleccionar
@export_enum("apple","banana","cherry") var fruitType:String = "apple":
	set(value):
		fruitType = value
		#Movimiento
		
		$AnimatedSprite2D.animation = fruitType


# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		$AnimatedSprite2D.play(fruitType)



func _on_area_2d_body_entered(body):
	if body.has_method("collectFruit"):
		body.collectFruit(fruitType)
		$AnimatedSprite2D.play("collected")
		await get_tree().create_timer(1.0).timeout
		queue_free()
		print("Nodo que entra en el área:", body)

	else:
		print("El nodo no tiene el método 'collectFruit':", body)


func _on_animated_sprite_2d_animation_finished():
	#Cuando finalize collected entra aqui
	self.queue_free()
