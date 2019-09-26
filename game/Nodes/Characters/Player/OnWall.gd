extends "Motion.gd"

const FRICTION = 8

func enter():
	print("Entering ONWALL")
	player.has_dash = true
	player.velocity.y = 0

func exit():
	print("Exiting ONWALL")

func handle_input(event):
	if event.is_action_pressed("jump") and get_input_direction()[0] != 0:
		emit_signal("finished", "jump")
	.handle_input(event)

func update(delta):
	player.velocity.y -= FRICTION
	player.velocity.x += 0.02
	
	if body.is_on_floor():
		emit_signal("finished", "move")
	
	.update(delta)