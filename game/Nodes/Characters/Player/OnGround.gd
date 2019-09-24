extends "Motion.gd"

func handle_input(event):
	if event.is_action_pressed("jump") and body.is_on_floor():
		emit_signal("finished", "jump")
	return .handle_input(event)
	
func update(delta):
	player.has_dash = true
	player.has_double_jump = true
	.update(delta)