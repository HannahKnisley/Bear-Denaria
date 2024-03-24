extends Area2D


var counterr = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if counterr == false:
		translate(Vector2(-delta*45, 0))
	else:
		pass
	










func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print(area_shape_index)
	counterr = true 
	if(area_shape_index == 0):
		$/root/Order_screen/Order_button.visible = true
	



