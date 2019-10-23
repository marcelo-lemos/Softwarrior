extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/Button.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	pass # Replace with function body.
	
func _on_Button2_pressed():
	print("Returning to title screen...")
	get_tree().change_scene("Nodes/UI/TitleScreen.tscn")
	
func _on_Button3_pressed():
	print("Quiting...")
	get_tree().quit()
