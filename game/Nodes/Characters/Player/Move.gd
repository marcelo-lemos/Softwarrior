extends "OnGround.gd"

const MOVE_SPEED = 250

func enter():
	print("Entering MOVE")
	.enter()

func exit():
	print("Exiting MOVE")

func handle_input(event):
	return .handle_input(event)

func update(delta):
	player.velocity.x = get_input_direction()[0] * MOVE_SPEED
	
	if !body.is_on_floor():
		emit_signal("finished", "mid_air")
	.update(delta)
