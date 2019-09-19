extends "res://Scripts/StateMachine/PlayerState/BasePlayerState.gd"
class_name PlayerWalkState

func update(delta):
	#.update(delta)
	body.linear_vel.y = 0
	body.apply_gravity(delta)
	var hvel = check_horizontal_direction() * body.PURE_WALK_SPEED
	body.linear_vel.x = lerp(body.linear_vel.x,hvel.x,0.25)
	body.move()
	check_jump(body.PURE_JUMP_MAX)
	if hvel.x == 0:
		sprite.animation = "idle"
	else:
		sprite.animation = "walk"
	check_sprite_dir()
		
func state_enter():
	print("Walk state entered")
	.state_enter()
	
func state_exit():
	.state_exit()
