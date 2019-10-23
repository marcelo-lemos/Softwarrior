extends KinematicBody2D

const NORMAL = Vector2()

onready var shooter = get_node("../Shooter")
onready var shot = preload("res://Nodes/Combat/GroundShot.tscn")
export(float) var speed
export(float) var move_range

#physics
var velocity = Vector2()
var direction = Vector2(0,1)
var shot_direction = Vector2(-1, 0)

#control
var health = 1
var is_dead = false

func _ready():
	pass

func _process(delta):
	if is_dead == false:
		$AnimatedSprite.play("idle")
#		if position.y > move_range or position.y < -move_range:
#			direction *= -1
#
#		velocity = speed * direction
#		position += velocity * delta
#
		
#
#		if is_on_floor() or is_on_ceiling():
#			direction = direction * -1

func die():
	is_dead = true
	$AnimatedSprite.play("die")
	$CollisionShape2D.disabled = true
	$HitBoxDamage.set_deferred("monitorable", false)
	$FreeDeadNode.start()

func take_damage(damage, positionX):
	health -= damage
	print(health, damage)
	if health <= 0:
		die()

func _on_FreeDeadNode_timeout():
	queue_free()
	
func _on_Shoot_timeout():
	shooter.fire(shot_direction, shot)
	pass

func _on_PlayerDetector_body_entered(body):
	if body.is_in_group("player"):
		shot_direction = Vector2(-1, -0.5)


func _on_PlayerDetector_body_exited(body):
	if body.is_in_group("player"):
		shot_direction = Vector2(-1, 0)
