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
	var name_of_customer = get_node("/root/Globals")
	name_of_customer.customertype = "nice"
	if counterr == false:
		translate(Vector2(-delta*55, 0))
		


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if area.is_in_group("counter") or area.is_in_group("customer"):
		print("owey")
		print(area_shape_index)
		counterr=true
	if area.is_in_group("counter"):
		$takeOrder.visible = true


func _on_take_order_pressed():
	$/root/WorldRoot/Camera.global_position =  $/root/WorldRoot/taking_an_order.global_position + Vector2(500,350)
	var name_of_customer = get_node("/root/Globals")
	name_of_customer.pressed_order = true
