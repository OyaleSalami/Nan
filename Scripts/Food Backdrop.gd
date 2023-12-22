extends AnimatedSprite3D

var value = 0
var direction = true

func _process(delta):
	if (direction):
		translate(Vector3(1, 0, 0) * delta)
	else:
		translate(Vector3(-1, 0, 0) * delta)
	
	if(translation.x >= 100):
		change()
		
	if(translation.x <= -100):
		change()

func change():
	direction = !direction
	var rand  = randi() % 13
	frame = rand
