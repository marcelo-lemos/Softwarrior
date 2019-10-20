extends KinematicBody2D

const NORMAL = Vector2()

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
		if position.x > move_range:
			direction *= -1
			
		velocity.x = speed * direction
		position += velocity * delta
			
		$AnimatedSprite.play("move")
		
		if is_on_wall():
			direction = direction * -1

func die():
	is_dead = true
	$AnimatedSprite.play("die")
	$CollisionShape2D.disabled = true
	$Timer.start()

func take_damage(damage):
	health -= damage
	print(health, damage)
	if health <= 0:
		die()

func _on_Timer_timeout():
	queue_free()