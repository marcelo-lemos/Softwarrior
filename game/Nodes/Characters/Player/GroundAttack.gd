extends "res://Nodes/Characters/Player/PlayerBaseState.gd"

signal attack_finished

onready var katana = body.get_node("Katana")

enum STATES { IDLE, GROUND_ATTACK}
var state = null

enum ATTACK_INPUT_STATES { IDLE, LISTENING, REGISTERED }
var attack_input_state = ATTACK_INPUT_STATES.IDLE
var ready_for_next_attack = false
const MAX_COMBO_COUNT = 2
var combo_count = 0
var canceled = false

var attack_current = {}
var combo = [{
		'damage': 1,
		'animation': 'ground_attack1',
		'animation_sprite': 'GroundCombo1'
	},
	{
		'damage': 1,
		'animation': 'ground_attack2',
		'animation_sprite': 'GroundCombo2'
	}]

#var hit_objects = []

func enter():
	canceled = false
	player.katana.connect("set_attack_input_listening", self, "set_attack_input_listening")
	player.katana.connect("set_ready_for_next_attack", self, "set_ready_for_next_attack")
	print("Entered GROUND_ATTACK")
	
	#sprite.play("Idle")
	attack()
	
func exit():
	print("Exiting GROUND_ATTACK")

func _ready():
	self.connect("body_entered", self, "_on_body_entered")
	_change_state(STATES.IDLE)

func _change_state(new_state):
	match state:
		STATES.GROUND_ATTACK:
			#hit_objects = []
			attack_input_state = ATTACK_INPUT_STATES.IDLE
			ready_for_next_attack = false

	match new_state:
		STATES.IDLE:
			combo_count = 0
			katana.idle()

		STATES.GROUND_ATTACK:
			if combo_count <= MAX_COMBO_COUNT:
				attack_current = combo[combo_count -1]
				katana.attack(attack_current)
				sprite.frame = 0
				sprite.play(attack_current['animation_sprite'])
	

	state = new_state

func update(delta):
	if canceled:
		print("AFUOJN(A*IN")
		emit_signal("finished", "previous")
	player.velocity.x = 0
	if attack_input_state == ATTACK_INPUT_STATES.REGISTERED and ready_for_next_attack:
		attack()
	
	#cancel animation features
	if Input.is_action_pressed("dash"):
		_change_state(STATES.IDLE)
		canceled = true
		emit_signal("finished", "dash")
	if Input.is_action_pressed("jump"):
		_change_state(STATES.IDLE)
		canceled = true
		player.velocity.y = JUMP_FORCE
		emit_signal("finished", "mid_air")

func handle_input(event):
	if not state == STATES.GROUND_ATTACK:
		return
	if attack_input_state != ATTACK_INPUT_STATES.LISTENING:
		return
	if event.is_action_pressed('attack'):
		attack_input_state = ATTACK_INPUT_STATES.REGISTERED

func attack():
	combo_count += 1
	_change_state(STATES.GROUND_ATTACK)

# use with AnimationPlayer func track
func set_attack_input_listening():
	attack_input_state = ATTACK_INPUT_STATES.LISTENING

# use with AnimationPlayer func track
func set_ready_for_next_attack():
	ready_for_next_attack = true
	
func _on_AnimationPlayer_animation_finished(anim_name):
	
	if anim_name in ['ground_attack1', 'ground_attack2']:
		if not attack_current:
			return
		if attack_input_state == ATTACK_INPUT_STATES.REGISTERED and combo_count < MAX_COMBO_COUNT:
			attack()
		else:
			_change_state(STATES.IDLE)
			if !canceled:
				print("a08rhiojsen9ionkl")
				emit_signal("finished", "previous")


