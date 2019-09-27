extends "res://Nodes/Characters/State.gd"

const GRAVITY = 10
const NORMAL  = Vector2(0,-1)

onready var player = get_node("../../..")
onready var body = get_node("../..")
onready var sprite = body.get_node("Sprite")
var look_direction = Vector2(1, 0)

func enter():
	pass

# Clean up the state. Reinitialize values like a timer
func exit():
	pass

func handle_input(event):
	pass

func update(delta):
	pass