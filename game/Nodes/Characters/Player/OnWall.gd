extends "Motion.gd"

const BASE_WALL_SLIDE_VELOCITY = 50
const QUICK_WALL_SLIDE_VELOCITY = 110
const SLOW_WALL_SLIDE_VELOCITY = 10
const WALL_JUMP_HEIGHT = -300
const WALL_JUMP_HORIZONTAL = 200

var wall_slide_velocity = BASE_WALL_SLIDE_VELOCITY
var wall_side

func enter():
	print("Entering ONWALL")
	#player.has_dash = true
	player.has_double_jump = true
	player.velocity.y = 0
	wall_slide_velocity = BASE_WALL_SLIDE_VELOCITY

func exit():
	print("Exiting ONWALL")

func handle_input(event):
	if input_direction:
		if (check_wall_right() and input_direction < 0) or (check_wall_left() and input_direction > 0):
			emit_signal("finished", "previous")
	if get_input_direction().y > 0:
		wall_slide_velocity = QUICK_WALL_SLIDE_VELOCITY
	elif get_input_direction().y < 0:
		wall_slide_velocity = SLOW_WALL_SLIDE_VELOCITY
	else:
		wall_slide_velocity = BASE_WALL_SLIDE_VELOCITY
		
	if event.is_action_pressed("jump"):
		if player.going_right:
			if(input_direction == 0):
				player.velocity.x = 3 * -WALL_JUMP_HORIZONTAL
			else:
				player.velocity.x = -WALL_JUMP_HORIZONTAL
			player.velocity.y = WALL_JUMP_HEIGHT
			emit_signal("finished", "previous")
		else:
			player.velocity.x = WALL_JUMP_HORIZONTAL
			player.velocity.y = WALL_JUMP_HEIGHT
			emit_signal("finished", "previous")

	.handle_input(event)

func update(delta):
	sprite.play("Wall")
	player.velocity.y = wall_slide_velocity
	
	if body.is_on_floor():
		emit_signal("finished", "previous")
	
	elif player.going_right and !check_wall_right():
		emit_signal("finished", "mid_air")
	
	elif !player.going_right and !check_wall_left():
		emit_signal("finished", "mid_air")
		
	.update(delta)