extends "OnGround.gd"

const MOVE_SPEED = 250

func enter():
	.enter()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	velocity.y += GRAVITY
	
	velocity.x = get_input_direction()[0] * MOVE_SPEED
	.update(delta)
