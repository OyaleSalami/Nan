extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_open_requirements_button_up():
	get_node("Requirements Panel").visible = true

func _on_close_requirements_button_up():
	get_node("Requirements Panel").visible = false

func _on_submit_button_up():
	#TODO: Submi the code for the foods
	pass # Replace with function body.


func _on_back_button_up():
	pass # Replace with function body.
