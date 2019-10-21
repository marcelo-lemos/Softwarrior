extends KinematicBody2D

const NORMAL = Vector2()
const GRAVITY = 10.0
const JUMP_FORCE = 300
#onready var shooter = get_node("Shooter")
#onready var shot = preload("res://Nodes/Combat/GroundShoot.tscn")
export(float) var speed
#export(float) var move_range

#physics
var velocity = Vector2()
var direction = -1
#var shot_direction = Vector2(-1, 0)

#control
var health = 3
var is_dead = false

func _ready():
	pass

func _process(delta):
	if is_dead == false:
		$AnimatedSprite.play("run")

		velocity.x = speed * direction
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, NORMAL)
		
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
	
func _on_PlayerDetector_body_entered(body):
	print("detectou algo")
	if body.is_in_group("player"):
		print("detectou player VERY ANGRY")
		velocity.y = JUMP_FORCE