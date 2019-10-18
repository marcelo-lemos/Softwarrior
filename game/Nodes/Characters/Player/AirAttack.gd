extends "MidAir.gd"

var attack_type =  {'damage': 1, 'animation': 'air_attack'}

func enter():
	print("Entered AIR_ATTACK")
	sprite.play("Idle")
	player.katana.attack(attack_type)
	
func update(delta):
	player.velocity.y += GRAVITY
	apply_air_slowdown()
	
	if(Input.is_action_just_released("jump")):
		check_jump_cut(jump_var_height)

#NAO DELETAR
#precisei do override da funcao p n chamar a de midair
func handle_input(event):
	pass
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name in ['air_attack']:
		player.katana.idle()
		emit_signal("finished", "previous")