extends Panel

var index = 0

## Called when the node enters the scene tree for the first time.
func _ready():
	disable_all_panels()
	update_ui()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func disable_all_panels():
	get_node("Drinks Panel").visible = false
	get_node("Fruit Panel").visible = false
	get_node("Vegetable Panel").visible = false
	get_node("Meat Panel").visible = false
	
func update_ui():
	disable_all_panels()
	if(index == 0):
		get_node("Fruit Panel").visible = true
	if(index == 1):
		get_node("Vegetable Panel").visible = true
	if(index == 2):
		get_node("Meat Panel").visible = true
	if(index == 3):
		get_node("Drinks Panel").visible = true

func _on_Back_button_up():
	if(index <= 0):
		index = 0
	else:
		index = index - 1
	update_ui()

func _on_Forward_button_up():
	if(index >= 3):
		index = 3
	else:
		index = index + 1
	update_ui()
	
	
