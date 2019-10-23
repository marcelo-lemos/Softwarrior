extends Node2D

export(String) var projectile_name
signal multi_fire_finished

export (int) var fire_amount = 4
var current_fire = 0
export (int) var spread = 15
var multi_direction
var multi_projectile

func fire(direction, projectile):
	var new_projectile = projectile.instance()
	new_projectile.direction = direction
	new_projectile.global_position = $ProjectileOrigin.global_position
	add_child(new_projectile)

func fire_multi(direction, projectile):
	current_fire = 0
	multi_direction = direction
	multi_projectile = projectile
	fire(multi_direction.rotated(deg2rad(rand_range(-spread,spread))),multi_projectile)
	$Reload.start()

func _on_Reload_timeout():
	fire(multi_direction.rotated(deg2rad(rand_range(-spread,spread))),multi_projectile)
	if(current_fire < fire_amount):
		current_fire +=1 
		$Reload.start()
	else:
		print("Emitting signal")
		emit_signal("multi_fire_finished")
	
