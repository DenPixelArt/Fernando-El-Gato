extends Sprite3D

var onesec: Timer
var nuevogato = 20
var tiempo_restante: int
var onplay: bool = false
const id = 3
@onready var nodo_raiz = get_node("/root/game_scene")
@onready var timersixty = nodo_raiz.get_node("Timer60")
@onready var sonidomoto = nodo_raiz.get_node("Audio/MotocicletaSonido")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	tiempo_restante = timersixty.tiempo_restante
	if tiempo_restante == nuevogato:
		self.visible=true
		if not onplay:
			onplay=true
			sonidomoto.play()
	else:
		self.visible = false
		onplay=false
		sonidomoto.stop()
