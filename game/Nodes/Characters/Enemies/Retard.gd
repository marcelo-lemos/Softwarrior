extends KinematicBody2D

const GRAVITY = 10.0
const WALK_SPEED = 200
const NORMAL = Vector2(0, -1)

var direction = 1
var velocity = Vector2()

var health = 3
var is_dead = false

func _ready():
	pass 

func _physics_process(delta):
	if is_dead == false:
		velocity.x = WALK_SPEED * direction
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, NORMAL)
		
		$AnimatedSprite.play("idle")
		
		if is_on_wall():
			direction = direction * -1
			$FootRight.position.x *= -1
		if $FootRight.is_colliding() == false:
			direction = direction * -1
			$FootRight.position.x *= -1

func died():
	is_dead = true
	$AnimatedSprite.play("died")
	$CollisionShape2D.disabled = true
	$Timer.start()

func take_damage(damage):
	health -= damage
	print(health, damage)
	if health <= 0:
		died()

func _on_Timer_timeout():
	queue_free()