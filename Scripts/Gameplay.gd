extends Spatial

var drag
var object #Object to be added to the plates

var box_index = 0
var box1_list #array of what box 1 has
var box2_list #array of what box 2 has
var box3_list #array of what box 3 has
var box4_list #array of what box 4 has

func _ready():
	get_viewport().physics_object_picking = true

func _process(_delta):
	if (GameManager.changed == true): update_object()

func _input(event):
	if event.is_action_released("click"):
		#drag = false
		print("Object Reset")

func add_to_box(value):
	if box_index == 1:
		for n in get_children():
			pass
		box1_list.append(value)
	if box_index == 2:
		box2_list.append(value)
		pass
	if box_index == 3:
		box3_list.append(value)
		pass
	if box_index == 4:
		box4_list.append(value)
		pass

func reset_object():
	get_node("Centre/0").visible = true

func update_object():
	get_node("Centre/0").visible = true
	if (get_node("Centre/0").get_child_count() > 0):
		self.get_node("Centre/0").get_child(0).queue_free() #Delete previous object
	self.get_node("Centre/0").add_child(GameManager.food.instance()) #Add new object
	GameManager.changed = false

func _on_centre_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_pressed("click"): #Start drag
		drag = true
		print("....")

func _on_box1_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_released("click"):
		if drag == true:
			print("object dropped here")
			get_node("Centre/0").visible = false
			add_to_box(1)
