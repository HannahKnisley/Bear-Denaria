extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_grill_pressed():
	get_tree().change_scene_to_file("res://Scenes/GrillArea/grill_area.tscn")


func _on_order_pressed():
	get_tree().change_scene_to_file("res://Scenes/Order_screen/order_screen.tscn")
