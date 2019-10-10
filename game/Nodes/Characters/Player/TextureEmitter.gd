extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var flip_h = false setget set_flip_h
var is_emitting = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.


func stop_emitting():
	if(flip_h == true):
		$Flip.stop_emitting()
	else:
		$Default.stop_emitting()

func start_emitting():
	if(flip_h == true):
		$Flip.start_emitting()
	else:
		$Default.start_emitting()

func set_flip_h(value):
	stop_emitting()
	flip_h = value
	start_emitting()