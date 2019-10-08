extends "res://Nodes/Characters/Player/Motion.gd"

onready var katana = get_node("../../Katana")

func enter():
	print("Entered KATANA")
	katana.get_node("AnimationPlayer").play("idle")
	.enter()

func exit():
	print("Exiting KATANA") 
	.exit()

func _on_Katana_attack_finished():
	print("lixo")
	emit_signal("finished", "previous")
