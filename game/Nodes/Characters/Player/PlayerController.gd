extends Node2D

const NORMAL = Vector2(0,-1)

#physics vars
onready var body = get_node("GenericCharacter")
var velocity = Vector2(0,0.2)
var apply_gravity = true

#gameplay vars
var has_dash = true
var has_double_jump = true
var shuriken_shots = 4
onready var shuriken = $GenericCharacter/Shuriken

func _process(delta):
	velocity.y += 10
	velocity = body.move_and_slide(velocity, NORMAL)
	
func fire(direction):

	print("SHURIKEN FAIRE!")
	shuriken_shots -= 1
	shuriken.fire(direction)
