extends "PlayerBaseState.gd"

const DASH_VELOCITY = 300
const DASH_DURATION = 0.20

onready var hitbox = body.get_node("HitBoxDamage")

var dash_time_count = 0.0
var ground_dash = false
var canceled = false

func enter():
	print("Entering PARRY")
	player.velocity.y = 0.0
	var input_2d = get_input_direction()
	sprite.play("Dash")
	dash_time_count = 0.0
	trail.start_emitting()
	
	canceled = false
	if(body.is_on_floor()):
		ground_dash = true
	else:
		ground_dash = false
	
	hitbox.set_deferred("monitorable", false)
	hitbox.set_deferred("monitoring", false)
	
	if input_2d.x > 0:
		trail.flip_h = false
		player.velocity.x = DASH_VELOCITY
	elif input_2d.x < 0:
		trail.flip_h = true
		player.velocity.x = -DASH_VELOCITY
		
	if input_2d.y > 0:
		player.velocity.y = DASH_VELOCITY*0.7
	elif input_2d.y < 0:
		player.velocity.y = -DASH_VELOCITY*0.7
	.enter()

func exit():
	trail.stop_emitting()
	hitbox.set_deferred("monitorable", true)
	hitbox.set_deferred("monitoring", true)
	print("Exiting PARRY")
	.exit()

func handle_input(event):
	if event.is_action_pressed("jump") and ground_dash:
		canceled = true
		player.velocity.y = JUMP_FORCE
		emit_signal("finished", "mid_air")

	return .handle_input(event)

func update(delta):
	if !canceled:
		dash_time_count += delta
		if dash_time_count >= DASH_DURATION:
			emit_signal("finished", "previous")
	else:
		emit_signal("finished", "previous")
	.update(delta)
