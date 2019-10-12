extends Node2D

const GRAVITY = 40.0
const NORMAL = Vector2(0,-1)

var going_right = true

#physics vars
onready var body = get_node("GenericCharacter")
var velocity = Vector2(0,0.2)
var apply_gravity = true

#gameplay vars
var has_dash = true
var has_double_jump = true
var shuriken_shots = 4
#onready var shuriken = $GenericCharacter/Shuriken
onready var katana = $GenericCharacter/Katana

func _process(delta):
	velocity = body.move_and_slide(velocity, NORMAL)