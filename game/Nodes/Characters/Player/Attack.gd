extends "res://Nodes/Characters/Player/Move.gd"

func enter():
	player.melee.connect("attack_finished", self, "_on_Katana_attack_finished")
	print("Entered KATANA")
	player.melee.attack()
	player.katana.get_node("AnimationPlayer").play("attack")
	.enter()

func exit():
	print("Exiting KATANA")
	.exit()

func handle_input(event):
	if event.is_action_pressed("jump") and body.is_on_floor():
		player.melee._change_state(0)
		emit_signal("finished", "mid_air")
	return .handle_input(event)

func update(delta):
	if body.is_on_floor():
		player.velocity.x = 0
	.update(delta)

func _on_Katana_attack_finished():
	emit_signal("finished", "previous")
