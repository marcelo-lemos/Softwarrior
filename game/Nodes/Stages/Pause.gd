extends Control


func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		if visible == true:
			$VBoxContainer/Button.grab_focus()

func _on_Button_pressed():
	get_tree().paused = false
	visible = false


func _on_Button2_pressed():
	pass


func _on_Button3_pressed():
	get_tree().change_scene("Nodes/UI/TitleScreen.tscn")


func _on_Button4_pressed():
	get_tree().quit()
