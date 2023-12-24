extends Spatial

var object #Object to be added to the plates

func _ready():
	get_viewport().physics_object_picking = true

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_RIGHT):
		object = null #drop object
	pass

func _on_Box1_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Dropped An Object Here!")
		pass
		
	if object != null:
		#Place Object In A Box
		pass
	pass
