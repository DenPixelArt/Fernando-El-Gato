extends CanvasLayer

@onready var corcho = $corcho
@onready var sonidoboton = get_node("../Audio/BotonSonido")


func _on_button_retry_pressed():
	sonidoboton.play()
	get_tree().change_scene_to_file("res://game_scene.tscn")


func _on_buttonquit_pressed():
	sonidoboton.play()
	get_tree().quit()
