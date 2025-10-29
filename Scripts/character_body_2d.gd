extends CharacterBody2D
class_name Player
var speed := 120
var direccion := 0.0
#Refrencia al canvas layer de player_info
var player_info: CanvasLayer

# Para el salto que no salte y salte lo que creamos es una variable
var jump := 250
# Gravedad
const gravity := 9
#Variable de contador para la suma de las frutas
var fruitCount = 0
# Referencia a las animaciones
@onready var anim := $AnimationPlayer
# Referencia al sprite
@onready var sprite := $Sprite2D

func _physics_process(delta):	
	# Movimiento de dirección de izquierda a derecha
	if Input.is_action_pressed("move_left"):
		direccion = -1
	elif Input.is_action_pressed("move_right"):
		direccion = 1
	else:
		direccion = 0
	
	velocity.x = direccion * speed
	
	# Movimiento y animaciones
	if direccion != 0:
		anim.play("walk")
	else:
		anim.play("idle")
	
	# Salto - solo permite el salto si está en el suelo y se presiona "jump"
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		$AudioStreamPlayer2D.play()
		velocity.y -= jump
	
	# Para voltear el sprite
	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h
	
	# Agregar la gravedad
	velocity.y += gravity
	
	move_and_slide()
	
func _ready():
	player_info = get_node("../PlayerInfo")
	var start_node =  get_node("../Start")
	if start_node:
		global_position = start_node.get_spawn_position()
		print("Jugador iniciado es posicion:", global_position)
	else:
		print("Start ndo no encontrado")

func collectFruit(fruitType):
	var auxString = fruitType + "Points"
	var gainedPonts = GeneralRules[auxString]
	fruitCount += gainedPonts
	print(fruitCount)
	
	#Notificacion al canvas layer
	var playerInfo = get_node("../PlayerInfo")
	if playerInfo:
		playerInfo.update_score(fruitCount)
