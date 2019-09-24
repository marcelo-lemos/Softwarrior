extends "Jump.gd"

const SECOND_JUMP_HEIGHT = -200

func enter():
	print("Entering DJ")
	player.has_double_jump = false
	player.velocity.y = SECOND_JUMP_HEIGHT
	
func exit():
	print("Exiting DJ")

func handle_input(event):
	.handle_input(event)

func update(delta):
	.update(delta)