extends KinematicBody2D

const NORMAL = Vector2()

onready var shooter = get_node("Shooter")
onready var shot = preload("res://Nodes/Combat/ShooterShotV.tscn")
export(float) var speed
export(float) var move_range

#physics
var velocity = Vector2()
var direction = Vector2(0,1)

#control
var health = 1
var is_dead = false

func _ready():
	pass

func _process(delta):
	if is_dead == false:
		if (position.y > move_range and direction.y == 1) or (position.y < -move_range and direction.y == -1):
			direction *= -1
			
		velocity = speed * direction
		position += velocity * delta
			
		$AnimatedSprite.play("move")
		
		#if is_on_floor() or is_on_ceiling():
			#direction = direction * -1

func die():
	is_dead = true
	$AnimatedSprite.play("die")
	$CollisionShape2D.disabled = true
	$HitBoxDamage.set_deferred("monitorable", false)
	$FreeDeadNode.start()

func take_damage(damage):
	health -= damage
	print(health, damage)
	if health <= 0:
		die()

func _on_FreeDeadNode_timeout():
	queue_free()
	
func _on_Shoot_timeout():
	shooter.fire(Vector2(-1, 0), shot)
	