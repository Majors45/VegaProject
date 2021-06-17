extends Node2D


export(NodePath) var nave1

func _ready():
	if nave1:
		nave1 = get_node(nave1)
	else:
		set_process(false)
	
	pass 

func _process(delta):
	global_position.x = (nave1.global_position.x - 80) * 0.002 * 160
	pass
