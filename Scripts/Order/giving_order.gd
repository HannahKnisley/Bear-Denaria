extends Node2D

var maxScore = 0
var myScore = 0
var pickyLevels = [25,40,55,70,85]
var myPickyLevel = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func giveOrder(ticket):
	$/root/WorldRoot/CanvasLayer/MainUI/screenButtons.visible = false
	$/root/WorldRoot/Camera.global_position = self.global_position + Vector2(500,350)
	var customer = ticket.myCustomer
	$name.text = customer.myName
	
	#["lettuce", "tomato", "onion", "cheese", "pickle"]
	#ar pattyType = ["beef", "chicken"] bottomBun
	#Calculate max score
	for item in ticket.myOrder:
		if typeof(item) == TYPE_INT:
			myPickyLevel = pickyLevels[item]
		else:
			if item == "topBun" or item == "bottomBun":
				maxScore += 10
			elif item == "lettuce" or item =="tomato" or item=="onion" or item=="cheese" or item=="pickle":
				maxScore += 18
			elif item=="beef" or item=="chicken":
				maxScore += 24
			elif item=="fries" or item=="drink":
				maxScore += 20
				
	var count = 1
	for child in $curTray.get_child(0).get_children():
		if child.is_in_group("theBurger"):
			for item in child.get_children():
				if item.is_in_group(ticket.myOrder[count]):
					if ticket.myOrder[count] == "topBun" or ticket.myOrder[count] == "bottomBun":
						if item.is_in_group("trash"):
							myScore += 5
						else:
							myScore += 10
					elif ticket.myOrder[count] == "lettuce" or ticket.myOrder[count] =="tomato" or ticket.myOrder[count]=="onion" or ticket.myOrder[count]=="cheese" or ticket.myOrder[count]=="pickle":
						if item.is_in_group("trash"):
							myScore += 9
						else:
							myScore += 18
					elif ticket.myOrder[count]=="beef" or ticket.myOrder[count]=="chicken":
						if item.is_in_group("trash"):
							myScore += 12
						else:
							myScore += 24
					elif ticket.myOrder[count]=="fries" or ticket.myOrder[count]=="drink":
						if item.is_in_group("trash"):
							myScore += 10
						else:
							myScore += 20
				count+=1	
				
		elif child.is_in_group("fries"):
			if "fries" in ticket.myOrder:
				if child.is_in_group("trash"):
					myScore += 10
				else:
					myScore += 20
		elif child.is_in_group("drink"):
			if "drink" in ticket.myOrder:
				if child.is_in_group("trash"):
					myScore += 10
				else:
					myScore += 20
					
	var totalScore = myScore/maxScore
	while totalScore > 0:
		$qualityMeter.doStep()
		await get_tree().create_timer(0.1).timeout
		totalScore -= 1
		
	totalScore = myScore/maxScore
	if totalScore >= myPickyLevel:
		print("WIN!")
	else:
		print("Lose :(")
	
	
