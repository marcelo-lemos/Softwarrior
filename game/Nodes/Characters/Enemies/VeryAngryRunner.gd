extends KinematicBody2D

const NORMAL = Vector2(0,-1)
const GRAVITY = 10.0
const JUMP_FORCE = -300
const ACCELERATION = 7
const MAX_VELOCITY = 300
const MIN_DIST_H = 80
const MIN_DIST_V = 40
const MAX_JUMP_POWER = -300
const KNOCKBACK_POWER = -150
#onready var shooter = get_node("Shooter")
#onready var shot = preload("res://Nodes/Combat/GroundShoot.tscn")

export(float) var speed
#export(float) var move_range

#physics
var velocity = Vector2()
var direction = -1
#var shot_direction = Vector2(-1, 0)

#control
var health = 1
var is_dead = false
var player_on_sight = false
var player = null

func _ready():
	pass

func _process(delta):
	if is_dead == false:
		$AnimatedSprite.play("run")

		#velocity.x = speed * direction
		
		velocity.y += GRAVITY
		
		if player_on_sight:
			if player.global_position.x < self.global_position.x:
				velocity.x -= ACCELERATION
			else:
				velocity.x += ACCELERATION
				
			if (abs(player.global_position.x - self.global_position.x) < MIN_DIST_H) \
				and (is_on_floor()) \
				and (abs(self.global_position.y - player.global_position.y) > MIN_DIST_V):
				
				print(self.global_position.y - player.global_position.y)
				self.velocity.y = MAX_JUMP_POWER * ((self.global_position.y - player.global_position.y)/100)
			
		velocity = move_and_slide(velocity, NORMAL)

func die():
	is_dead = true
	$AnimatedSprite.play("die")
	$CollisionShape2D.disabled = true
	$HitBoxDamage.set_deferred("monitorable", false)
	$FreeDeadNode.start()

func take_damage(damage, positionX):
	if positionX < position.x:
		velocity.x = -KNOCKBACK_POWER
	else:
		velocity.x = KNOCKBACK_POWER
	health -= damage
	print(health, damage)
	if health <= 0:
		die()

func _on_FreeDeadNode_timeout():
	queue_free()
	
func _on_PlayerDetector_body_entered(body):
	if body.is_in_group("player"):
		player = body
		player_on_sight = true

func _on_PlayerDetector_body_exited(body):
	if body.is_in_group("player"):
		player_on_sight = false
