extends Node2D

onready var animation_player = get_node("AnimationPlayer")
onready var hit_box = get_node("HitBox")

var current_attack = null

#ground_attack signals, used by animation
signal set_attack_input_listening
signal set_ready_for_next_attack

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func idle():
	animation_player.stop()
	hit_box.visible = false
	hit_box.monitoring = false
	
func ground_attack(attack_current):
	current_attack = attack_current
	animation_player.play(attack_current['animation'])
	visible = true
	hit_box.monitoring = true
	print(attack_current)
	
func air_attack():
	pass

func dash_attack():
	pass

func _on_HitBox_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage(current_attack['damage'])

func animation_player_method_call(function_name):
	match function_name:
		"set_attack_input_listening":
			emit_signal(function_name)
			