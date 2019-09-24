extends "Jump.gd"

func enter():
	print("Entering MIDAIR")
	pass

func exit():
	print("Exiting MIDAIR")

func handle_input(event):
	.handle_input(event)

func update(delta):
	.update(delta)