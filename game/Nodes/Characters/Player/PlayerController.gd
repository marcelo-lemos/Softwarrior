extends Node2D

const GRAVITY = 40.0
const NORMAL = Vector2(0,-1)
const KNOCKBACK_POWER = -150

signal health_changed
signal died

onready var stage = get_node("../")

var max_health = 10
var health = 10
const ABYSS_LIMIT = 80
const MAX_SHURIKEN = 5
const GET_SHURIKEN = 10
const SHURIKEN_ATTACK_BUILD_VALUE = 2

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
var shurikens_count = MAX_SHURIKEN
var shuriken_build_up = 0
var iframed = false

func _ready():
	stage.connect("collected_changed", self, "abcd")
	katana.connect("enemy_hit", self, "enemy_hit")

func abcd():
	print("ADLER")

func _process(delta):
	velocity = body.move_and_slide(velocity, NORMAL)
	
	
	if body.global_position.y > ABYSS_LIMIT:
		die()

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

func enemy_hit():
	shuriken_build_up += SHURIKEN_ATTACK_BUILD_VALUE
	print("BUILD", shuriken_build_up)
	if shuriken_build_up >= 10:
		shuriken_build_up = 0
		if shurikens_count < MAX_SHURIKEN:
			print("DALE")
			shurikens_count += 1