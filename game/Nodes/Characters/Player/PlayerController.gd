extends Node2D

const GRAVITY = 40.0
const NORMAL = Vector2(0,-1)

var health = 20
var going_right = true

#physics vars
onready var body = get_node("GenericCharacter")
var velocity = Vector2(0,0.2)
var apply_gravity = true
var respawn_position
#gameplay vars
var has_dash = true
var has_double_jump = true
var shuriken_shots = 4
onready var katana = body.get_node("Katana")

func _process(delta):
	velocity = body.move_and_slide(velocity, NORMAL)

func take_damage(damage):
	print("AI CARALHO")
	health -= damage
	print(health, damage)
	if health <= 0:
		die()

func die():
	$GenericCharacter.get_node("AnimatedSprite").flip_v = true


func get_parry_target():
	var areas = $GenericCharacter/ParryArea.get_overlapping_areas()
	if areas.empty():
		return null
		
	var closest = null
	for area in areas:
		if closest == null:
			closest = area
		else:
			if body.global_position.distance_to(area.global_position) < body.global_position.distance_to(closest.global_position):
				closest = area
	return closest
		
