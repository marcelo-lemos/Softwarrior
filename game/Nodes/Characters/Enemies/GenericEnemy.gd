extends KinematicBody2D

#var direction = 1
var velocity = Vector2()

var health = 3
var is_dead = false

func _ready():
	pass 

func _physics_process(delta):
	pass
	
func die():
	is_dead = true
	$AnimatedSprite.play("died")
	$CollisionShape2D.disabled = true
	$Timer.start()

func take_damage(damage):
	pass

func _on_Timer_timeout():
	queue_free()