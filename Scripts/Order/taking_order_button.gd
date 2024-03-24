extends Control
var mouseEnerted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("mouseClick") and mouseEnerted:
		get_tree().change_scene_to_file("res://Scenes/Order_screen/taking_an_order.tscn")


func _on_ordering_pressed():
	print("ahhhh")
	get_tree().change_scene_to_file("res://Scenes/Order_screen/taking_an_order.tscn")


func _on_mouse_entered():
	mouseEnerted = true
