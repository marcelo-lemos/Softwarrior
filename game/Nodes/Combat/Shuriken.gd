extends KinematicBody2D

var direction = Vector2()
var damage = 1
export(float) var SPEED = 1000.0

func _ready():
	set_as_toplevel(true)

func _physics_process(delta):
	if is_outside_view_bounds():
		queue_free()

	var motion = direction * SPEED * delta
	var collision_info = move_and_collide(motion)
	if collision_info:
		queue_free()

func is_outside_view_bounds():
	return position.x > OS.get_screen_size().x \
		or position.y > OS.get_screen_size().y


func _draw():
	print("AÍ DESENHOU")
	draw_circle(direction, $Area2D/CollisionShape2D.shape.radius, Color('#ffffff'))

func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage(damage)
		queue_free()