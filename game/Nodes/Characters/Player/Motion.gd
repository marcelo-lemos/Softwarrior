extends "../State.gd"

const GRAVITY = 10
const NORMAL  = Vector2(0,-1)

var velocity = Vector2(0,0.05)
onready var body = get_node("../..")
onready var sprite = body.get_node("Sprite")


func handle_input(event):
	.handle_input(event)

func get_input_direction():
	var input_direction = Vector2()
	input_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))

	return input_direction
	
func update(delta):
	check_sprite_dir()
	velocity = body.move_and_slide(velocity, NORMAL)

func check_sprite_dir():
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
