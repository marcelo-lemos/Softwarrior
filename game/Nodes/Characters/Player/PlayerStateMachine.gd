extends "res://Nodes/Characters/StateMachine.gd"

func _ready():
	states_map = {
		"move": $Move,
		"dash": $Dash,
		"mid_air": $MidAir,
		"on_wall": $OnWall,
		"attack": $Attack
	}

func _change_state(state_name):
	if not _active:
		return
	if state_name in ["mid_air", "dash", "attack"]:
		states_stack.push_front(states_map[state_name])

	._change_state(state_name)

func _input(event):
	if event.is_action_pressed("attack"):
		if current_state == $Attack:
			return
		_change_state("attack")
		return
	current_state.handle_input(event)
	