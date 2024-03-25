extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_order_button_pressed():
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/Order_screen.global_position + Vector2(1000,700)


func _on_grill_button_pressed():
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/GrillArea.global_position + Vector2(1000,700)
	$/root/WorldRoot/CanvasLayer/TakingOrderButton.visible = false
	$/root/WorldRoot/Order_screen/Order_button.visible = false

func _on_build_button_pressed():
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/build_area.global_position + Vector2(576,324)
	$/root/WorldRoot/CanvasLayer/TakingOrderButton.visible = false
