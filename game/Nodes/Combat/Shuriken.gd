extends Area2D

const SPEED = 500

var direction = Vector2()
var damage = 1

func _ready():
	set_as_toplevel(true)
	pass
	
func _process(delta):
	var motion = direction * SPEED
	position += motion * delta

func _on_Area2D_area_entered(area):
	if area.is_in_group("enemy"):
		area.get_node("../").take_damage(damage, global_position.x)
	queue_free()

func _on_Area2D_body_entered(body):
	queue_free()
