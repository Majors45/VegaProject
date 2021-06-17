extends Camera2D

var time = 0
var forca = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	if forca > 0:
		time += delta * 100
		global_position = Vector2(forca,forca).rotated(time)
		forca = lerp(forca, 0, .1)
	
#	if Input.is_action_just_pressed("ui_cancel"):
#		treme(3)

func treme(v):
	forca += v
	
	
	
