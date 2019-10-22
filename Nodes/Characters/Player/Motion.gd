extends "PlayerBaseState.gd"

func handle_input(event):
	if event.is_action_pressed("dash") and player.has_dash:
		emit_signal("finished", "dash")
	.handle_input(event)

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

	return input_direction
	
func update(delta):
	check_sprite_dir()

func check_sprite_dir():
	if player.velocity.x > 0:
		sprite.flip_h = false
	elif player.velocity.x < 0:
		sprite.flip_h = true
