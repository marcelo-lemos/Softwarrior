extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func idle():
	$AnimationPlayer.stop()
	visible = false
	monitoring = false
	
func attack(attack_current):
	$AnimationPlayer.play(attack_current['animation'])
	visible = true
	monitoring = true
	print(attack_current)

