extends Sprite

var des = 0
var time = 0.0
export(NodePath) var nave1


func _ready():
	if nave1:
		nave1 = get_node(nave1)
	else:
		set_process(false)
	
	pass 

func _process(delta):
	time += delta
	material.set_shader_param("des", (80 - nave1.global_position.x )*0.002)
	material.set_shader_param("time", time)


