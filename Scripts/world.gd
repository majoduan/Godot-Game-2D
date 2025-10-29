extends Node2D
#Nuevo nivel adjuntado
@export var next_level: PackedScene = null # creacion a nivel de propiedades para el nuevo nivel
@export var level_time = 35 # variable que puede modificarse por nivel
@export var is_final_level: bool = false

@onready var start_position = $StartPosition
@onready var player = $CharacterBody2D #referencia al jugador
@onready var start_scenario = $Start
@onready var exit_area= $ExitArea

#Zona de muerte
@onready var deathzone = $Danger_zone
#Aparezca el tiempo
@onready var uid = $UILayer

#Para cuando generamos tiempo para el player
var timer_node = null
var time_left
var winner = false

#Funcion para tiempo en pantalla 
func _on_level_timeout():
	if not winner:
		time_left -= 1
		uid.set_time_label(time_left)#poner tiempo en pantalla
		
		if time_left <= 0:
			reset_player()
			time_left = level_time
			uid.set_time_label(time_left)#poner tiempo en pantalla
# Called when the node enters the scene tree for the first time.
func _ready():
	#Manejamos el tiempo
		#manejo de timepo
	timer_node = Timer.new()
	timer_node.name = "level TImer"
	timer_node.wait_time = 1
	timer_node.timeout.connect(_on_level_timeout)
	add_child(timer_node)
	time_left = level_time
	timer_node.start()
	uid.set_time_label(time_left)#poner tiempo en pantalla
	
	player.global_position = start_scenario.get_spawn_position()
	
	
	exit_area.body_entered.connect(_on_exit_body_entered)
	
	#Trampas
	var tramps = get_tree().get_nodes_in_group("tramps")
	for tramp in tramps:
		tramp.connect("touch_player",_on_saw_touch_player)
	

#Fucion cuando el jugador entre a la zona de finalizar nivel
func _on_exit_body_entered(body):
	if body is CharacterBody2D:
		winner = true
		exit_area.animate()
		if is_final_level || next_level == null:
			uid.show_win_screen()
		elif next_level != null:
			await get_tree().create_timer(1.5).timeout # esperar un tiempo antes de mandar al siguiente nivel
			body.set_Active(false) #prohibir el movimiento al jugador
			get_tree().change_scene_to_packed(next_level)#irnos a otro nivel 

func _on_saw_touch_player():
	reset_player()
	
func reset_player():
	player.velocity = Vector2.ZERO
	#player.global_position = start_position.global_position
	player.global_position = start_scenario.get_spawn_position()
