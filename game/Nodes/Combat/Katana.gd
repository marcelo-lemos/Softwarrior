extends Node2D

onready var animation_player = get_node("AnimationPlayer")
onready var hit_box = get_node("HitBox")

var current_attack = null

signal set_attack_input_listening
signal set_ready_for_next_attack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func idle():
	animation_player.stop()
	hit_box.visible = false
	hit_box.monitoring = false

func attack(attack_current):
	current_attack = attack_current
	animation_player.play(attack_current['animation'])
	visible = true
	hit_box.monitoring = true
	print(attack_current)

func animation_player_method_call(function_name):
	match function_name:
		"set_attack_input_listening", "set_ready_for_next_attack":
			emit_signal(function_name)		

func _on_HitBox_area_entered(area):
	if area.is_in_group("enemy"):
		area.get_node("../").take_damage(current_attack['damage'], area.position.x)