extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("mouseClick"):
		self.global_position = Vector3(get_viewport().get_mouse_position().x, 1.15, get_viewport().get_mouse_position().y)



	

