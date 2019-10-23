extends Node2D

const GRAVITY = 40.0
const NORMAL = Vector2(0,-1)
const KNOCKBACK_POWER = -150

signal health_changed
signal died

var max_health = 10
var health = 10
var going_right = true

#physics vars
onready var body = get_node("GenericCharacter")
onready var katana = body.get_node("Katana")
var velocity = Vector2(0,0.2)
var apply_gravity = true
var respawn_position
#gameplay vars
var has_dash = true
var has_double_jump = true
var shuriken_shots = 4
var iframed = false

func _process(delta):
	velocity = body.move_and_slide(velocity, NORMAL)

func take_damage(damage, positionX):
	if !iframed:
		iframed = true
		$iFrame.start()
		print("AI CARALHO")
		health -= damage
		print(health, damage)
		emit_signal("health_changed", health)
		
		velocity.y = KNOCKBACK_POWER
		if positionX < body.position.x:
			velocity.x = -KNOCKBACK_POWER
		else:
			velocity.x = KNOCKBACK_POWER
		
		if health <= 0:
			die()
	
func die():
	$GenericCharacter.get_node("AnimatedSprite").flip_v = true
	emit_signal("died")

func _on_iFrame_timeout():
	iframed = false

func _on_HitBoxDamage_area_entered(area):
	if area.is_in_group("enemy"):
		take_damage(1, area.position.x)
