extends CanvasLayer

var score_label

func _ready():
	print("Canvas Layer ready")
	score_label = $FruitsPointsLabel
	update_score(0)

func update_score(fruitCount: int):
	if score_label:
		get_node("FruitsPointsLabel").text = "Fruits Points:" + str(fruitCount)
	else:
		print("No se encontro el nodo FruitPointsLabel en player_info")
	
