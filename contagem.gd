extends Node2D

var tempo = 3

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	tempo -= 1
	$label.text = str(tempo)
	
	if tempo <= 0:
		get_tree().paused = false
		queue_free()
		
	if Input.is_action_just_pressed("ui_end"):
		get_tree().paused = true
		print("pause")
	if Input.is_action_just_pressed("ui_page_down"):
		get_tree().paused = false
