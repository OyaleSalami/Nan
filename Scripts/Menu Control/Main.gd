extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_play_button_down():
	#TODO: Change scene to the next one ("Game Scene")
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	pass # Replace with function body.
