extends "PlayerBaseState.gd"

var attack_type =  {'damage': 1, 'animation': 'dash_attack'}
const DASH_ATTACK_SLOWDOWN = 25

func enter():
	print("Entered DASH_ATTACK")
	sprite.play("DashAttack")
	player.katana.attack(attack_type)

func update(delta):
	apply_dash_attack_slowdown()

func exit():
	print("exiting DASH_ATTACK")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name in ['dash_attack']:
		player.katana.idle()
		emit_signal("finished", "previous")
		
func apply_dash_attack_slowdown():
	if player.velocity.x > 0:
		player.velocity.x -= DASH_ATTACK_SLOWDOWN
	elif player.velocity.x < 0:
		player.velocity.x += DASH_ATTACK_SLOWDOWN