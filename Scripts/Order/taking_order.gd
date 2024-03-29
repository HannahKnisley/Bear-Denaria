extends Node2D
@export var ticket: PackedScene
var rng = RandomNumberGenerator.new()
var waitTime = 2

var pickyLevels = []
var ingredients = ["lettuce", "tomato", "onion", "cheese", "pickle"]
var pattyType = ["beef", "chicken"]

var newTicket
var toppingsAmount = 0

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
			
		
func takeOrder(customer):
	$name.text = customer.myName
	newTicket = ticket.instantiate()
	$/root/WorldRoot/CanvasLayer/MainUI/ticketContainer.add_child(newTicket)
	newTicket.myCustomer = customer
	
	toppingsAmount = rng.randi_range(1,5)
	
	await get_tree().create_timer(waitTime).timeout
	newTicket.takeOrder(rng.randi_range(0,4))
	await get_tree().create_timer(waitTime).timeout
	newTicket.takeOrder("bottomBun")
	await get_tree().create_timer(waitTime).timeout
	newTicket.takeOrder(pattyType[rng.randi_range(0,1)])
	await get_tree().create_timer(waitTime).timeout
	while toppingsAmount != 1:
		newTicket.takeOrder(ingredients[rng.randi_range(0,4)])
		await get_tree().create_timer(waitTime).timeout
		toppingsAmount -= 1
	newTicket.takeOrder("topBun")
	if rng.randi_range(0,1) == 1:
		await get_tree().create_timer(waitTime).timeout
		newTicket.takeOrder("fries")
	if rng.randi_range(0,1) == 1:
		await get_tree().create_timer(waitTime).timeout
		newTicket.takeOrder("drink")
	await get_tree().create_timer(waitTime*1.5).timeout
	$/root/WorldRoot/Camera.global_position =  $/root/WorldRoot/Order_screen.global_position + Vector2(500,350)
	$/root/WorldRoot/CanvasLayer/MainUI/screenButtons.visible = true
	$/root/WorldRoot/CanvasLayer/MainUI.atOrderScreen = true
	
	customer.orderTaken()
