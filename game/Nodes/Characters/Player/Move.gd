extends "OnGround.gd"

const MOVE_SPEED = 300

func enter():
	var input_direction = get_input_direction()

func handle_input(event):
	return .handle_input(event)

func update(delta):
	var input_direction = get_input_direction()

	velocity.x = input_direction[0] * MOVE_SPEED

func move(speed, direction):
	velocity = direction.normalized() * speed
	owner.move_and_slide(velocity, Vector2(), 5, 2)
	if owner.get_slide_count() == 0:
		return
	return owner.get_slide_collision(0)
