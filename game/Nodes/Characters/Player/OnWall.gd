extends "Motion.gd"

const WALL_SLIDE_VELOCITY = 50
const WALL_JUMP_HEIGHT = -300
const WALL_JUMP_HORIZONTAL = 200

var wall_side

func enter():
	print("Entering ONWALL")
	player.has_dash = true
	player.has_double_jump = true
	player.velocity.y = 0

func exit():
	print("Exiting ONWALL")

func handle_input(event):
	var inputH = get_input_direction()[0]

	if (check_wall_right() and inputH < 0) or (check_wall_left() and inputH > 0):
		emit_signal("finished", "mid_air")

	if event.is_action_pressed("jump"):
		if player.going_right:
			player.velocity.x = -WALL_JUMP_HORIZONTAL
			player.velocity.y = WALL_JUMP_HEIGHT
			emit_signal("finished", "mid_air")
		else:
			player.velocity.x = WALL_JUMP_HORIZONTAL
			player.velocity.y = WALL_JUMP_HEIGHT
			emit_signal("finished", "mid_air")

	.handle_input(event)

func update(delta):
	sprite.play("Wall")
	player.velocity.y = WALL_SLIDE_VELOCITY
	
	if body.is_on_floor():
		emit_signal("finished", "move")
	
	elif player.going_right and !check_wall_right():
		emit_signal("finished", "mid_air")
	
	elif !player.going_right and !check_wall_left():
		emit_signal("finished", "mid_air")
		
	.update(delta)