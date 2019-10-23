extends Area2D
signal collected;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var animation_finished = false
var audio_finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	emit_signal("collected")
	$AudioStreamPlayer.play()
	$Sprite.play("OnPickup")
	$CollisionShape2D.set_deferred("disabled",true)

func _on_Sprite_animation_finished():
	if $Sprite.animation == "OnPickup":
		if audio_finished:
			queue_free()
		else:
			animation_finished = true
			$Sprite.visible = false


func _on_AudioStreamPlayer_finished():
	if animation_finished:
		queue_free()
	else:
		audio_finished = true
