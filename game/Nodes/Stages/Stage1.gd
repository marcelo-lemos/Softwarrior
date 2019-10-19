extends Node

const STRAWBERRY_VALUE = 1
var score = 0

func _on_Strawberry_body_entered(body):
	score += STRAWBERRY_VALUE
	print('SCORE: ' + str(score))
	pass # Replace with function body.
