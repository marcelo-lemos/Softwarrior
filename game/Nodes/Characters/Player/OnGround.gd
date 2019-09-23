extends "Motion.gd"

func handle_input(event):
	if body.is_on_floor() and event.is_action_pressed("jump"):
		emit_signal("finished", "jump")
	return .handle_input(event)
	
func update(delta):
	.update(delta)