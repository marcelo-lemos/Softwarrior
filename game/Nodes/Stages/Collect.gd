extends Area2D
signal collected;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	emit_signal("collected")
	$Sprite.play("OnPickup")
	$CollisionShape2D.set_deferred("disabled",true)

func _on_Sprite_animation_finished():
	if $Sprite.animation == "OnPickup":
		queue_free()
