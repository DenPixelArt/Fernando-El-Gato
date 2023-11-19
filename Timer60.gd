extends CanvasLayer

var timer_game: Timer
var tiempo_restante: int = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_game = get_node("../OneSec")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = str(tiempo_restante) + " S"


func _on_one_sec_timeout():
	tiempo_restante -=1
	
	if tiempo_restante <= 0:
		tiempo_restante = 0
		timer_game.stop() # Replace with function body.
