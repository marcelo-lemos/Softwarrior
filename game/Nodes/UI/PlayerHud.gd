extends CanvasLayer

const HEALTH_POINT_REPEAT = 15
const SHURIKEN_POINT_REPEAT = 19

func update_hud(health,shuriken):
	set_health(health)
	set_shuriken(shuriken)
	
func set_health(value):
	$HudLayer0/HudLayer1/HealthPoint.rect_size.x = HEALTH_POINT_REPEAT * value
	
func set_shuriken(value):
	$HudLayer0/HudLayer1/ShurikenPoint.rect_size.x = SHURIKEN_POINT_REPEAT * value

func _on_MainCharacter_health_changed(health_value):
	set_health(health_value) # Replace with function body.


func _on_MainCharacter_shuriken_changed(shuriken_value, buildup_fract):
	set_shuriken(shuriken_value + buildup_fract)
	print("set shuriken")
	print(shuriken_value + buildup_fract)
	print(buildup_fract)
