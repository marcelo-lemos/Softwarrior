extends Area2D

const SPEED = 300

var direction = Vector2()
var damage = 1

func _ready():
	set_as_toplevel(true)
	pass
	
func _process(delta):
	if is_outside_view_bounds():
		queue_free()

	var motion = direction * SPEED
	position += motion * delta

func is_outside_view_bounds():
	return position.x > OS.get_screen_size().x \
		or position.y > OS.get_screen_size().y

func _on_Area2D_body_entered(body):
	queue_free()

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		print("(&AUOEFJN")
		area.get_node("../../").take_damage(damage)
		queue_free()