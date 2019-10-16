extends Node2D

signal attack_finished

onready var katana = get_node("Katana")

enum STATES { IDLE, ATTACK }
var state = null

enum ATTACK_INPUT_STATES { IDLE, LISTENING, REGISTERED }
var attack_input_state = ATTACK_INPUT_STATES.IDLE
var ready_for_next_attack = false
const MAX_COMBO_COUNT = 3
var combo_count = 0

var attack_current = {}
var combo = [{
		'damage': 1,
		'animation': 'attack',
	},
	{
		'damage': 1,
		'animation': 'attack2',
	},
	{
		'damage': 1,
		'animation': 'attack3',
	}]

var hit_objects = []

func _ready():
	#$AnimationPlayer.connect('animation_finished', self, "_on_animation_finished")
	self.connect("body_entered", self, "_on_body_entered")
	_change_state(STATES.IDLE)

func _change_state(new_state):
	match state:
		STATES.ATTACK:
			hit_objects = []
			attack_input_state = ATTACK_INPUT_STATES.IDLE
			ready_for_next_attack = false

	match new_state:
		STATES.IDLE:
			combo_count = 0
			katana.idle()
			#$AnimationPlayer.stop()
			#visible = false
			#monitoring = false
		STATES.ATTACK:
			if combo_count <= MAX_COMBO_COUNT:
				attack_current = combo[combo_count -1]
				katana.attack(attack_current)

			#$AnimationPlayer.play(attack_current['animation'])
			#visible = true
			#monitoring = true
			#print(attack_current)
	state = new_state

func _input(event):
	if not state == STATES.ATTACK:
		return
	if attack_input_state != ATTACK_INPUT_STATES.LISTENING:
		return
	if event.is_action_pressed('attack'):
		attack_input_state = ATTACK_INPUT_STATES.REGISTERED

func _physics_process(delta):
	if attack_input_state == ATTACK_INPUT_STATES.REGISTERED and ready_for_next_attack:
		attack()

func attack():
	combo_count += 1
	_change_state(STATES.ATTACK)

# use with AnimationPlayer func track
func set_attack_input_listening():
	attack_input_state = ATTACK_INPUT_STATES.LISTENING

# use with AnimationPlayer func track
func set_ready_for_next_attack():
	ready_for_next_attack = true
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if not attack_current:
		return
	if attack_input_state == ATTACK_INPUT_STATES.REGISTERED and combo_count < MAX_COMBO_COUNT:
		attack()
	else:
		_change_state(STATES.IDLE)
		emit_signal("attack_finished")

func _on_Katana_body_entered(body):
	if body.is_in_group("enemy"):
		body.take_damage(attack_current['damage'])

