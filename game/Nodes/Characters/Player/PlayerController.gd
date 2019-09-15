extends "res://Nodes/Characters/BaseController.gd"
enum{RIGHT = 1, LEFT = -1, UP = -1, DOWN = 1}
enum State{
	WALK,
	JUMP
}

const GROUND_LERP_WEIGTH = 0.3
const AIR_LERP_WEIGTH = 0.08
const PURE_WALK_SPEED = 160
const AIR_MOVE_SPEED = 160
const PURE_JUMP_MAX  = 380

onready var animation_player = $AnimationPlayer
onready var camera = $Camera2D
onready var standing_hitbox : CollisionShape2D = $StandShape

var jump_var_height = 100
var player_state = State.WALK

var afterAnimationState = "walk"
var respawnPoint
var game

var walk_state = load("res://Scripts/StateMachine/PlayerState/PlayerWalkState.gd")
var jump_state = load("res://Scripts/StateMachine/PlayerState/PlayerJumpState.gd")
var attack_state = load("res://Scripts/StateMachine/PlayerState/PlayerAttackState.gd")

func _ready():
	._ready()
	global.player = self
	stateMachine.add_state(walk_state.new(),"walk")
	stateMachine.add_state(jump_state.new(),"jump")
	stateMachine.add_state(attack_state.new(), "attack")
	stateMachine.change_state("walk")
	
func jump(jump_height):
	linear_vel.y = -jump_height
	
