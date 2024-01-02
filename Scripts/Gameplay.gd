extends Spatial

var mydict = {"C" : "cake", "D" : "drink", "M" : "meat", "V": "vegetable", "F" : "fruit"}
var drag

var box1_list = Array() #array of what box 1 has
var box2_list = Array() #array of what box 2 has
var box3_list = Array() #array of what box 3 has
var box4_list = Array() #array of what box 4 has

var req1 = Array() #The first requirement
var req2 = Array() #The first requirement
var req3 = Array() #The first requirement
var req4 = Array() #The first requirement

func _ready():
	randomize()
	get_viewport().physics_object_picking = true
	generate_requirements()

func _process(_delta):
	if (GameManager.changed == true): update_object()

#Requirement Generator
func generate_requirements():
	var temp = ["C", "D", "F", "M", "V"]
	var index 
	var rnum 
	
	req1.clear()
	req2.clear()
	req3.clear()
	req4.clear()
	
	# Generate a type 1
	index = randi() % temp.size()
	rnum = randi() % 4 + 1
	req1.append(temp[index])
	req1.append(str(rnum))
	
	# Generate a type 2
	index = randi() % temp.size()
	req2.append(temp[index])
	req2.append(temp[index-1])
	
	# Generate a type 3
	index = randi() % temp.size()
	req3.append("!") 
	if (randi() % 2 == 0): req3.append(req1[0])
	else: req3.append(req2[1])
	req3.append(temp[index-2])
	
	# Generate a type 4
	index = randi() % temp.size()
	req4.append(req1[0])
	req4.append(temp[index])
	req4.append("!")
	req4.append(temp[index-1])
	
	update_requirement_display()

func update_requirement_display():
	get_node("UI/Requirements Panel/1/Label").text = gen_type1(req1) #req1
	get_node("UI/Requirements Panel/2/Label").text = gen_type2(req2) #req2
	get_node("UI/Requirements Panel/3/Label").text = gen_type3(req3) #req3
	get_node("UI/Requirements Panel/4/Label").text = gen_type4(req4) #req4

func gen_type1(req): #C2
	var text = "At least " + str(req[1]) + " plates should have a " + str(mydict[req[0]])
	return text

func gen_type2(req): #DC
	var text = "Every plate that has " + mydict[req[0]] + " should have a " + mydict[req[1]]
	return text

func gen_type3(req): #!CM
	var text = "Every plate that doesn't have " + mydict[req[1]] + " should have a " + mydict[req[2]] 
	return text

func gen_type4(req): #VF!C
	var text = "Every box that has a " + mydict[req[0]] + " and a " + mydict[req[1]] + ", should not have a " + mydict[req[3]]
	return text

func check_requirements():
	var checked = true
	
	if(check_req1() == true):
		get_node("UI/Requirements Panel/1/Check Image").visible = true
	else: 
		get_node("UI/Requirements Panel/1/Check Image").visible = false
		checked = false
	
	if(check_req2() == true):
		get_node("UI/Requirements Panel/2/Check Image").visible = true
	else: 
		get_node("UI/Requirements Panel/2/Check Image").visible = false
		checked = false
	
	if(check_req3() == true):
		get_node("UI/Requirements Panel/3/Check Image").visible = true
	else: 
		get_node("UI/Requirements Panel/3/Check Image").visible = false
		checked = false
	
	if(check_req4() == true):
		get_node("UI/Requirements Panel/4/Check Image").visible = true
	else: 
		get_node("UI/Requirements Panel/4/Check Image").visible = false
		checked = false
		
	return checked

func check_req1(): #C2
	var count = 0
	if(box1_list.has(req1[0])): count += 1 
	if(box2_list.has(req1[0])): count += 1 
	if(box3_list.has(req1[0])): count += 1 
	if(box4_list.has(req1[0])): count += 1 
	
	if(count >= 2): return true
	else: return false
	
func check_req2(): #CD
	var checked = true
	
	if(box1_list.has(req2[0])):
		if(box1_list.has(req2[1])): checked = true
		else: checked = false
	
	if(box2_list.has(req2[0])):
		if(box2_list.has(req2[1])): checked = true
		else: checked = false
	
	if(box3_list.has(req2[0])):
		if(box3_list.has(req2[1])): checked = true
		else: checked = false
		
	if(box4_list.has(req2[0])):
		if(box4_list.has(req2[1])): checked = true
		else: checked = false
		
	return checked
	
func check_req3(): #!CM
	var checked = true
	
	if(box1_list.find(req3[1]) == -1):
		if(box1_list.has(req3[2])): checked = true
		else: checked = false
	
	if(box2_list.find(req3[1]) == -1):
		if(box2_list.has(req3[2])): checked = true
		else: checked = false
		
	if(box3_list.find(req3[1]) == -1):
		if(box3_list.has(req3[2])): checked = true
		else: checked = false
	
	if(box4_list.find(req3[1]) == -1):
		if(box4_list.has(req3[2])): checked = true
		else: checked = false
		
	return checked
	
func check_req4(): #VF!C
	var checked = true
	
	if(box1_list.has(req4[0]) and  box1_list.has(req4[1])):
		if(box1_list.has(req4[3])): checked = false
		else: checked = true
	
	if(box2_list.has(req4[0]) and  box2_list.has(req4[1])):
		if(box2_list.has(req4[3])): checked = false
		else: checked = true
	
	if(box3_list.has(req4[0]) and  box3_list.has(req4[1])):
		if(box3_list.has(req4[3])): checked = false
		else: checked = true
	
	if(box4_list.has(req4[0]) and  box4_list.has(req4[1])):
		if(box4_list.has(req4[3])): checked = false
		else: checked = true
		
	return checked

#Object Code
func add_to_box(value):
	if value == 1:
		for n in get_node("Box 1/pos").get_children():
			if n.get_child_count() <= 0:
				n.add_child(GameManager.food.instance()) #Add object to the box
				box1_list.append(GameManager.foodType) #Append the type
				break
		return
	if value == 2:
		for n in get_node("Box 2/pos").get_children():
			if n.get_child_count() <= 0:
				n.add_child(GameManager.food.instance()) #Add object to the box
				box2_list.append(GameManager.foodType) #Append the type
				break
		return
	if value == 3:
		for n in get_node("Box 3/pos").get_children():
			if n.get_child_count() <= 0:
				n.add_child(GameManager.food.instance()) #Add object to the box
				box3_list.append(GameManager.foodType) #Append the type
				break
		return
	if value == 4:
		for n in get_node("Box 4/pos").get_children():
			if n.get_child_count() <= 0:
				n.add_child(GameManager.food.instance()) #Add object to the box
				box4_list.append(GameManager.foodType) #Append the type
				break
		return
	reset_object()

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

func _on_box2_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_released("click"):
		if drag == true:
			print("object dropped here")
			get_node("Centre/0").visible = false
			add_to_box(2)

func _on_box3_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_released("click"):
		if drag == true:
			print("object dropped here")
			get_node("Centre/0").visible = false
			add_to_box(3)

func _on_box4_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
	if event is InputEventMouseButton and Input.is_action_just_released("click"):
		if drag == true:
			print("object dropped here")
			get_node("Centre/0").visible = false
			add_to_box(4)

func _on_Reset_Button_1_button_up():
	box1_list.clear()
	for n in get_node("Box 1/pos").get_children():
		for m in n.get_children():
			m.queue_free()

func _on_Reset_Button_2_button_up():
	box2_list.clear()
	for n in get_node("Box 2/pos").get_children():
		for m in n.get_children():
			m.queue_free()

func _on_Reset_Button_3_button_up():
	box3_list.clear()
	for n in get_node("Box 3/pos").get_children():
		for m in n.get_children():
			m.queue_free()

func _on_Reset_Button_4_button_up():
	box4_list.clear()
	for n in get_node("Box 4/pos").get_children():
		for m in n.get_children():
			m.queue_free()

func _on_Submit_button_up():
	if (check_requirements() == true):
		generate_requirements()
		get_node("UI").add_time(100)
		GameManager.store += GameManager.score
		GameManager.score = 0
	else: 
		return
