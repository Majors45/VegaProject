extends Node2D

const pre_lazer = preload("res://scenes/lazer.tscn")

export var vel = 100.0
var escudo = 100.0
onready var escudo_size = $escudo/sprite.material.get_shader_param("size")
onready var shape_size = $area/shape.shape.radius

export(NodePath) var lazers


func _ready():
	
	if lazers:
		lazers = get_node(lazers)
	else:
		lazers = get_parent()
	
	pass 


func _process(delta):
	var dirX = 0
	var dirY = 0
	
	if Input.is_action_pressed("ui_left"):
		dirX += -1
	if Input.is_action_pressed("ui_right"):
		dirX += 1
	if Input.is_action_pressed("ui_up"):
		dirY += -1
	if Input.is_action_pressed("ui_down"):
		dirY += 1
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().get_nodes_in_group("lazers").size() < 8:
			var lazer = pre_lazer.instance()
			lazers.add_child(lazer)
			lazer.global_position = $tiro.global_position
		
	
	translate(Vector2(dirX,dirY) * vel * delta)
	
	global_position.x = clamp(global_position.x , 21, 139)
	global_position.y = clamp(global_position.y , 24, 266)


func _on_area_area_entered(area):
	if area.get_parent().has_method("dest"):
		area.get_parent().dest()
	if area.collision_layer == 4:
		get_tree().call_group("camera", "treme", 1)
		escudo -= .5
		var proporcao = escudo / 100.0
		$area/shape.shape.radius = shape_size * proporcao
		$escudo/sprite.material.set_shader_param("size", escudo_size * escudo / 100.0)






func _on_dead_area_area_exited(area):
	visible = false
	set_process(false)
	
