extends Node

var sprite3d: Sprite3D
var camera: Camera3D
var timerviendo: Timer
var timerpestaneando: Timer

func _ready():
	sprite3d = $Pestaneo
	timerviendo = $TimerViendo
	timerpestaneando = $TimerPestaneo
	camera = $Marker3D/Camera3D
	sprite3d.visible = true
	
func start_game():
	sprite3d.visible = false
	timerviendo.start()
	
func _on_timer_viendo_timeout():
	sprite3d.visible = true
	timerpestaneando.start()

func _on_timer_pestaneo_timeout():
	sprite3d.visible = false
	timerviendo.start()

func _on_display_timer_timeout():
	sprite3d.visible = false





