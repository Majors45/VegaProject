extends Node2D

 
var chosen = 0
var hp = 0
onready var velY = rand_range(30 , 100)
onready var velX = rand_range(-15 , 15)
var knock_back = 0
signal detroied(node)


var hps = [
	2,
	2,
	4,
	3,
	3
]



func _ready():
	randomize()
	for a in $asteroids.get_children():
		a.visible = false
	if not chosen:
		chosen = (randi() % $asteroids.get_child_count()) + 1
	hp = hps[chosen -1]
	
	
	var node = get_node("asteroids/asteroid-" + str(chosen))
	
	node.visible = true
	
	$area/shape.shape.radius = node.texture.get_width()/2


func _process(delta):
	translate(Vector2(velX , velY - knock_back) * delta)
	
	if global_position.x>165:
		global_position.x = -60
	if global_position.x < -60:
		global_position.x = 165
	
	
	if global_position.y > 300:
		global_position.y = -60
	
	if knock_back:
		knock_back = lerp(knock_back, 0, 1)

func _on_area_area_entered(area):
	hp-=1
	knock_back = 80
	if not hp:
		get_tree().call_group("camera", "treme", 1)
		emit_signal("detroied", self)
		queue_free()
	else:
		get_tree().call_group("camera", "treme", .5)
func dest():
	get_tree().call_group("camera", "treme", 1)
	emit_signal("detroied", self)
	queue_free()

func get_hp_inicial():
	return hps[chosen - 1]
	
	
