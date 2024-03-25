extends Area2D
var dragging = false
var of = Vector2(0,0)
var lifted = false
var mouseEnerted = false
var followMouse = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and mouseEnerted:
		followMouse = true
	if Input.is_action_pressed("mouseClick") and followMouse:
		self.position = get_local_mouse_position()
	if Input.is_action_just_released("mouseClick"):
		followMouse = false
		self.position = Vector2(0,0)
	


func _on_mouse_entered():
	mouseEnerted = true


func _on_mouse_exited():
	mouseEnerted = false
