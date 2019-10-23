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

var shooting = false

func _ready():
	$Shoot.start()
	pass

func _process(delta):
	if direction.x > 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
		
	if is_dead == false:
		if(shooting):
			$AnimatedSprite.play("shoot")
			velocity = 0 
		else:
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
	$HitBoxDamage.set_deferred("monitorable", false)
	$FreeDeadNode.start()

func take_damage(damage, position):
	health -= damage
	#print(health, damage)
	if health <= 0:
		die()

func _on_FreeDeadNode_timeout():
	queue_free()
	
func _on_Shoot_timeout():
	shooter.fire_multi((Vector2.RIGHT * direction).rotated(deg2rad(direction.x * 45)) , shot)
	shooting = true
	

func _on_Shooter_multi_fire_finished():
	shooting = false
	print("Signal received")
	$Shoot.start()
