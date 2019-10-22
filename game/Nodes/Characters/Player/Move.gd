extends "Motion.gd"


const MOVE_ACCELERATION = 25
const MAX_MOVE_SPEED = 250
const GROUND_SLOWDOWN = 50

#For (velocity_preserve_total_time), players velocity will not be capped on entering this state
var velocity_preserve_total_time = 0.25
var velocity_preserve_timer = 0

func enter():
	print("Entering MOVE")
	sprite.play("Run")
	.enter()

func exit():
	#print("Exiting MOVE")
	pass
	
func handle_input(event):
	if event.is_action_pressed("jump") and body.is_on_floor():
		player.velocity.y = JUMP_FORCE
		emit_signal("finished", "mid_air")
	if event.is_action_pressed("attack"):
		player.velocity.x = 0
		emit_signal("finished", "ground_attack")
	return .handle_input(event)

func update(delta):
	player.has_dash = true
	player.has_double_jump = true
	.update(delta)
	
	if input_direction:
		if(velocity_preserve_timer < velocity_preserve_total_time):
			player.velocity.x = add_velocity_with_cap(player.velocity.x,input_direction * MOVE_ACCELERATION,MAX_MOVE_SPEED)
		else:
			player.velocity.x += input_direction * MOVE_ACCELERATION
			player.velocity.x = cap_velocity(player.velocity.x, MAX_MOVE_SPEED)
		sprite.play("Run")
	elif player.velocity.x != 0:
		sprite.play("Idle")
		apply_ground_slowdown()
	else:
		sprite.play("Idle")
		
	if !body.is_on_floor():
		emit_signal("finished", "mid_air")

func apply_ground_slowdown():
	if player.velocity.x > 0:
		player.velocity.x = player.velocity.x - GROUND_SLOWDOWN if player.velocity.x > GROUND_SLOWDOWN else 0.0

	elif player.velocity.x < 0:
		player.velocity.x = player.velocity.x + GROUND_SLOWDOWN if player.velocity.x < GROUND_SLOWDOWN else 0.0