extends CanvasLayer

var score = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func asteroid_destroied(ast):
	var pontos = (6 - ast.chosen) * 10
	score += pontos
	$score.text = str(score)
