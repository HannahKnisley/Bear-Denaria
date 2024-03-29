extends Area2D

var rng = RandomNumberGenerator.new()

var myCustomer
var ingredientNum = 0
var myOrder = []
var myOrderNum

var takingOrder = true
var mouseIn = false
var holding = false

var onLine = false
var onBig = true

var myArea
var ticketColliding

var snapPos 

var onCollection = false
var canHold = true

var pickyLevel = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	myOrderNum = Globals.numOrders
	Globals.numOrders += 1
	var ticketPick = rng.randi_range(0,2)
	$tickets.get_child(ticketPick).visible = true
	snapPos = $/root/WorldRoot/CanvasLayer/MainUI/OrderLine/bigHold.global_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and mouseIn:
		holding = true
	if Input.is_action_pressed("mouseClick") and holding and canHold:
		self.global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("mouseClick") and holding and canHold:
		holding = false
		if onLine:
			self.scale = Vector2(1,1)
			snapPos.x = self.global_position.x
			snapPos.y = myArea.global_position.y
		elif onBig:
			self.scale = Vector2(3,3)
			snapPos = myArea.global_position
		if onCollection:
			self.scale = Vector2(1,1)
			self.reparent($/root/WorldRoot/drinkArea/curTray.get_child(0))
			canHold = false
			
	elif !Input.is_action_pressed("mouseClick") and canHold:
		self.translate((snapPos-self.global_position)*delta*10)
		
	


func takeOrder(ingredient):
	print(ingredient)
	if ingredientNum == 0:
		$pickyness.get_child(ingredient).visible = true
		pickyLevel = ingredient
	if ingredientNum == 1 and ingredient == "bottomBun":
		$ticketItems/Item1/BottomBun.visible = true
	if ingredientNum == 2 and ingredient == "beef":
		$ticketItems/Item2/beefPatty.visible = true
	elif ingredientNum == 2 and ingredient == "chicken":
		$ticketItems/Item2/chickenPatty.visible = true
	
	if ingredientNum > 2 and ingredient == "lettuce":
		$ticketItems.get_child(ingredientNum-1).get_child(0).visible = true
	elif ingredientNum > 2 and ingredient == "tomato":
		$ticketItems.get_child(ingredientNum-1).get_child(1).visible = true
	elif ingredientNum > 2 and ingredient == "pickle":
		$ticketItems.get_child(ingredientNum-1).get_child(2).visible = true
	elif ingredientNum > 2 and ingredient == "onion":
		$ticketItems.get_child(ingredientNum-1).get_child(3).visible = true
	elif ingredientNum > 2 and ingredient == "cheese":
		$ticketItems.get_child(ingredientNum-1).get_child(4).visible = true
	elif ingredientNum > 2 and ingredient == "topBun":
		$ticketItems.get_child(ingredientNum-1).get_child(5).visible = true
	
	if ingredientNum > 3 and ingredient == "fries":
		$ticketItems/fries.visible = true
	elif ingredientNum > 3 and ingredient == "drink":
		$ticketItems/drink.visible = true
	
	myOrder.append(ingredient)
	ingredientNum += 1
	


func _on_mouse_entered():
	mouseIn = true


func _on_mouse_exited():
	mouseIn = false



func _on_area_entered(area):
	myArea = area
	if area.is_in_group("line"):
		onLine = true
	elif area.is_in_group("bigHold"):
		onBig = true
	elif area.is_in_group("ticket"):
		if area.myOrderNum < myOrderNum: 
			area.input_pickable = false
			ticketColliding = area
	elif area.is_in_group("ticketCollect"):
		onCollection = true


func _on_area_exited(area):
	if area.is_in_group("line"):
		onLine = false
	elif area.is_in_group("bigHold"):
		onBig = false
	elif area.is_in_group("ticket"):
		if area == ticketColliding: 
			area.input_pickable = true
	elif area.is_in_group("ticketCollect"):
		onCollection = false
