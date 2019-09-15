extends Node2D

#Data will be loaded using stage id:

export (NodePath) var up 
export (NodePath) var down
export (NodePath) var left 
export (NodePath) var right
export (PackedScene) var stage_scene : PackedScene
var stage_complete
var stage_data
# Called when the node enters the scene tree for the first time.
func _ready():
	#if (!StageManager.stage_data.has(stage_scene.name)
	register_stage()
	

func register_stage():
	if(stage_scene != null):
		var split_name = stage_scene.resource_path.split("/") 
		var scene_name = split_name[split_name.size() - 1] 
		
		if !StageManager.has(scene_name):
			stage_data = StageData.new()
			StageManager.register(scene_name, stage_data)
		else:
			stage_data = StageManager.get(scene_name)
	else:
		print("Warning! Null stage!")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show_info():
	pass
