extends "res://Nodes/Characters/Player/PlayerBaseState.gd"

const DASH_VELOCITY = 400
const DASH_DURATION = 0.15

var dash_time_count = 0.0
var ground_dash = false
var canceled = false

func enter():
	print("Entering PARRY")
	var target = player.get_parry_target()
	var angle = stepify(rad2deg(body.global_position.angle_to_point(target.global_position)),45);
	var goal_point = body.global_position + 2 * (target.global_position - body.global_position)
	print(body.global_position)
	print(target.global_position)
	print(goal_point)
	var direction = Vector2.LEFT.rotated(deg2rad(angle))
	player.velocity = DASH_VELOCITY * direction
	sprite.play("Dash")
	dash_time_count = 0.0
	player.has_dash = false
	#trail.start_emitting()
	
	if sprite.flip_h == false:
		trail.flip_h = false
		#player.velocity.x = DASH_VELOCITY
	else:
		trail.flip_h = true
		#player.velocity.x = -DASH_VELOCITY
	.enter()

func exit():
	#trail.stop_emitting()
	player.velocity = Vector2.ZERO
	print("Exiting PARRY")
	.exit()

func handle_input(event):
	if event.is_action_pressed("jump") and ground_dash:
		canceled = true
		player.velocity.y = JUMP_FORCE
		emit_signal("finished", "mid_air")
	if event.is_action_pressed("attack"):
		emit_signal("finished", "dash_attack")
	return .handle_input(event)

func update(delta):
	if !canceled:
		dash_time_count += delta
		if dash_time_count >= DASH_DURATION:
			emit_signal("finished", "previous")
	else:
		emit_signal("finished", "previous")
	.update(delta)