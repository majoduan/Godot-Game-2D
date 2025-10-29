extends Area2D

@onready var animated_spride = $AnimatedSprite2D

func animate():
	animated_spride.play("exitarea_reached")
	
