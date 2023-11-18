extends CanvasLayer

@onready var tuto = $tuto

signal start_game

func _on_button_entendido_pressed():
	tuto.visible = false
	start_game.emit()
