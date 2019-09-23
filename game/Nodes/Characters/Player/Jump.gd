extends "Motion.gd"

const JUMP_FORCE = -300
const AIR_MOVE_SPEED = 200
var jump_var_height = 100

# Initialize the state. E.g. change the animation
func enter():
	velocity.y = JUMP_FORCE
	velocity = body.move_and_slide(velocity, NORMAL)

# Clean up the state. Reinitialize values like a timer
func exit():
	.exit()

func handle_input(event):
	.handle_input(event)

func update(delta):
	velocity.y += GRAVITY
	
	if body.is_on_floor():
		emit_signal("finished", "move")
		
	var input_direction = get_input_direction()
	velocity.x = input_direction[0] * AIR_MOVE_SPEED

	velocity.x = lerp(velocity.x,velocity.x,0.15)
	
	if(Input.is_action_just_released("jump")):
		check_jump_cut(jump_var_height)
	
	.update(delta)

func check_jump_cut(jump_height):
	if velocity.y < -jump_height:
		velocity.y = -jump_height