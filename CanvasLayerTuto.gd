extends CanvasLayer

@onready var tuto = $tuto
@onready var sonidoboton = get_node("./Audio/BotonSonido")

signal start_game

func _on_button_entendido_pressed():
	sonidoboton.play()
	tuto.visible = false
	start_game.emit()
