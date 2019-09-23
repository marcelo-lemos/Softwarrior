extends KinematicBody2D

const GRAVITY = 10.0
const WALK_SPEED = 200


var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.y += GRAVITY
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
	else:
		velocity.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -400
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
