extends Node

var pestanas: Sprite3D
var camarafotos
var timerviendo: Timer
var timerpestaneando: Timer
var timergame: Timer 
var onesec: Timer
var nuevogato = ["49 S", "34 S", "20 S", "10 S", "2 S"]
var timerlabel: int

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
	get_tree().change_scene_to_file("res://ending.tscn")


func _on_one_sec_timeout():
	timerlabel = $Timer60.tiempo_restante
	if timerlabel in nuevogato:
		print("Hay que cambiar al gato")# Replace with function body.
