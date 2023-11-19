extends CanvasLayer

@onready var corcho = $corcho



func _on_button_retry_pressed():
	get_tree().change_scene_to_file("res://game_scene.tscn")


func _on_buttonquit_pressed():
		get_tree().quit()
