extends Object
class_name StateMachine

var body
var sprite
var states = {}
var current_state : State

func _init(body, sprite):
	self.body = body
	self.sprite = sprite
	self.add_state(load("res://Scripts/StateMachine/State.gd").new(),"empty")
	self.change_state("empty")
	
func add_state(state, key):
	state.body = body
	state.sprite = sprite
	state.machine = self
	states[key] = state
	if current_state == null:
		change_state(key)
		
func update(delta):
	if(current_state != null):
		current_state.update(delta)

func change_state(next):
	if states.has(next):
		if current_state != null:	
			current_state.state_exit()
		current_state = states[next]
		current_state.sprite.animation = next
		current_state.state_enter()
	else:
		print(next + " is not a valid state.")

func is_state(key):
	return current_state == states[key]