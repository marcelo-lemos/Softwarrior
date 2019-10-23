extends Area2D

const SPEED = 200

var direction = Vector2()
var damage = 1

func _ready():
	set_as_toplevel(true)
	pass
	
func _process(delta):
	if(direction.x > 0):
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	var motion = direction * SPEED
	position += motion * delta

func _on_Area2D_body_entered(body):
	queue_free()

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		print("(&AUOEFJN")
		area.get_node("../../").take_damage(damage, global_position.x)
		queue_free()