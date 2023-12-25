extends Spatial

var xRotSpeed = 0
var yRotSpeed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	xRotSpeed = clamp(xRotSpeed, -1, 1)
	yRotSpeed = clamp(yRotSpeed, -1, 1)
	
	get_node("Anchor/Sphere").rotate(Vector3(0,1,0), xRotSpeed * 0.75 * delta) #X Axis
	get_node("Anchor/Sphere").rotate(Vector3(1,0,0), yRotSpeed * 0.75 * delta) #Y Axis

func _input(event):
	if event is InputEventMouseMotion:
		xRotSpeed = event.relative.x
		yRotSpeed = event.relative.y

func _on_play_button_up():
	get_tree().change_scene("res://Scenes/Share.tscn")

func _on_credit_button_up():
	get_tree().change_scene("res://Scenes/Credits.tscn")

func _on_exit_button_up():
	get_tree().change_scene("res://Scenes/Menu.tscn")
