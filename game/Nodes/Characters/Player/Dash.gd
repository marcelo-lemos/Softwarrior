extends "PlayerBaseState.gd"

const DASH_VELOCITY = 500
const DASH_DURATION = 0.2

var dash_time_count = 0.0
var ground_dash = false

func enter():
	if(body.is_on_floor()):
		ground_dash = true
	else:
		ground_dash = false
	print("Entering DASH")
	player.velocity.y = 0.0
	sprite.play("Dash")
	dash_time_count = 0.0
	player.has_dash = false
	.enter()

func exit():
	
	trail.stop_emitting()
	print("Exiting DASH")
	.exit()

func handle_input(event):
	if event.is_action_pressed("jump") and ground_dash:
		player.velocity.y = JUMP_FORCE
		emit_signal("finished", "mid_air")
	return .handle_input(event)

func update(delta):
	trail.start_emitting()
	
	
	if sprite.flip_h == false:
		trail.flip_h = false
		player.velocity.x = DASH_VELOCITY
	else:
		trail.flip_h = true
		player.velocity.x = -DASH_VELOCITY
	
	dash_time_count += delta
	if dash_time_count >= DASH_DURATION:
		emit_signal("finished", "previous")
	.update(delta)
