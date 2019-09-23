extends "Motion.gd"

const AIR_MOVE_SPEED = 150

# Initialize the state. E.g. change the animation
func enter():
	pass

# Clean up the state. Reinitialize values like a timer
func exit():
	.exit()

func handle_input(event):
	.handle_input(event)

func update(delta):
	if body.is_on_floor():
		emit_signal("finished", "move")
	var input_direction = get_input_direction()
	velocity.x = input_direction[0] * AIR_MOVE_SPEED
	.update(delta)