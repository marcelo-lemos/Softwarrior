extends Node2D

const GRAVITY = 40.0
const NORMAL = Vector2(0,-1)
const KNOCKBACK_POWER = -150

signal health_changed(health_value)
signal shuriken_changed(shuriken_value,buildup_fract)
signal died

onready var stage = get_node("../")

var max_health = 6
var health = max_health
const ABYSS_LIMIT = 80
const MAX_SHURIKEN = 4
const GET_SHURIKEN = 4
const SHURIKEN_ATTACK_BUILD_VALUE = 1
var going_right = true

#physics vars
onready var body = get_node("GenericCharacter")
onready var katana = body.get_node("Katana")
onready var shuriken = preload("res://Nodes/Combat/Shuriken.tscn")
onready var shuriken_spawner = $GenericCharacter/RangedAttack
var velocity = Vector2(0,0.2)
var apply_gravity = true
var respawn_position = Vector2()
#gameplay vars
var has_dash = true
var has_double_jump = true
var shurikens_count = MAX_SHURIKEN 
var shuriken_build_up = 0
var iframed = false

func _ready():
	stage.connect("collected_changed", self, "abcd")
	katana.connect("enemy_hit", self, "enemy_hit")
	emit_signal("health_changed", health)
	emit_signal("health_changed", health)
	
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
	#$GenericCharacter.get_node("AnimatedSprite").flip_v = true
	health = max_health
	shuriken = MAX_SHURIKEN
	print("Respawn position")
	print(respawn_position)
	global_position = respawn_position
	emit_signal("died")

func _on_iFrame_timeout():
	iframed = false

func _on_HitBoxDamage_area_entered(area):
	if area.is_in_group("enemy"):
		take_damage(1, area.position.x)

func enemy_hit():
	if shurikens_count < MAX_SHURIKEN:
		shuriken_build_up += SHURIKEN_ATTACK_BUILD_VALUE
		print("BUILD", shuriken_build_up)
		if shuriken_build_up >= GET_SHURIKEN:
			shuriken_build_up = 0
			shurikens_count += 1
		emit_signal("shuriken_changed",shurikens_count,float(shuriken_build_up) / float(GET_SHURIKEN))

func fire_shuriken():
	shurikens_count -= 1
	print("SHURIKENS: " + str(shurikens_count))
	if going_right:
		shuriken_spawner.fire(Vector2(1, 0), shuriken)
	else:
		shuriken_spawner.fire(Vector2(-1, 0), shuriken)
	emit_signal("shuriken_changed",shurikens_count, float(shuriken_build_up) / float(GET_SHURIKEN))  