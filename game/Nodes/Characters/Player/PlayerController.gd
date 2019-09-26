extends Node2D

const GRAVITY = 10.0
const NORMAL = Vector2(0,-1)

#physics vars
onready var body = get_node("GenericCharacter")
var velocity = Vector2(0,0.2)
var apply_gravity = true

#gameplay vars
var has_dash = true
var has_double_jump = true

func _process(delta):
	velocity.y += GRAVITY
	velocity = body.move_and_slide(velocity, NORMAL)