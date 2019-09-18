extends "res://Scripts/StateMachine/PlayerState/BasePlayerState.gd"
class_name PlayerJumpState

func update(delta) :
	.update(delta)
	var hvel = check_horizontal_direction() * body.AIR_MOVE_SPEED
	body.linear_vel.x = lerp(body.linear_vel.x,hvel.x,0.15)
	body.move()
	body.apply_gravity(delta)
	if(Input.is_action_just_released("jump")):
		check_jump_cut(body.jump_var_height)
	if(body.is_on_floor()):
		machine.change_state("walk")
	check_sprite_dir()
	if body.linear_vel.y <= 0:
		sprite.animation = "jump_up"
	else:
		sprite.animation = "jump_down"
func state_enter():
	print("Jump state entered!")
	.state_enter()

func state_exit():
	#animation_player.play("Squash")
	.state_exit()
