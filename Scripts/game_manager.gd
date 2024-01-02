extends Node

var score = 0
var store = 0

# C-cake | M-meat | V-vegetable | D-drink | F-fruits 
var foodType = String()
var food
var changed

func update_object(name):
	#Fruits
	if(name == "apple"): food = load("res://Models/Food Models/apple.glb")
	if(name == "coconut"): food = load("res://Models/Food Models/coconutHalf.glb")
	if(name == "cherry"): food = load("res://Models/Food Models/cherries.glb")
	if(name == "avocado"): food = load("res://Models/Food Models/avocado.glb")
	if(name == "orange"): food = load("res://Models/Food Models/orange.glb")
	if(name == "pear"): food = load("res://Models/Food Models/pear.glb")
	if(name == "pineapple"): food = load("res://Models/Food Models/pineapple.glb")
	if(name == "strawberry"): food = load("res://Models/Food Models/strawberry.glb")
	if(name == "watermelon"): food = load("res://Models/Food Models/watermelon.glb")
	
	#Vegetable
	if(name == "beet"): food = load("res://Models/Food Models/beet.glb")
	if(name == "broccoli"): food = load("res://Models/Food Models/broccoli.glb")
	if(name == "cabbage"): food = load("res://Models/Food Models/cabbage.glb")
	if(name == "cauliflower"): food = load("res://Models/Food Models/cauliflower.glb")
	if(name == "carrot"): food = load("res://Models/Food Models/carrot.glb")
	
	#Meat
	if(name == "bacon"): food = load("res://Models/Food Models/bacon.glb")
	if(name == "fish"): food = load("res://Models/Food Models/fish.glb")
	if(name == "sausage"): food = load("res://Models/Food Models/meatSausage.glb")
	if(name == "turkey"): food = load("res://Models/Food Models/turkey.glb")
	if(name == "drumstick"): food = load("res://Models/Food Models/wholerHam.glb")
	if(name == "skewer"): food = load("res://Models/Food Models/skewer.glb")
	
	#Drinks
	if(name == "soda"): food = load("res://Models/Food Models/sodaBottle.glb")
	if(name == "malt"): food = load("res://Models/Food Models/sodaCan.glb")
	if(name == "milk"): food = load("res://Models/Food Models/carton.glb")
	if(name == "red wine"): food = load("res://Models/Food Models/wineRed.glb")
	if(name == "white wine"): food = load("res://Models/Food Models/wineWhite.glb")
	
	#Cakes
	if(name == "cupcake"): food = load("res://Models/Food Models/cupcake.glb")
	if(name == "sundae"): food = load("res://Models/Food Models/sundae.glb")
	if(name == "cake 1"): food = load("res://Models/Food Models/cake.glb")
	if(name == "cake 2"): food = load("res://Models/Food Models/cakeBirthday.glb")
	
	changed = true
