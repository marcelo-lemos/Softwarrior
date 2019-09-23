extends "../State.gd"

const GRAVITY = 10
const NORMAL  = Vector2(0,-1)

var velocity = Vector2(0,0.05)
onready var body = get_node("../..")


func handle_input(event):
	.handle_input(event)

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

	return input_direction
	
func update(delta):
	velocity.y += GRAVITY
	velocity = body.move_and_slide(velocity, NORMAL)


