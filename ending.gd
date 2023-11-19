extends Node

func _ready():
	$FotoFlor.visible = false
	$FotoLibro.visible = false
	$FotoMalabares.visible = false
	$FotoMotocicleta.visible = false
	$FotoMotosierra.visible = false
	for gato in Resultado.gatosfotografiados:
		if gato==1:
			$FotoMotosierra.visible = true
		if gato == 2:
			$FotoLibro.visible = true
		if gato == 3:
			$FotoMotocicleta.visible = true
		if gato == 4:
			$FotoFlor.visible = true
		if gato == 5:
			$FotoMalabares.visible = true




