extends "Motion.gd"

const MOVE_SPEED = 250
const MOVE_ACCELERATION = 30
const MAX_MOVE_SPEED = 250
const GROUND_SLOWDOWN = 25

const JUMP_FORCE = -300

func enter():
	print("Entering MOVE")
	.enter()

func exit():
	print("Exiting MOVE")

func handle_input(event):
	if event.is_action_pressed("jump") and body.is_on_floor():
		player.velocity.y = JUMP_FORCE
		emit_signal("finished", "mid_air")
	return .handle_input(event)

func update(delta):
	player.has_dash = true
	player.has_double_jump = true
	
	var input_direction = get_input_direction()
	if input_direction:
		player.velocity.x += get_input_direction()[0] * MOVE_ACCELERATION
		player.velocity.x = cap_velocity(player.velocity.x, MAX_MOVE_SPEED)
	elif player.velocity.x != 0:
		apply_ground_slowdown()
	
	if !body.is_on_floor():
		emit_signal("finished", "mid_air")
	.update(delta)

func apply_ground_slowdown():
	if player.velocity.x > 0:
		player.velocity.x -= GROUND_SLOWDOWN
	elif player.velocity.x < 0:
		player.velocity.x += GROUND_SLOWDOWN