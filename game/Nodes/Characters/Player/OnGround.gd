extends "Motion.gd"

func handle_input(event):
	if event.is_action_pressed("jump"):
		emit_signal("finished", "jump")
	return .handle_input(event)
	
func update(delta):
	if !body.is_on_floor():
		emit_signal("finished", "mid_air")
	.update(delta)