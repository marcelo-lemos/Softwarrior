extends "Motion.gd"

const JUMP_FORCE = -400

# Initialize the state. E.g. change the animation
func enter():
	velocity.y = JUMP_FORCE

# Clean up the state. Reinitialize values like a timer
func exit():
	.exit()

func handle_input(event):
	.handle_input(event)

func update(delta):
	body.move_and_slide(velocity, NORMAL)
	emit_signal("finished", "mid_air")
