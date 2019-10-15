extends "res://Nodes/Characters/State.gd"

const GRAVITY = 15
const NORMAL  = Vector2(0,-1)
const JUMP_FORCE = -300

onready var player = get_node("../../..")
onready var body = get_node("../..")
onready var sprite = body.get_node("Sprite")
onready var wallDetection = body.get_node("WallDetection")
onready var trail = body.get_node("TextureEmitter")
onready var animation = body.get_node("AnimationPlayer")
onready var shuriken_spawner = body.get_node("RangedAttack")

func enter():
	pass

# Clean up the state. Reinitialize values like a timer
func exit():
	pass

func handle_input(event):
	pass

func update(delta):
	pass

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

	return input_direction