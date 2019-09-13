extends KinematicBody2D

const SLOPE_SLIDE_STOP = 25

var linear_vel = Vector2()
var floor_normal = Vector2.UP
var gravity = 900.0 #talvez mudar
var stateMachine : StateMachine
onready var sprite = $Sprite
#talvez o Raycast ainda vai ser util
#onready var raycast_manager = $RaycastManager
func _ready():
	stateMachine = load("res://Scripts/StateMachine/StateMachine.gd").new(self,sprite)
	
func move():
	linear_vel = move_and_slide(linear_vel, floor_normal, SLOPE_SLIDE_STOP)

func apply_gravity(delta):
	linear_vel += gravity * delta * -floor_normal

func _physics_process(delta):
	stateMachine.update(delta)
	