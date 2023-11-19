extends CanvasLayer

@onready var main = $Main
@onready var settings = $Settings
@onready var sonidoboton = get_node("../Audio/BotonSonido")

func _on_button_play_pressed():
	sonidoboton.play()
	get_tree().change_scene_to_file("res://game_scene.tscn")


func _on_button_settings_pressed():
	sonidoboton.play()
	main.visible = false
	settings.visible = true


func _on_button_quit_pressed():
	sonidoboton.play()
	get_tree().quit()

func _on_button_settings_back_pressed():
	sonidoboton.play()
	settings.visible = false
	main.visible = true

