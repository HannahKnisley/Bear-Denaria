extends Node2D
var entered = false
var followMouse = false
var onPlate = false
@export var cookie: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with functio


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and entered and onPlate == false:
		followMouse = true
	if Input.is_action_pressed("mouseClick") and followMouse and onPlate == false:
		self.global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("mouseClick"):
		followMouse = false
	






func _on_mouse_entered():
	entered = true


func _on_mouse_exited():
	entered = false


func _on_body_entered(body):
	print(body)
	
