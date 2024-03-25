extends Control
var mouseEnerted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass






func _on_mouse_entered():
	mouseEnerted = true


func _on_ordering_pressed():
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/taking_an_order.global_position + Vector2(576,324)
	$/root/WorldRoot/taking_an_order.visible = true
	$/root/WorldRoot/CanvasLayer/TakingOrderButton.visible = false
	var name_of_customer = get_node("/root/Globals")
	name_of_customer.pressed_order = true

