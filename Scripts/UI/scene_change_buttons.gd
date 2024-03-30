extends Control

var atOrderScreen = true
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.budget = rng.randi_range(3,8)*10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if atOrderScreen and Globals.customerAtCounter:
		$takeOrder.visible = true
	else:
		$takeOrder.visible = false
		
	$budget/budgetNum.text = "$"+str(Globals.budget)



func _on_order_button_pressed():
	atOrderScreen = true	
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/Order_screen.global_position + Vector2(500,350)
	$ticketCollect.visible = false
	$ticketCollect/CollisionShape2D.disabled = true


func _on_grill_button_pressed():
	atOrderScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/GrillArea.global_position + Vector2(500,350)
	$ticketCollect.visible = false
	$ticketCollect/CollisionShape2D.disabled = true

func _on_build_button_pressed():
	atOrderScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/build_area.global_position + Vector2(500,350)
	$ticketCollect.visible = false
	$ticketCollect/CollisionShape2D.disabled = true



func _on_take_order_pressed():
	atOrderScreen = false
	$screenButtons.visible = false
	$/root/WorldRoot/Camera.global_position =  $/root/WorldRoot/taking_an_order.global_position + Vector2(500,350)
	$/root/WorldRoot/taking_an_order.takeOrder(Globals.firstCustomer)
	$ticketCollect.visible = false
	$ticketCollect/CollisionShape2D.disabled = true
	


func _on_fry_button_pressed():
	atOrderScreen = false
	$ticketCollect.visible = false
	$ticketCollect/CollisionShape2D.disabled = true
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/fryArea.global_position + Vector2(500,350)


func _on_drink_button_pressed():
	atOrderScreen = false
	$/root/WorldRoot/Camera.global_position = $/root/WorldRoot/drinkArea.global_position + Vector2(500,350)
	if Globals.readyForTicket:
		$ticketCollect.visible = true
		$ticketCollect/CollisionShape2D.disabled = false


