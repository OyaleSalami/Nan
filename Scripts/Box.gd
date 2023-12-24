extends Spatial

var food_list = Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_new_food(food_object):
	for n in get_children():
		if (n.get_child_count() == 0):
			n.add_node(food_object)
			break
