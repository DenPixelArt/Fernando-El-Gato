extends Sprite3D

var onesec: Timer
var nuevogato = 34
var tiempo_restante: int
@onready var nodo_raiz = get_node("/root/game_scene")
@onready var timersixty = nodo_raiz.get_node("Timer60")
@onready var sonidoleer = nodo_raiz.get_node("Audio/LeerSonido")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	tiempo_restante = timersixty.tiempo_restante
	if tiempo_restante == nuevogato || (tiempo_restante+1) == nuevogato:
		self.visible=true
		sonidoleer.play()
	else:
		self.visible = false
		