extends "res://Nodes/Characters/State.gd"

const GRAVITY = 15
const NORMAL  = Vector2(0,-1)

onready var player = get_node("../../..")
onready var body = get_node("../..")
onready var sprite = body.get_node("Sprite")
onready var wallDetection = body.get_node("WallDetection")

func enter():
	pass

# Clean up the state. Reinitialize values like a timer
func exit():
	pass

func handle_input(event):
	pass

func update(delta):
	pass