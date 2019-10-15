extends Node2D

var shuriken = preload("Shuriken.tscn")

func fire(direction):
	var new_shuriken = shuriken.instance()
	new_shuriken.direction = direction
	new_shuriken.global_position = global_position
	add_child(new_shuriken)
