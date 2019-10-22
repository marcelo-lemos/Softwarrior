extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stage_data = {}
# Called when the node enters the scene tree for the first time.

func has(key):
	return stage_data.has(key)

func register(key,value):
	stage_data[key] = value

func get(key):
	return stage_data[key]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
