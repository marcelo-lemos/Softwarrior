extends "PlayerBaseState.gd"

const DASH_VELOCITY = 500
const DASH_DURATION = 0.2

var dash_time_count = 0.0

func enter():
	print("Entering DASH")
	dash_time_count = 0.0
	player.has_dash = false
	.enter()

func exit():
	print("Exiting DASH")
	.exit()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	player.velocity.y = 0.0
	
	if sprite.flip_h == false:
		player.velocity.x = DASH_VELOCITY
	else:
		player.velocity.x = -DASH_VELOCITY
	
	dash_time_count += delta
	if dash_time_count >= DASH_DURATION:
		emit_signal("finished", "previous")
	.update(delta)
