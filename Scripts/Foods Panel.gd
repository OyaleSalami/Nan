extends Panel

var index = 0

func _ready():
	disable_all_panels()
	update_ui()
	connect_cakes()
	connect_drinks()
	connect_fruits()
	connect_meat()
	connect_vegetables()

func connect_cakes():
	get_node("Cakes Panel/Control/Cupcake").connect("button_down", self, "on_cake_button_pressed", ["cupcake"])
	get_node("Cakes Panel/Control/Sundae").connect("button_down", self, "on_cake_button_pressed", ["sundae"])
	get_node("Cakes Panel/Control/Cake 1").connect("button_down", self, "on_cake_button_pressed", ["cake 1"])
	get_node("Cakes Panel/Control/Cake 2").connect("button_down", self, "on_cake_button_pressed", ["cake 2"])

func connect_fruits():
	get_node("Fruit Panel/Control/Coconut").connect("button_down", self, "on_fruit_button_pressed", ["coconut"])
	get_node("Fruit Panel/Control/Apple").connect("button_down", self, "on_fruit_button_pressed", ["apple"])
	get_node("Fruit Panel/Control/Cherry").connect("button_down", self, "on_fruit_button_pressed", ["cherry"])
	get_node("Fruit Panel/Control/Avocado").connect("button_down", self, "on_fruit_button_pressed", ["avocado"])
	get_node("Fruit Panel/Control/Orange").connect("button_down", self, "on_fruit_button_pressed", ["orange"])
	get_node("Fruit Panel/Control/Pear").connect("button_down", self, "on_fruit_button_pressed", ["pear"])
	get_node("Fruit Panel/Control/Pineapple").connect("button_down", self, "on_fruit_button_pressed", ["pineapple"])
	get_node("Fruit Panel/Control/Strawberry").connect("button_down", self, "on_fruit_button_pressed", ["strawberry"])
	get_node("Fruit Panel/Control/Watermelon").connect("button_down", self, "on_fruit_button_pressed", ["watermelon"])

func connect_vegetables():
	get_node("Vegetable Panel/Control/Beet").connect("button_down", self, "on_vegetable_button_pressed", ["beet"])
	get_node("Vegetable Panel/Control/Broccoli").connect("button_down", self, "on_vegetable_button_pressed", ["broccoli"])
	get_node("Vegetable Panel/Control/Cabbage").connect("button_down", self, "on_vegetable_button_pressed", ["cabbage"])
	get_node("Vegetable Panel/Control/Cauliflower").connect("button_down", self, "on_vegetable_button_pressed", ["cauliflower"])
	get_node("Vegetable Panel/Control/Carrot").connect("button_down", self, "on_vegetable_button_pressed", ["carrot"])

func connect_drinks():
	get_node("Drinks Panel/Control/Soda").connect("button_down", self, "on_drink_button_pressed", ["soda"])
	get_node("Drinks Panel/Control/Malt").connect("button_down", self, "on_drink_button_pressed", ["malt"])
	get_node("Drinks Panel/Control/Milk").connect("button_down", self, "on_drink_button_pressed", ["milk"])
	get_node("Drinks Panel/Control/Red Wine").connect("button_down", self, "on_drink_button_pressed", ["red wine"])
	get_node("Drinks Panel/Control/White Wine").connect("button_down", self, "on_drink_button_pressed", ["white wine"])

func connect_meat():
	get_node("Meat Panel/Control/Bacon").connect("button_down", self, "on_meat_button_pressed", ["bacon"])
	get_node("Meat Panel/Control/Fish").connect("button_down", self, "on_meat_button_pressed", ["fish"])
	get_node("Meat Panel/Control/Sausage").connect("button_down", self, "on_meat_button_pressed", ["sausage"])
	get_node("Meat Panel/Control/Turkey").connect("button_down", self, "on_meat_button_pressed", ["turkey"])
	get_node("Meat Panel/Control/Drumstick").connect("button_down", self, "on_meat_button_pressed", ["drumstick"])
	get_node("Meat Panel/Control/Skewer").connect("button_down", self, "on_meat_button_pressed", ["skewer"])

func disable_all_panels():
	get_node("Drinks Panel").visible = false
	get_node("Fruit Panel").visible = false
	get_node("Vegetable Panel").visible = false
	get_node("Meat Panel").visible = false
	get_node("Cakes Panel").visible = false

func update_ui():
	disable_all_panels()
	if(index == 0): get_node("Fruit Panel").visible = true
	if(index == 1): get_node("Vegetable Panel").visible = true
	if(index == 2): get_node("Meat Panel").visible = true
	if(index == 3): get_node("Drinks Panel").visible = true
	if(index == 4): get_node("Cakes Panel").visible = true

func _on_Back_button_up():
	if(index <= 0): index = 0
	else: index = index - 1
	update_ui()

func _on_Forward_button_up():
	if(index >= 4): index = 4
	else: index = index + 1
	update_ui()

func on_cake_button_pressed(name):
	GameManager.foodType = "C"
	GameManager.update_object(name)
	print("Cake..." + name)

func on_fruit_button_pressed(name):
	GameManager.foodType = "F"
	GameManager.update_object(name)
	print("Fruit..." + name)

func on_meat_button_pressed(name):
	GameManager.foodType = "M"
	GameManager.update_object(name)
	print("Meat..." + name)

func on_drink_button_pressed(name):
	GameManager.foodType = "D"
	GameManager.update_object(name)
	print("Drink..." + name)

func on_vegetable_button_pressed(name):
	GameManager.foodType = "V"
	GameManager.update_object(name)
	print("Vegetable..." + name)
