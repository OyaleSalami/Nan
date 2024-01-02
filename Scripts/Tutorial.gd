extends Spatial




func _on_Button_button_up():
	get_tree().change_scene("res://Scenes/Share.tscn")


func _on_Exit_Button_button_up():
	get_node("Details").visible = false
