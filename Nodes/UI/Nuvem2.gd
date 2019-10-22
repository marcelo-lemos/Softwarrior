extends Sprite


# Declare member variables here. Examples:
var velocity = Vector2()
var speed = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2()
	velocity.x += 3
	
	var motion = velocity * speed * delta
	
	position = position + motion
	pass