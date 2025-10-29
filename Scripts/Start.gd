extends StaticBody2D
@onready var starting_position = $StartingPosition

func get_spawn_position():
	if starting_position:
		return starting_position.global_position
	
	
