extends Node2D
var counterr = false
var nameee = ["bob"]
var name_customer
var order

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	name_customer = nameee[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if counterr == false:
		translate(Vector2(-delta*55, 0))
	else:
		$/root/Order_screen/Order_button.visible = true


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print("owey")
	print(area_shape_index)
	counterr=true
