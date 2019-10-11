extends "PlayerBaseState.gd"

func handle_input(event):
	if event.is_action_pressed("dash") and player.has_dash:
		emit_signal("finished", "dash")
	check_sprite_dir(event)
	.handle_input(event)
	
func update(delta):
	player.velocity.y += GRAVITY
	check_direction()

func check_direction():
	if player.velocity.x > 0:
		player.going_right = true
	elif player.velocity.x < 0:
		player.going_right = false

func check_sprite_dir(event):
	var input_direction = get_input_direction()[0]
	
	if input_direction > 0:
		sprite.flip_h = false
	elif input_direction < 0:
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
	
	
	
	
	
