extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var current_stage = get_child(0)
onready var selector = $Selector
var moving = false
var game

onready var tween = $Tween
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if !moving:
		if Input.is_action_just_pressed("ui_right"):
			if(current_stage.right != null):
				current_stage = current_stage.get_node(current_stage.right)
			move_tween()
			moving = true
		elif Input.is_action_just_pressed("ui_down"):
			if(current_stage.down != null):
				current_stage = current_stage.get_node(current_stage.down)
			move_tween()
			moving = true
		elif Input.is_action_just_pressed("ui_left"):
			if(current_stage.left != null):
				current_stage = current_stage.get_node(current_stage.left)
			move_tween()
			moving = true
		elif Input.is_action_just_pressed("ui_up"):
			if(current_stage.up != null):
				current_stage = current_stage.get_node(current_stage.up)
			move_tween()
			moving = true
		if Input.is_action_just_pressed("ui_accept"):
			enter_stage()
		
func move_tween():
	tween.interpolate_property(selector, "position",
				selector.position, current_stage.position, 0.6,
				Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	tween.start()

	
func _on_Tween_tween_completed(object, key):
	moving = false

func enter_stage():
	if(current_stage.stage_scene != null):
		get_tree().change_scene(current_stage.stage_scene.resource_path)


func _on_Button_pressed():
	StageManager.save()


func _on_Button2_pressed():
	StageManager.load_()
