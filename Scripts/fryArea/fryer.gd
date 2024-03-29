extends Area2D

var holdingFries = false
var myFries

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick") and holdingFries:
		myFries.reparent(self)
		$cookTimer.start()


func _on_area_entered(area):
	if !holdingFries:
		myFries = area
		holdingFries = true
		
	


func _on_area_exited(area):
	if area == myFries:
		holdingFries = false



func _on_cook_timer_timeout():
	myFries.cook()
	$cookingMeter.doStep()


func _on_child_exiting_tree(node):
	$cookTimer.stop()
	$cookingMeter.reset()
