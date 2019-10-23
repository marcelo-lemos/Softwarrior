extends "MidAir.gd"

var canceled = false
var attack_type =  {'damage': 1, 'animation': 'air_attack'}

func enter():
	canceled = true
	print("Entered AIR_ATTACK")
	sprite.play("Idle")
	player.katana.attack(attack_type)
	
func update(delta):
	if canceled:
		emit_signal("finished", "previous")
	
	#player.velocity.y += GRAVITY
	apply_air_slowdown()
	
	if(Input.is_action_just_released("jump")):
		check_jump_cut(jump_var_height)
	
	if Input.is_action_pressed("dash") and player.has_dash:
		canceled = true
		emit_signal("finished", "dash")
		
#NAO DELETAR
#precisei do override da funcao p n chamar a de midair
func handle_input(event):
	pass
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name in ['air_attack']:
		player.katana.idle()
		if !canceled:
			emit_signal("finished", "previous")