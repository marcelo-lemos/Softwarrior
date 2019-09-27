extends Node2D

var shuriken= preload("Shuriken.tscn")

func fire(direction):

	print(direction)
	var new_shuriken = shuriken.instance()
	new_shuriken.direction = direction
	add_child(new_shuriken)
