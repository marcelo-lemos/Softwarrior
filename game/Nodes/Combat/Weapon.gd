extends Area2D
class_name Weapon

enum State{IDLE, ATTACK}

onready var animation_player = $AnimationPlayer
var weapon_state = State.IDLE

#sujeito a mudanças
export(int) var damage = 1

func _ready():
	set_physics_process(false)


func _physics_process(delta):
	var overlapping_bodies = get_overlapping_bodies()
	if not overlapping_bodies:
		return

	for body in overlapping_bodies:
		if not body.is_in_group("character"):
			continue
		if is_owner(body):
			continue

		body.take_damage(damage)
	set_physics_process(false)
	
func is_owner(node):
	return node.weapon_path == get_path()

func _change_state(new_state):
	weapon_state = new_state

	# Initialize the new state
	match new_state:
		State.ATTACK:
			set_physics_process(true)
		State.IDLE:
			set_physics_process(false)

func attack():
	animation_player.play("attack")
	_change_state(State.ATTACK)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "attack":
		_change_state(State.IDLE)
		emit_signal("attack_finished")
