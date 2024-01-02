extends Control

var time = 120 #Time in seconds

func _ready():
	GameManager.score = 0

func _process(delta):
	GameManager.score += delta
	if(time <= 0): end_game()
	time -= delta
	display_time()

func add_time(value):
	time += value
	
func display_time():
	var minute = int(time/60)
	var sec = int(int(time) % 60)
	get_node("Time Label").text = str(minute) + ":" + str(sec)
	
func end_game():
	get_tree().change_scene("res://Scenes/End.tscn")

func _on_open_requirements_button_up():
	get_node("Requirements Panel").visible = true

func _on_close_requirements_button_up():
	get_node("Requirements Panel").visible = false
	
func _on_back_button_up():
	pass # Replace with function body.

func _on_Home_Button_button_up():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.
