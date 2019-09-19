extends "Motion.gd"

const JUMP_FORCE = -400

# Initialize the state. E.g. change the animation
func enter():
	.enter()

# Clean up the state. Reinitialize values like a timer
func exit():
	.exit()

func handle_input(event):
	.handle_input(event)

func update(delta):
	if body.is_on_floor():
		emit_signal("finished", "previous")
	.update(delta)
	
func initialize():
	velocity.y = JUMP_FORCE