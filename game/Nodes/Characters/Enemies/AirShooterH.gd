extends KinematicBody2D

const NORMAL = Vector2()

onready var shooter = get_node("Shooter")
onready var shot = preload("res://Nodes/Combat/ShooterShotH.tscn")
export(float) var speed
export(float) var move_range

#physics
var velocity = Vector2()
var direction = Vector2(1,0)

#control
var health = 3
var is_dead = false

func _ready():
	pass

func _process(delta):
	if is_dead == false:
		if position.x > move_range or position.x < -move_range:
			direction *= -1
			
		velocity = speed * direction
		position += velocity * delta
			
		$AnimatedSprite.play("move")
		
		if is_on_wall():
			direction = direction * -1

func die():
	is_dead = true
	$AnimatedSprite.play("die")
	$CollisionShape2D.disabled = true
	$FreeDeadNode.start()

func take_damage(damage):
	health -= damage
	print(health, damage)
	if health <= 0:
		die()

func _on_FreeDeadNode_timeout():
	queue_free()
	
func _on_Shoot_timeout():
	shooter.fire(Vector2(0, 1), shot)
	print("cheguei H")
	