extends Node

var pestanas: Sprite3D
var camarafotos
var timerviendo: Timer
var timerpestaneando: Timer

func _ready():
	pestanas = $Pestaneo
	timerviendo = $TimerViendo
	timerpestaneando = $TimerPestaneo
	camarafotos = $CamaraFotos
	pestanas.visible = true
	camarafotos.visible = false
	
func start_game():
	pestanas.visible = false
	camarafotos.visible = true
	timerviendo.start()
	
func _on_timer_viendo_timeout():
	pestanas.visible = true
	camarafotos.visible = false
	timerpestaneando.start()

func _on_timer_pestaneo_timeout():
	pestanas.visible = false
	camarafotos.visible = true
	timerviendo.start()






