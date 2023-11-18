extends Node

var sprite3d: Sprite3D
var camera: Camera3D
var timer: Timer

func _ready():
	sprite3d = $Pestaneo
	timer = $Timer
	camera = $Marker3D/Camera3D
	sprite3d.visible = false

	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

	timer.start()    

func _on_timer_timeout():
	sprite3d.visible = true
	var display_timer = Timer.new()
	display_timer.wait_time = 2
	display_timer.one_shot = true
	add_child(display_timer)
	display_timer.start()
	display_timer.connect("timeout", Callable(self, "_on_display_timer_timeout"))

	timer.start()

func _on_display_timer_timeout():
	sprite3d.visible = false
