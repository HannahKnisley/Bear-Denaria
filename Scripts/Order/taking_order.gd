extends Node2D

@export var ticket: PackedScene
@export var customer: PackedScene

var mouseIn = false
var rng = RandomNumberGenerator.new()
var waitTime = 1.5

var pickyLevels = []
var ingredients = ["lettuce", "tomato", "onion", "cheese", "pickle"]
var pattyType = ["beef", "chicken"]

var newTicket
var toppingsAmount = 0

func _ready():
	var mob = customer.instantiate()
	$orderLine.add_child(mob)
	mob.global_position = $orderLine.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $curCustomer.get_child_count() == 0 and $orderLine.get_child_count()>0:
		$orderLine.get_child(0).reparent($curCustomer)
		$button.visible = true
	
	if Input.is_action_just_pressed("mouseClick"):
		if mouseIn:
			takeOrder($curCustomer.get_child(0))
			
		
func takeOrder(customer):
	$bear.visible = false
	$bearWrite.visible = true
	$bearWrite.play()
	
	$button.visible = false
	$/root/WorldRoot/CanvasLayer/MainUI/screenButtons.visible = false
	$name.text = customer.myName
	newTicket = ticket.instantiate()
	$/root/WorldRoot/CanvasLayer/MainUI/ticketContainer.add_child(newTicket)
	newTicket.myCustomer = customer
	
	toppingsAmount = rng.randi_range(1,5)
	
	await get_tree().create_timer(waitTime).timeout
	$speechBubble.visible = true
	var picky = rng.randi_range(0,4)
	newTicket.takeOrder(picky)
	$speechBubble.get_child(picky).visible = true
	await get_tree().create_timer(waitTime).timeout
	$speechBubble.get_child(picky).visible = false
	
	newTicket.takeOrder("bottomBun")
	$speechBubble/bottomBun.visible = true
	await get_tree().create_timer(waitTime).timeout
	$speechBubble/bottomBun.visible = false
	
	var myPatty = rng.randi_range(0,1)
	newTicket.takeOrder(pattyType[myPatty])
	$speechBubble.get_child(myPatty+7).visible = true
	await get_tree().create_timer(waitTime).timeout
	$speechBubble.get_child(myPatty+7).visible = false
	
	while toppingsAmount != 1:
		var myTopping = rng.randi_range(0,4)
		newTicket.takeOrder(ingredients[myTopping])
		$speechBubble.get_child(myTopping+9).visible = true
		await get_tree().create_timer(waitTime).timeout
		$speechBubble.get_child(myTopping+9).visible = false
		toppingsAmount -= 1
		
	newTicket.takeOrder("topBun")
	$speechBubble/topBun.visible = true
	await get_tree().create_timer(waitTime).timeout
	$speechBubble/topBun.visible = false
	
	if rng.randi_range(0,1) == 1:
		newTicket.takeOrder("fries")
		$speechBubble/fry.visible = true
		await get_tree().create_timer(waitTime).timeout
		$speechBubble/fry.visible = false
		
	if rng.randi_range(0,1) == 1:
		newTicket.takeOrder("drink")
		$speechBubble/drink.visible = true
		await get_tree().create_timer(waitTime).timeout
		$speechBubble/drink.visible = false
	
	$speechBubble.visible = false
	await get_tree().create_timer(waitTime).timeout
	customer.reparent($/root/WorldRoot/givingOrder/waitLine)
	$/root/WorldRoot/CanvasLayer/MainUI/screenButtons.visible = true
	$bear.visible = true
	$bearWrite.visible = false


func _on_spawn_customer_timeout():
	if Globals.numCustomers < 5:
		var mob = customer.instantiate()
		$orderLine.add_child(mob)
		mob.global_position = $orderLine.global_position
		Globals.numCustomers += 1


func _on_button_mouse_entered():
	mouseIn = true


func _on_button_mouse_exited():
	mouseIn = false
