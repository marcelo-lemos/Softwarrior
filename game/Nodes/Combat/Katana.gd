extends Area2D

onready var animation_player = get_node("../AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func idle():
	animation_player.stop()
	visible = false
	monitoring = false
	
func attack(attack_current):
	animation_player.play(attack_current['animation'])
	visible = true
	monitoring = true
	print(attack_current)
