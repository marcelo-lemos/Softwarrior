extends Node2D

var shuriken = preload("Shuriken.tscn")

func _input(event):
	if event.is_action_pressed("fire"):
		if owner.shuriken_shots > 0:
			if owner.going_right:
				fire(Vector2(1, 0))
			else:
				fire(Vector2(-1, 0))

func fire(direction):

	print(direction)
	owner.shuriken_shots -= 1
	var new_shuriken = shuriken.instance()
	new_shuriken.direction = direction
	add_child(new_shuriken)
