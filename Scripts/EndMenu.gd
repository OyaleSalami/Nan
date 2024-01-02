extends Spatial

var xRotSpeed = 0
var yRotSpeed = 0

func _process(delta):
	xRotSpeed = clamp(xRotSpeed, -1, 1)
	yRotSpeed = clamp(yRotSpeed, -1, 1)
	
	get_node("Anchor/Sphere").rotate(Vector3(0,1,0), xRotSpeed * 0.75 * delta) #X Axis
	get_node("Anchor/Sphere").rotate(Vector3(1,0,0), yRotSpeed * 0.75 * delta) #Y Axis

func _input(event):
	if event is InputEventMouseMotion:
		xRotSpeed = event.relative.x
		yRotSpeed = event.relative.y
		
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("UI/Label").text += String(int(GameManager.store))
	
func _on_Exit_Button_button_up():
	get_tree().change_scene("res://Scenes/Menu.tscn")
