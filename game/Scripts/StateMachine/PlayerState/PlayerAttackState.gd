extends "res://Scripts/StateMachine/PlayerState/BasePlayerState.gd"
class_name PlayerAttackState

var katana = load("res://Nodes/Combat/Katana.gd").new()

func update(delta):
	.update(delta)
	#katana = load("res://Nodes/Combat/Weapon.gd").new()
	print(katana.damage)
	
	katana.attack()
	
func state_enter():
	print("Attack state entered")
	.state_enter()
	
func state_exit():
	.state_exit()