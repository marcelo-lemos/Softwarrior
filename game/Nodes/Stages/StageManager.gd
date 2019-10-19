extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var stage_data = {}
const save_path = "user://saved_game.sav"
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

func save():
	var file = File.new()
	if file.open(save_path, File.WRITE) != 0:
		print("Error opening file")
		return
	
	file.store_line(to_json(stage_data))
	file.close()
	print("Game saved")

func load_():
	var file = File.new()
	if not file.file_exists(save_path):
		print("No file saved!")
		return
	
	if file.open(save_path, File.READ) != 0:
		print("Error opening file")
		return
	
	stage_data = parse_json(file.get_line())
	print("Game loaded")