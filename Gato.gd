extends Node3D

var movido: bool = false

func iniciar_propagacion():
	propagar_estado()
	
func propagar_estado():
	for child in get_children():
		if child is Node3D and child.visible:
			movido = true
			return
	movido = false
	for child in get_children():
		if child is Node3D:
			child.propagar_estado()
			
func modificar_movido(desired_state: bool):
	movido = desired_state
	propagar_estado()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
