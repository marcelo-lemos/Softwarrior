extends "Motion.gd"

const JUMP_FORCE = -300
const AIR_MOVE_SPEED = 200
var jump_var_height = 100

func enter():
	print("Entered JUMP")
	player.velocity.y = JUMP_FORCE

func exit():
	print("Exiting JUMP")
	.exit()

func handle_input(event):
	if event.is_action_pressed("jump") and player.has_double_jump:
		emit_signal("finished", "second_jump")
	.handle_input(event)

func update(delta):
	if body.is_on_floor():
		emit_signal("finished", "move")
	elif check_wall(wallDetection):
		emit_signal("finished", "on_wall")
		
	var input_direction = get_input_direction()
	player.velocity.x = input_direction[0] * AIR_MOVE_SPEED

	player.velocity.x = lerp(player.velocity.x, player.velocity.x, 0.15)
	
	if(Input.is_action_just_released("jump")):
		check_jump_cut(jump_var_height)
	
	.update(delta)

func check_jump_cut(jump_height):
	if player.velocity.y < -jump_height:
		player.velocity.y = -jump_height