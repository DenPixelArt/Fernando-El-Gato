extends Node

var pestanas: Sprite3D
var camarafotos
var timerviendo: Timer
var timerpestaneando: Timer
var timergame: Timer 
var onesec: Timer
var nuevogato = ["49 S", "34 S", "20 S", "10 S", "2 S"]
var timerlabel: int
var gatosobtenidos = []
@onready var gato = $Gato
@onready var nodo_raiz = get_node("/root/game_scene")
@onready var sonidofoto = get_node("./Audio/FotoSonido")


func _ready():
	pestanas = $Pestaneo
	timerviendo = $TimerViendo
	timerpestaneando = $TimerPestaneo
	timergame = $TimerGame
	camarafotos = $habitacion/CamaraFotos
	onesec = $OneSec
	timerlabel = $Timer60.tiempo_restante
	pestanas.visible = true
	camarafotos.visible = false
	
	
func start_game():
	onesec.start()
	pestanas.visible = false
	camarafotos.visible = true
	timerviendo.start()
	timergame.start()
	
func _on_timer_viendo_timeout():
	pestanas.visible = true
	camarafotos.visible = false
	timerpestaneando.start()

func _on_timer_pestaneo_timeout():
	pestanas.visible = false
	camarafotos.visible = true
	timerviendo.start()

func _on_timer_game_timeout():
	for child in gatosobtenidos:
		Resultado.gatosfotografiados = child
		
	get_tree().change_scene_to_file("res://ending.tscn")


func _on_one_sec_timeout():
	timerlabel = $Timer60.tiempo_restante
	if timerlabel in nuevogato:
		print("Hay que cambiar al gato")# Replace with function body.

func _process(_delta):
	if Input.is_action_pressed("Pestanear") and !pestanas.visible:
		timerviendo.stop()
		_on_timer_viendo_timeout()
	if Input.is_action_pressed("Fotografiar") and !pestanas.visible:
		sonidofoto.play()
		$habitacion/CamaraFotos/mano/animation_mano.play("EsqueletoAction")
		for child in gato.get_children():
			if child is Sprite3D and child.visible and child not in gatosobtenidos:
				gatosobtenidos.append(child)
