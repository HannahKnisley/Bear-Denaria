extends Area2D

var myCustomer
var ingredientNum = 0
var myOrder = []

var takingOrder = true
var mouseIn = false
var holding = false

var onLine = false
var onBig = true

var myArea

var snapPos

# Called when the node enters the scene tree for the first time.
func _ready():
	snapPos = $/root/WorldRoot/CanvasLayer/MainUI/OrderLine/bigHold.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and mouseIn:
		holding = true
	if Input.is_action_pressed("mouseClick") and holding:
		self.global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("mouseClick") and holding:
		holding = false
		if onLine:
			self.scale = Vector2(1,1)
			snapPos.x = self.global_position.x
			snapPos.y = myArea.global_position.y
		elif onBig:
			self.scale = Vector2(3,3)
			snapPos = myArea.global_position
			
	elif !Input.is_action_pressed("mouseClick"):
		self.translate((snapPos-self.global_position)*delta*10)


func takeOrder(ingredient):
	if ingredientNum == 0 and ingredient == "bottomBun":
		$ColorRect/Item1/BottomBun.visible = true
	if ingredientNum == 1 and ingredient == "beef":
		$ColorRect/Item2/beefPatty.visible = true
	elif ingredientNum == 1:
		$ColorRect/Item2/chickenPatty.visible = true
	
	if ingredientNum > 1 and ingredient == "lettuce":
		$ColorRect.get_child(ingredientNum).get_child(0)
	elif ingredientNum > 1 and ingredient == "tomato":
		$ColorRect.get_child(ingredientNum).get_child(1)
	elif ingredientNum > 1 and ingredient == "pickle":
		$ColorRect.get_child(ingredientNum).get_child(2)
	elif ingredientNum > 1 and ingredient == "onion":
		$ColorRect.get_child(ingredientNum).get_child(3)
	elif ingredientNum > 1 and ingredient == "cheese":
		$ColorRect.get_child(ingredientNum).get_child(4)
	elif ingredientNum > 1 and ingredient == "topBun":
		$ColorRect.get_child(ingredientNum).get_child(5)
	
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
		


func _on_area_exited(area):
	if area.is_in_group("line"):
		onLine = false
	elif area.is_in_group("bigHold"):
		onBig = false
