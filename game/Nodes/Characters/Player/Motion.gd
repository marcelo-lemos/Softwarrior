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
	check_direction()
	check_sprite_dir()

func check_direction():
	if player.velocity.x > 0:
		player.going_right = true
	elif player.velocity.x < 0:
		player.going_right = false

func check_sprite_dir():
	if player.velocity.x > 0:
		sprite.flip_h = false
	elif player.velocity.x < 0:
		sprite.flip_h = true

func check_wall():
	for raycast in wallDetection.get_children():
		if raycast.is_colliding():
			return true
	return false
	
func check_wall_left():
	var head = wallDetection.get_node("FootLeft")
	var foot = wallDetection.get_node("HeadLeft")
	if head.is_colliding() or foot.is_colliding():
		return true
	return false
	
func check_wall_right():
	var head = wallDetection.get_node("FootRight")
	var foot = wallDetection.get_node("HeadRight")
	if head.is_colliding() or foot.is_colliding():
		return true
	return false
	
func cap_velocity(current_velocity, max_velocity):
	if current_velocity > max_velocity:
		return max_velocity
	if current_velocity < -max_velocity:
		return -max_velocity
	return current_velocity
	
	
	
	
	
