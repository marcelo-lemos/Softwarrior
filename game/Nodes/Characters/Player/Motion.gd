extends "PlayerBaseState.gd"

var input_direction

func handle_input(event):
	if event.is_action_pressed("dash") and player.has_dash:
		#player.katana._change_state(0)
		emit_signal("finished", "dash")

	if event.is_action_pressed("fire") and player.shuriken_shots > 0:
		player.shuriken_shots -= 0
		if player.going_right:
			shuriken_spawner.fire(Vector2(1, 0))
		else:
			shuriken_spawner.fire(Vector2(-1, 0))
			
	.handle_input(event)
	
func update(delta):
	input_direction = get_input_direction()[0]
	player.velocity.y += GRAVITY
	check_direction(input_direction)

func check_direction(input_direction):
	if input_direction:
		if input_direction > 0:
			player.going_right = true
			sprite.flip_h = false
			player.katana.set_scale(Vector2(1,1))
		elif input_direction < 0:
			player.going_right = false
			sprite.flip_h = true
			player.katana.set_scale(Vector2(-1,1))

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

func add_velocity_with_cap(current_velocity, additional_velocity, max_velocity):
	if abs(current_velocity + additional_velocity) > abs(max_velocity):
		if sign(current_velocity) != sign(additional_velocity):
			return current_velocity + additional_velocity
		return current_velocity
	return current_velocity + additional_velocity
