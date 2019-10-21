extends Node2D

export(String) var projectile_name

func fire(direction, projectile):
	var new_projectile = projectile.instance()
	new_projectile.direction = direction
	new_projectile.global_position = global_position
	add_child(new_projectile)
