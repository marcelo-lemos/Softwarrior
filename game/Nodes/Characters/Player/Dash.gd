extends "PlayerBaseState.gd"

const DASH_VELOCITY = 350
const DASH_DURATION = 0.25

var dash_time_count = 0.0
var ground_dash = false
var canceled = false

func enter():
	canceled = false
	if(body.is_on_floor()):
		ground_dash = true
	else:
		ground_dash = false
	
	print("Entering DASH")
	
	player.velocity.y = 0.0
	sprite.play("Dash")
	dash_time_count = 0.0
	player.has_dash = false
	trail.start_emitting()
	
	if sprite.flip_h == false:
		trail.flip_h = false
		player.velocity.x = DASH_VELOCITY
	else:
		trail.flip_h = true
		player.velocity.x = -DASH_VELOCITY
	.enter()

func exit():
	trail.stop_emitting()
	print("Exiting DASH")
	.exit()

func handle_input(event):
	if event.is_action_pressed("jump") and ground_dash:
		canceled = true
		player.velocity.y = JUMP_FORCE
		emit_signal("finished", "mid_air")
	if event.is_action_pressed("attack") and player.has_dash_attack:
		player.has_dash_attack = false
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
