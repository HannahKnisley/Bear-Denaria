extends Area2D
var dragging = false
var of = Vector2(0,0)
var lifted = false
var mouseEnerted = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("mouseClick") and mouseEnerted:
		self.global_position = get_global_mouse_position()

func _on_button_button_down():
	dragging = true
	of = get_global_mouse_position() - global_position


func _on_button_button_up():
	dragging = false




func _unhandled_input(event):
	if event is InputEventMouseButton and not event.pressed:
		lifted = false
	if lifted and event is InputEventMouseMotion:
		position += event.relative
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		lifted = true
	


func _on_mouse_entered():
	mouseEnerted = true
