extends "res://Scripts/StateMachine/State.gd"
class_name BasePlayerState
var animation_player
func check_horizontal_direction():
	if Input.is_action_pressed("ui_left"):
		return Vector2.LEFT
	elif Input.is_action_pressed("ui_right"):
		return Vector2.RIGHT
	return Vector2.ZERO

func check_vertical_direction():
	if Input.is_action_pressed("ui_up"):
		print("UP IS BEING PRESSED")
		return Vector2.UP
	elif Input.is_action_pressed("ui_down"):
		print("DOWN IS BEING PRESSED")
		return Vector2.DOWN
	return Vector2.ZERO

func check_direction():
	return check_horizontal_direction() + check_vertical_direction()

func check_direction_normalized():
	return check_direction().normalized()

func check_jump_cut(jump_height):
	if body.linear_vel.y < -jump_height:
		body.linear_vel.y = -jump_height

func check_jump(jump_height, check_floor = true):
	if(Input.is_action_just_pressed("jump")):
		print("Jumping...")
		body.jump(jump_height)
		#animation_player.play("Stretch")
		machine.change_state("jump")
		return true
	if(!body.is_on_floor() and check_floor):
		machine.change_state("jump")
		return true

func check_attack():
	if(Input.is_action_just_pressed("attack")):
		print("Attacking...")
		machine.change_state("attack")

func state_enter():
	sprite.flip_v = false
	animation_player = body.animation_player
	#sprite.flip_h = false
	body.floor_normal = Vector2.UP

func check_sprite_dir():
	if body.linear_vel.x > 0:
		sprite.flip_h = false
	elif body.linear_vel.x < 0:
		sprite.flip_h = true

func check_sprite_dir_v():
	if body.linear_vel.y > 0:
		sprite.flip_v = true
	elif body.linear_vel.y < 0:
		sprite.flip_v = false
