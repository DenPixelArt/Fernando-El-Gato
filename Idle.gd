extends Sprite3D

var onesec: Timer
var nuevogato = [49,34,20,10,2]
var tiempo_restante: int
@onready var nodo_raiz = get_node("/root/game_scene")
@onready var timersixty = nodo_raiz.get_node("Timer60")
const id = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	tiempo_restante = timersixty.tiempo_restante
	if tiempo_restante in nuevogato:
		self.visible=false
	else:
		self.visible = true
