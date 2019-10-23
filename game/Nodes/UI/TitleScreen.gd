extends Node

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()

func _on_TextureButton_pressed():
	get_tree().change_scene("Nodes/Stages/StageDemo.tscn")

func _on_TextureButton3_pressed():
	get_tree().quit()
