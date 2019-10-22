extends Area2D
signal activate_checkpoint(checkpoint)
var active = false
onready var respawn_position = $RespawnPosition.global_position
func deactivate():
	active = false
	$Sprite.animation = "Deactivated"

func _on_Checkpoint_body_entered(body):
	if active == false:
		active = true
		$Sprite.play("Activation")
		emit_signal("activate_checkpoint",self)

func _on_Sprite_animation_finished():
	if $Sprite.animation == "Activation":
		$Sprite.call_deferred("play","Activated")
