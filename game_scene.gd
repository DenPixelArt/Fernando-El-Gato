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
var echandofoto = false
var firstime = Resultado.firstime
@onready var gato = $Gato
@onready var nodo_raiz = get_node("/root/game_scene")
@onready var sonidoFoto = nodo_raiz.get_node("FotoSonido")
@onready var tuto = nodo_raiz.get_node("tutorial")

func _ready():
	pestanas = $Pestaneo
	timerviendo = $TimerViendo
	timerpestaneando = $TimerPestaneo
	timergame = $TimerGame
	camarafotos = $habitacion/CamaraFotos
	onesec = $OneSec
	timerlabel = $Timer60.tiempo_restante
	if firstime:
		pestanas.visible = false
		camarafotos.visible=true
		tuto.visible = true
		Resultado.firstime = false
	else:
		tuto.visible = false
		pestanas.visible = false
		start_game()
		
	
	
	
func start_game():
	Resultado.gatosfotografiados.clear()
	onesec.start()
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
		Resultado.gatosfotografiados.append(child)
		
	get_tree().change_scene_to_file("res://ending.tscn")


func _on_one_sec_timeout():
	timerlabel = $Timer60.tiempo_restante

func _echar_foto():
	$habitacion/CamaraFotos/mano/animation_mano.play("EsqueletoAction")
	sonidoFoto.play()
	for child in gato.get_children():
		if child is Sprite3D and child.visible and child not in gatosobtenidos:
			gatosobtenidos.append(child.id)

func _process(_delta):
	if Input.is_action_pressed("Pestanear") and !pestanas.visible:
		timerviendo.stop()
		_on_timer_viendo_timeout()
	if Input.is_action_pressed("Fotografiar") and !pestanas.visible:
		if not echandofoto:
			echandofoto = true
			_echar_foto()
			
		
func _on_foto_sonido_finished():
	echandofoto=false
