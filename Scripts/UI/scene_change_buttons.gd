extends Control

var atOrderScreen = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if atOrderScreen and Globals.customerAtCounter:
		$takeOrder.visible = true
	else:
		$takeOrder.visible = false


func _on_order_button_pressed():
	atOrderScreen = true	
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/Order_screen.global_position + Vector2(500,350)


func _on_grill_button_pressed():
	atOrderScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/GrillArea.global_position + Vector2(500,350)

func _on_build_button_pressed():
	atOrderScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/build_area.global_position + Vector2(500,350)



func _on_take_order_pressed():
	atOrderScreen = false
	$screenButtons.visible = false
	$/root/WorldRoot/Camera.global_position =  $/root/WorldRoot/taking_an_order.global_position + Vector2(500,350)
	$/root/WorldRoot/taking_an_order.takeOrder(Globals.firstCustomer)
	


func _on_fry_button_pressed():
	atOrderScreen = false


func _on_drink_button_pressed():
	atOrderScreen = false
