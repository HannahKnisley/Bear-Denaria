extends Area2D
var mouseEnerted = false
var followMouse = false
var mouseCollide = false
var defaultPosition
var snapPos
var cupEntered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	defaultPosition = self.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and mouseEnerted:
		followMouse = true
	if Input.is_action_pressed("mouseClick") and followMouse:
		self.position = get_global_mouse_position()
		
	if Input.is_action_just_released("mouseClick"):
		followMouse = false

func _physics_process(delta):
	pass
func _on_mouse_entered():
	mouseEnerted = true


func _on_mouse_exited():
	mouseEnerted = false


func _on_plate_for_cup_mouse_entered():
	cupEntered = true

